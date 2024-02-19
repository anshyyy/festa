import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/auth/auth_repository.dart';
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
  }) async {
    try {
      completer = Completer<bool>();

      String updatedMobileNumber = mobileNumber.trim();
      updatedMobileNumber = '$dialCode$updatedMobileNumber';
      _verifyPhoneException = null;

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: updatedMobileNumber,
        verificationCompleted: (authCredential) {
          // if (!otpAutoFill.isCompleted) {
          //   otpAutoFill.complete(authCredential.smsCode);
          // }
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

  @override
  Future<Either<String, String>> verifyOtp({
    required String verificationCode,
    required String code,
  }) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: code,
      );

      final user =
          await FirebaseAuth.instance.signInWithCredential(authCredential).then(
                (value) => value.user,
              );

      String uid = user!.uid;
      return right(uid);
      return left(uid);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-verification-code') {
        return left(ErrorConstants.wrongOTP);
      } else if (error.code == 'session-expired') {
        return left(ErrorConstants.sessionExpired);
      }
      return left(ErrorConstants.failedToLogin);
    } catch (error) {
      return left(ErrorConstants.failedToLogin);
    }
  }

  @override
  Future<Either<String, File>> selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return left('No File Selected');

    final path = image.path;
    final file = File(path);

    return right(file);
  }

  @override
  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final user = await _firebaseAuth.signInWithCredential(credential);
    } on Exception {}
  }
}
