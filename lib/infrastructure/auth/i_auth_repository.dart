import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/auth/auth_repository.dart';
import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import 'dtos/user_dto.dart';
import 'package:http/http.dart' as http;

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

      final user =
          await FirebaseAuth.instance.signInWithCredential(authCredential).then(
                (value) => value.user,
              );

      UserDto userInfo = (await authentication())!;
      final String? fcmToken = await getFCMToken();

      if (fcmToken != null) {
        final String? token = await user?.getIdToken();
        addOrRemoveFCMTokenToServer(
            token: token!, fcmToken: fcmToken, isRemove: false);
      }
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
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      print(token);
      if (token == null) {

        return null;
      }
      final url = '$serverUrl${EventApiConstants.GET_USER_DETAILS}';
      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token);
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data);
    } catch (error) {
      return null;
    }
  }

  // @override
  // Future<Either<String, UserDto>> patchProfile({
  //   required Map<String, dynamic> input,
  // }) async {
  //   try {
  //     final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
  //     final url = '$serverUrl${EventApiConstants.USERS}';
  //     final response = await RESTService.performPATCHRequest(
  //         httpUrl: url, isAuth: true, token: token!, body: jsonEncode(input));
  //     if (response.statusCode != 200) {
  //       throw ErrorConstants.unknownNetworkError;
  //     }
  //     final data = jsonDecode(response.body);
  //     return right(UserDto.fromJson(data));
  //   } catch (error) {
  //     return left(ErrorConstants.networkUnavailable);
  //   }
  // }

  @override
  Future<bool> deleteProfile({required int id}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      final url = '$serverUrl${AuthApiConstants.USERS}';
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
      final user = FirebaseAuth.instance.currentUser!;
      final String? fcmToken = await getFCMToken();
      if (fcmToken != null) {
        final String? token = await user.getIdToken();
        await addOrRemoveFCMTokenToServer(
            token: token!, fcmToken: fcmToken, isRemove: true);
      }
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getFCMToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  @override
  Future addOrRemoveFCMTokenToServer(
      {required String token,
      required String fcmToken,
      required bool isRemove}) async {
    try {
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final String url =
          '$serverUrl${AuthApiConstants.ADD_OR_REMOVE_FCM_TOKEN}';
      var request = http.Request(isRemove ? 'DELETE' : 'POST', Uri.parse(url));

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      String deviceName = '';

      if (Platform.isAndroid) {
        AndroidDeviceInfo android = await deviceInfo.androidInfo;
        deviceName = android.model;
      }

      if (Platform.isIOS) {
        IosDeviceInfo ios = await deviceInfo.iosInfo;
        deviceName = ios.name;
      }

      final jsonBody = {
        'token': fcmToken,
        'deviceDetails': {'name': deviceName},
      };

      request.body = json.encode(jsonBody);
      request.headers.addAll(headers);
      await request.send();
    } catch (e) {
      left(e.toString());
    }
  }
}
