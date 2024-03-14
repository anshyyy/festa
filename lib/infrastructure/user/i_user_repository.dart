import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/user/user_repository.dart';
import '../auth/dtos/user_dto.dart';

class IUserRepository extends UserRepository {
  final String serverUrl;
  IUserRepository({required this.serverUrl});

  @override
  Future<Either<String, UserDto>> patchProfile(
      {required Map<String, dynamic> input}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${EventApiConstants.USERS}';
      final response = await RESTService.performPATCHRequest(
          httpUrl: url, isAuth: true, token: token!, body: jsonEncode(input));
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(response.body);
      return right(UserDto.fromJson(data));
    } catch (error) {
      return left(ErrorConstants.networkUnavailable);
    }
  }

  
}
