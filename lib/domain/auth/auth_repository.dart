import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // Future<User?> authenticateUser();
  Future<Either<String, String>> requestOtp({
    required String mobileNumber,
    required String dialCode,
  });

  Future<Either<String, String>> verifyOtp ({
    required String verificationCode,
    required String code,
  });

  Future<Either<String, File>> selectImage();

  Future loginWithGoogle();
}
