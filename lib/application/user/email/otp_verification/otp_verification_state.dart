part of 'otp_verification_cubit.dart';

@freezed
class EmailOtpVerificationState with _$EmailOtpVerificationState {
  const factory EmailOtpVerificationState({
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required bool isOTPVerificationSuccessful,
    required bool isOTPVerificationFailed,
    required bool showResendOtp,
    required String emailAddress,
    required UserRepository userRepository,
    required TextEditingController otpController,
  }) = _EmailOtpVerificationState;
  factory EmailOtpVerificationState.initial({
    required String emailAddress,
    required String serverUrl,
  }) =>
      EmailOtpVerificationState(
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
