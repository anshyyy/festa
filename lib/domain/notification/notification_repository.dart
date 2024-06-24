import 'package:dartz/dartz.dart';

import '../../infrastructure/notification/dtos/notification/notification_dto.dart';

abstract class NotificationRepository {
  Future<Either<String, List<NotificationDto>>> getNotification();
}
