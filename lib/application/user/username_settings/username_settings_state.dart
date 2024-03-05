part of 'username_settings_cubit.dart';

@freezed
class UsernameSettingsState with _$UsernameSettingsState {
  factory UsernameSettingsState({
    required TextEditingController usernameInputController,
    required bool noUse,
    required bool hasError,
  }) = _UsernameSettingsState;
   factory UsernameSettingsState.initial() => UsernameSettingsState(usernameInputController: TextEditingController(), noUse: false, hasError: false);
}
