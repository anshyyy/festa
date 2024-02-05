import 'dart:async';

import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // Future<User?> authenticateUser();
  Future<Either<String, String>> requestOtp({
    required String mobileNumber,
    required String dialCode,
    required Completer<String?> otpAutoFill,
  });

  Future<Either<String, String>> verifyOtp ({
    required String mobileNumber,
    required String dialCode,
    required String verificationCode,
    required String code,
  });
}
