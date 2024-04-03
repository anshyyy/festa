part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required int userId,
    required UserRepository userRepository,
    UserDto? user,
  })= _EditProfileState;

   factory EditProfileState.initial({
    required String serverUrl,
    required int userId,
  }) => EditProfileState(
    isFailure: false,
    isSuccess: false,
    isLoading: false,
    userId: userId,
    userRepository: IUserRepository(serverUrl: serverUrl),
  );
}
