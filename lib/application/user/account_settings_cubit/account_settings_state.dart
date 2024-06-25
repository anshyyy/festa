part of 'account_settings_cubit.dart';

@freezed

class AccountSettingsState with _$AccountSettingsState {
  const factory AccountSettingsState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool isPrivate,
    required UserRepository userRepository,
    required int userId,
    UserDto? user,
  }) = _AccountSettingsState;
  
  factory AccountSettingsState.initial({
    required String serverUrl,
    required int userId,
  }) =>
      AccountSettingsState(
          isPrivate: false,
          isLoading: false,
          isFailure: false,
          isSuccess: false,
          userId: userId,
          userRepository: IUserRepository(serverUrl: serverUrl));
}
