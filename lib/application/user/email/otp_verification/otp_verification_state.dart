part of 'otp_verification_cubit.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required bool isOTPVerificationSuccessful,
    required bool isOTPVerificationFailed,
    required bool showResendOtp,
    required String emailAddress,
    required UserRepository userRepository,
    required TextEditingController otpController,
  }) = _OtpVerificationState;
  factory OtpVerificationState.initial({
    required String emailAddress,
    required String serverUrl,
  }) =>
      OtpVerificationState(
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        emailAddress: emailAddress,
        userRepository: IUserRepository(
          serverUrl: serverUrl,
        ),
        otpController: TextEditingController(),
        isOTPVerificationSuccessful: false,
        isOTPVerificationFailed: false,
        showResendOtp: false,
      );
}
