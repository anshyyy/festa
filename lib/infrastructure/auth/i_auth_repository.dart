import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/auth/auth_repository.dart';
import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import 'dtos/user_dto.dart';

class IAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Completer<bool>? completer;
  FirebaseAuthException? _verifyPhoneException;
  String? _verificationCode;

  final String serverUrl;

  IAuthRepository({required this.serverUrl});

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
  Future<Either<String, UserDto>> verifyOtp({
    required String verificationCode,
    required String code,
  }) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: code,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential).then(
            (value) => value.user,
          );

      UserDto userInfo = (await authentication())!;
      return right(userInfo);
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
  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } on Exception {}
  }

  @override
  Future<UserDto?> authentication() async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      if(token==null){
        return null;
      }
      final url = '$serverUrl${EventApiConstants.GET_USER_DETAILS}';
      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data['userDetails']);
    } catch (error) {
      return null;
    }
  }

  @override
  Future<Either<String, UserDto>> patchProfile({
    required Map<String, dynamic> input,
  }) async {
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

  @override
  Future<bool> deleteProfile({required int id}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${EventApiConstants.USERS}/$id';
      final response = await RESTService.performDELETERequest(
        httpUrl: url,
        isAuth: true,
        token: token!,
      );
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout({bool skipFCMToken = false}) async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
