part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool bioSaveEnabled,
    required int userId,
    required UserRepository userRepository,
    required CoreRepository coreRepository,
   required custom_carousel.CarouselSliderController carouselController,
    String? coverImageUrl,
    String? profileImageUrl,
    required bool showBottomSheet,
    required List<Widget> highlightWidgets,
    required TextEditingController bioTextController,
    required TextEditingController nameEditingController,
    UserDto? user,
    required bool isSaveEnabled,
    required List<String> lsOFSex,
    required List<String> lsOFSexValue,
    required String? userGender,
    required String? gendertToRender,
  })= _EditProfileState;

   factory EditProfileState.initial({
    required String serverUrl,
    required int userId,
  }) => EditProfileState(
    isFailure: false,
    isSuccess: false,
    isLoading: false,
    bioSaveEnabled:false,
    userId: userId,
    userGender: '' ,
    gendertToRender: '',
    carouselController:custom_carousel.CarouselSliderController(),
    highlightWidgets: [],
    lsOFSexValue: ['woman', 'man', 'other','intersex_man','trans_man','transmasculine','man_and_non_binary','cis_man'],
     lsOFSex: ['Woman', 'Man','Other','Intersex man','Trans man','Transmasculine','Man and Non-Binary','Cis Man'],
    userRepository: IUserRepository(serverUrl: serverUrl),
    coreRepository: ICoreRepository(serverUrl: serverUrl),
    bioTextController: TextEditingController(),
    nameEditingController:TextEditingController(),
    isSaveEnabled: false,
    showBottomSheet: false,
  );
}
