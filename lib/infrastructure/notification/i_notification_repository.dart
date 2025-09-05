import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/notification/notification_repository.dart';
import 'dtos/notification/notification_dto.dart';

class INotificationRepository extends NotificationRepository {
  final String serverUrl;
  INotificationRepository({required this.serverUrl});

  @override
  Future<Either<String, List<NotificationDto>>> getNotification() async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${NotificationConstants.getNotification}';
      final response = await RESTService.performGETRequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
      );

      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }

      final rawNotification = jsonDecode(response.body) as List;
      List<NotificationDto> notifications = [];
      for (var notification in rawNotification) {
        notifications.add(NotificationDto.fromJson(notification));
      }

      // List<NotificationDto> notifications =
      //     rawNotification.map((e) => NotificationDto.fromJson(e)).toList();

      return right(notifications);
    } catch (e) {
      return left(e.toString());
    }
  }
}
