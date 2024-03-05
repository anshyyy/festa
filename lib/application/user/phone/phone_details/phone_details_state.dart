part of 'phone_details_cubit.dart';

@freezed
class PhoneDetailsState with _$PhoneDetailsState {
   const factory PhoneDetailsState({
    required String phoneNumber,
  }) = _PhoneDetailsState;
  factory PhoneDetailsState.initial({required String phoneNumber}) =>  PhoneDetailsState(phoneNumber: phoneNumber);
}
