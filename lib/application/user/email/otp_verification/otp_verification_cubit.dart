import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/user/user_repository.dart';
import '../../../../infrastructure/user/i_user_repository.dart';

part 'otp_verification_cubit.freezed.dart';
part 'otp_verification_state.dart';

class EmailOtpVerificationCubit extends Cubit<OtpVerificationState> {
  EmailOtpVerificationCubit(super.initialState);

  void verifyOtp() async {
    emit(state.copyWith(isLoading: true));
    final isVerified = await state.userRepository
        .verifyOtp(email: state.emailAddress, otp: state.otpController.text);
    if (isVerified) {
      emit(state.copyWith(
        isLoading: false,
        isOTPVerificationSuccessful: true,
        isOTPVerificationFailed:false,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isOTPVerificationSuccessful: false,
        isOTPVerificationFailed:true,
      ));
    }
  }

  void resendOtpToEmail() async {
    emit(state.copyWith(
      isLoading: true,
      showResendOtp: false,
    ));
    await state.userRepository.sendOtpToEmail(email: state.emailAddress);
    emit(state.copyWith(
      isLoading: false,
    ));
  }

  void coundownFinished() {
    emit(state.copyWith(showResendOtp: true));
  }
}
