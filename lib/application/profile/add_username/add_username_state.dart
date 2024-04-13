part of 'add_username_cubit.dart';

@freezed
class AddUsernameState with _$AddUsernameState {
  const factory AddUsernameState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required UserRepository userRepository,
    required TextEditingController usernameInputController,
    required bool isUpdateEnabled,
    UserDto? user,
  }) = _AddUsernameState;

  factory AddUsernameState.initial({
    required String serverUrl,
  }) =>  AddUsernameState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        userRepository: IUserRepository(serverUrl: serverUrl),
        usernameInputController: TextEditingController(),
        isUpdateEnabled: false,
      );
}
