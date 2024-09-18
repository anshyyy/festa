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
    required CarouselController caraouselController,
    String? coverImageUrl,
    String? profileImageUrl,
    required List<Widget> highlightWidgets,
    required TextEditingController bioTextController,
    required TextEditingController nameEditingController,
    UserDto? user,
    required bool isSaveEnabled,
  })= _EditProfileState;

   factory EditProfileState.initial({
    required String serverUrl,
    required int userId,
  }) => EditProfileState(
    isFailure: false,
    isSuccess: false,
    isLoading: false,
    userId: userId,
    caraouselController: CarouselController(),
    highlightWidgets: [],
    userRepository: IUserRepository(serverUrl: serverUrl),
    coreRepository: ICoreRepository(serverUrl: serverUrl),
    bioTextController: TextEditingController(),
    nameEditingController:TextEditingController(),
    isSaveEnabled: false,
  );
}
