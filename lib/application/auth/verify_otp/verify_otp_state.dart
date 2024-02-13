part of 'verify_otp_cubit.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState({
    required bool isLoading,
    required bool isOTPVerificationSuccessful,
    required bool isOTPVerificationFailed,
    required TextEditingController otpController,
    required String? verificationCode,
    required String? apiBaseUrl,
    required AuthRepository authRepository,
    required String dialCode,
    required String phoneNumber,
    required CountdownController countdownController,
    required bool showResendButton,
    required String errorMessage,
    required bool isVerifyEnabled,
    required bool backToAuth,
    required bool isOTPSentSuccessful,
    required bool isOTPSentFailed,
  }) = _VerifyOtpState;

  factory VerifyOtpState.initial({
    required String dialCode,
    required String phoneNumber,
    required String verificationCode,
    required String apiBaseUrl,
  }) =>
      VerifyOtpState(
        isLoading: false,
        isOTPVerificationSuccessful: false,
        isOTPVerificationFailed: false,
        isOTPSentSuccessful: false,
        isOTPSentFailed: false,
        otpController: TextEditingController(),
        verificationCode: verificationCode,
        apiBaseUrl: apiBaseUrl,
        authRepository: IAuthRepository(
          serverBaseUrl: apiBaseUrl,
        ),
        dialCode: dialCode,
        phoneNumber: phoneNumber,
        countdownController: CountdownController(autoStart: false),
        showResendButton: false,
        errorMessage: '',
        isVerifyEnabled: false,
        backToAuth: false,
      );
}
