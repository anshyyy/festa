part of 'verify_otp_cubit.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailed,
    required TextEditingController otpController,
    required String? verificationCode,
    required String? otpCode,
  }) = _VerifyOtpState;

  factory VerifyOtpState.initial(
          {required verificationCode, required otpCode}) =>
      VerifyOtpState(
        isLoading: false,
        isSuccess: false,
        isFailed: false,
        otpController: TextEditingController(),
        verificationCode: verificationCode,
        otpCode: otpCode,
      );
}
