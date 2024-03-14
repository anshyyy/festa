import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../infrastructure/auth/dtos/user_dto.dart';

abstract class AuthRepository {
  // Future<User?> authenticateUser();
  Future<Either<String, String>> requestOtp({
    required String mobileNumber,
    required String dialCode,
  });

  Future<Either<String, UserDto>> verifyOtp({
    required String verificationCode,
    required String code,
  });


  Future loginWithGoogle();
  Future<UserDto?> authentication();

  // Future<Either<String, UserDto>> patchProfile({
  //   required Map<String, dynamic> input,
  // });

  Future<bool> deleteProfile({required int id});

  Future<bool> logout({bool skipFCMToken});

  Future<String?> getFCMToken();

  Future addOrRemoveFCMTokenToServer({
    required String token,
    required String fcmToken,
    required bool isRemove,
  });
  
}
