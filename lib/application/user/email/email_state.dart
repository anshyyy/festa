part of 'email_cubit.dart';

@freezed
class EmailState with _$EmailState {
  const factory EmailState({
    required bool hasValidationError,
    required TextEditingController emailTextController,
  }) = _EmailState;
  factory EmailState.initial() =>  EmailState(hasValidationError: false, emailTextController: TextEditingController());
}
