import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../domain/auth/auth_respository.dart';
import '../../domain/core/constants/string_constants.dart';

class IAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Completer<bool>? completer;
  FirebaseAuthException? _verifyPhoneException;
  String? _verificationCode;

  final String apiBaseUrl;

  IAuthRepository({required this.apiBaseUrl});

  @override
  Future<Either<String, String>> requestOtp({
    required String mobileNumber,
    required String dialCode,
    required Completer<String?> otpAutoFill,
  }) async {
    debugPrint(mobileNumber);
    debugPrint(dialCode);
    try {
      completer = Completer<bool>();

      String updatedMobileNumber = mobileNumber.trim();
      updatedMobileNumber = '$dialCode$updatedMobileNumber';
      _verifyPhoneException = null;

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: updatedMobileNumber,
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
      debugPrint(error.toString());
      if (error.code == 'invalid-phone-number') {
        return left(ErrorConstants.invalidMobileNumberError);
      }
      return left(ErrorConstants.unexpectedForMobileNumberError);
    } catch (error) {
      return left(ErrorConstants.unexpectedForMobileNumberError);
    }
  }

  Future<Either<String, String>> verifyOtp({
    required String mobileNumber,
    required String dialCode,
    required String verificationCode,
    required String code,
  }) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: verificationCode,
      smsCode: code,
    );

    final user =
        await FirebaseAuth.instance.signInWithCredential(authCredential).then(
              (value) => value.user,
            );

    String uid = user!.uid;
    if (uid != null) {
      return right(uid);
    }
    return left(uid);
  }
}
