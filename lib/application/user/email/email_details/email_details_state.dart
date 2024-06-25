part of 'email_details_cubit.dart';

@freezed
class EmailDetailsState with _$EmailDetailsState {
  const factory EmailDetailsState({
    required String emailAddress,
  }) = _EmailDetailsState;
  factory EmailDetailsState.initial({required String emailAddress}) =>
      EmailDetailsState(emailAddress: emailAddress);
}
