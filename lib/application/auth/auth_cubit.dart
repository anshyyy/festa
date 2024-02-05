import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/country_info.dart';
import '../../domain/auth/auth_repository.dart';
import '../../infrastructure/auth/i_auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState);

  void loginWithApple() {}

  void loginWithGoogle() {}

  void loginWithPhone() {
    emit(state.copyWith(
      loginWithPhone: true,
    ));
  }

  void onDialCodeChange({required String dialCode, required String locale}) {
    emit(
      state.copyWith(
        selectedDialCode: dialCode,
        selectedLocale: locale,
      ),
    );
  }

  void onPhoneChange({required String text}) {
    if (text.length >= 6) {
      emit(state.copyWith(isLoginEnabled: true));
    } else {
      emit(state.copyWith(isLoginEnabled: false));
    }
  }

  void requestOtp() async {
    emit(state.copyWith(isLoading: true));
    Completer<String?> otpAutoFill = Completer<String?>();

    otpAutoFill.future.then((otp) => {
          if (otp != null) {state.otpController.text = otp}
        });

    Either<String, String> response = await state.authRepository.requestOtp(
      mobileNumber: state.phoneController.text,
      dialCode: state.selectedDialCode.toString(),
      otpAutoFill: otpAutoFill,
    );

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isOTPSentFailed: true,
        isOTPSentSuccessful: false,
        isLoginSuccess: false,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isOTPSentFailed: false,
        isOTPSentSuccessful: true,
        isLoginSuccess: true,
      ));
    });
  }

  void verifyOtp() async {
    emit(state.copyWith(isLoading: true));
  }
}
