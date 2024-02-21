import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../domain/auth/auth_repository.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/auth/i_auth_repository.dart';

part 'verify_otp_state.dart';
part 'verify_otp_cubit.freezed.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(super.initialState);

  void coundownFinished() {
    emit(state.copyWith(showResendButton: true));
  }

  void emitFromAnywhere({
    required VerifyOtpState state,
  }) {
    emit(state);
  }

  void onOtpChange() {
    if (state.otpController.text.length < 6) {
      emit(state.copyWith(isVerifyEnabled: false));
    } else {
      emit(state.copyWith(isVerifyEnabled: true));
    }
  }

  void resendOtp() async {
    emit(state.copyWith(
      isVerifyEnabled: false,
      showResendButton: false,
    ));

    Either<String, String> response = await state.authRepository.requestOtp(
      mobileNumber: state.phoneNumber,
      dialCode: state.dialCode,
    );

    response.fold(
        (l) => emit(
              state.copyWith(
                isOTPSentSuccessful: false,
                isOTPSentFailed: true,
                errorMessage: l,
              ),
            ), (r) {
      state.countdownController.start();
      emit(
        state.copyWith(
          verificationCode: r,
          isOTPSentSuccessful: true,
          isOTPSentFailed: false,
          // isVerifyEnabled: true,
          errorMessage: LoginScreenConstants.otpSend,
        ),
      );
    });
  }

  void verifyOtp() async {
    emit(state.copyWith(isLoading: true));

    Either<String, UserDto> response = await state.authRepository.verifyOtp(
      verificationCode: state.verificationCode!,
      code: state.otpController.text,
    );

    response.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        isOTPVerificationSuccessful: false,
        isOTPVerificationFailed: true,
        errorMessage: l,
      )),
      (r) {
        return emit(state.copyWith(
          isLoading: false,
          user: r,
          isOTPVerificationSuccessful: true,
          isOTPVerificationFailed: false,
          errorMessage: LoginScreenConstants.success,
        ));
      },
    );
  }

  void onGoBack() {
    emit(state.copyWith(
      backToAuth: true,
    ));
  }
}
