import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/country_info.dart';
import '../../domain/auth/auth_repository.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../infrastructure/auth/i_auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState);

  void loginWithApple() {}

  void loginWithGoogle() async{
    await state.authRepository.loginWithGoogle();
  }

  void loginWithPhone() {
    emit(state.copyWith(
      loginWithPhone: true,
    ));
  }

  void emitFromAnywhere({
    required AuthState state,
  }) {
    emit(state);
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
    if (text.length == 10) {
      emit(state.copyWith(isLoginEnabled: true));
    } else {
      emit(state.copyWith(isLoginEnabled: false));
    }
  }

  void requestOtp() async {
    emit(state.copyWith(isLoading: true));

    Either<String, String> response = await state.authRepository.requestOtp(
      mobileNumber: state.phoneController.text,
      dialCode: state.selectedDialCode.toString(),
    );

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isOTPSentFailed: true,
        isOTPSentSuccessful: false,
        isLoginSuccess: false,
        errorMessage: l,
      ),);
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isOTPSentFailed: false,
        isOTPSentSuccessful: true,
        isLoginSuccess: true,
        errorMessage: LoginScreenConstants.otpSend,
        verificationCode: r,
      ));
    });
  }


}
