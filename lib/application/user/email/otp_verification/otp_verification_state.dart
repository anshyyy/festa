part of 'otp_verification_cubit.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    required String emailAddress,
  }) = _OtpVerificationState;
  factory OtpVerificationState.initial({required String emailAddress}) =>
       OtpVerificationState(emailAddress: emailAddress);
}
