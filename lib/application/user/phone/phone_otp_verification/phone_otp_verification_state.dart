part of 'phone_otp_verification_cubit.dart';

@freezed
class PhoneOtpVerificationState with _$PhoneOtpVerificationState {
  const factory PhoneOtpVerificationState({
    required String phoneNumber,
  }) = _PhoneOtpVerificationState;
  factory PhoneOtpVerificationState.initial({required String phoneNumber}) =>  PhoneOtpVerificationState(phoneNumber: phoneNumber);
}
