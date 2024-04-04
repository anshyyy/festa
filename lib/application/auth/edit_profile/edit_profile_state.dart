part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required int userId,
    required UserRepository userRepository,
    required CoreRepository coreRepository,
    String? coverImageUrl,
    String? profileImageUrl,
    required TextEditingController bioTextController,
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
    coreRepository: ICoreRepository(serverUrl: serverUrl),
    bioTextController: TextEditingController(),
  );
}
