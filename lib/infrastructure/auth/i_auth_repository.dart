import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth/auth_respository.dart';
import '../../domain/core/constants/string_constants.dart';

class IAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Completer<bool>? completer;
  FirebaseAuthException? _verifyPhoneException;
  String? _verificationCode;

  final String serverBaseUrl;

  IAuthRepository({required this.serverBaseUrl});

  @override
  Future<Either<String, String>> requestOtp({
    required String mobileNumber,
    required String dialCode,
    required Completer<String?> otpAutoFill,
  }) async {
    try {
      completer = Completer<bool>();

      String updatedMobileNumber = mobileNumber.trim();
      updatedMobileNumber = '$dialCode$updatedMobileNumber';
      _verifyPhoneException = null;

      await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (authCredential) {
          if (!otpAutoFill.isCompleted) {
            otpAutoFill.complete(authCredential.smsCode);
          }
        },
        verificationFailed: (FirebaseAuthException exeption) {
          _verifyPhoneException = exeption;
          if (!completer!.isCompleted) completer!.complete(false);
        },
        codeSent: (verificationCode, [code]) {
          _verificationCode = verificationCode;
          if (!completer!.isCompleted) completer!.complete(true);
        },
        codeAutoRetrievalTimeout: (verificationCode) {
          _verificationCode = verificationCode;
          if (!completer!.isCompleted) completer!.complete(true);
        },
      );

      final bool status = await completer!.future;

      if (status) {
        return right(_verificationCode ?? '');
      } else {
        throw FirebaseAuthException(code: _verifyPhoneException!.code);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-phone-number') {
        return left(ErrorConstants.invalidMobileNumberError);
      }
      return left(ErrorConstants.unexpectedForMobileNumberError);
    } catch (error) {
      return left(ErrorConstants.unexpectedForMobileNumberError);
    }
  }
}
