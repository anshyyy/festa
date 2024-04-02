part of 'username_settings_cubit.dart';

@freezed
class UsernameSettingsState with _$UsernameSettingsState {
  factory UsernameSettingsState({
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required TextEditingController usernameInputController,
    required bool noUse,
    required bool hasError,
    required bool isUpdateEnabled,
    required UserRepository userRepository,
    UserDto? user,
    required String currentUsername,
    required bool isUsernameUpdateSuccess,
    required bool isUsernameUpdateFailure,
  }) = _UsernameSettingsState;
  factory UsernameSettingsState.initial({
    required String serverUrl,
    required String username,
  }) =>
      UsernameSettingsState(
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        usernameInputController: TextEditingController(text: username),
        noUse: false,
        hasError: false,
        isUpdateEnabled: false,
        userRepository: IUserRepository(serverUrl: serverUrl),
        currentUsername: username,
        isUsernameUpdateFailure: false,
        isUsernameUpdateSuccess: false,
      );
}
