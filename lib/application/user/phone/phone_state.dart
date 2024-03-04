part of 'phone_cubit.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState({
    required bool hasValidationError,
    required TextEditingController phoneNumberController,
  }) = _PhoneState;
  factory PhoneState.initial() =>  PhoneState(hasValidationError: false, phoneNumberController: TextEditingController());
}
