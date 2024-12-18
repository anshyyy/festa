part of 'gender_selection_cubit.dart';

@freezed
class GenderSelectionState with _$GenderSelectionState {
  const factory GenderSelectionState({
    required bool isFailed,
    required bool isSuccessful,
    required bool isLoading,
    required bool isSaveEnable,
    required List<String> lsOFSex,
    required List<String> lsOFSexValue,
    required bool isSaveDetailsEnable,
    required String errorMessage,
    required String userGender,
    required AppStateNotifier appStateNotifier,
    required AuthRepository authRepository,
    required UserRepository userRepository,
    int? selectedSex,
    UserDto? user,
    required bool genderUpdateSuccess,
    required bool genderUpdateFailure,
  }) = _GenderSelectionState;

  factory GenderSelectionState.initial({
    required final AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String userGender,
  }) =>
      GenderSelectionState(
        selectedSex: 2,
        isFailed: false,
        userGender: userGender,
        isSuccessful: false,
        isLoading: false,
        isSaveDetailsEnable: false,
        isSaveEnable: false,
        lsOFSex: ['Woman', 'Man','Other','Intersex man','Trans man','Transmasculine','Man and Non-Binary','Cis Man'],
        lsOFSexValue: ['woman', 'man', 'other','intersex_man','trans_man','transmasculine','man_and_non_binary','cis_man'],
        authRepository: IAuthRepository(serverUrl: serverUrl),
        userRepository: IUserRepository(serverUrl: serverUrl),
        appStateNotifier: appStateNotifier,
        errorMessage: '',
        genderUpdateSuccess: false,
        genderUpdateFailure: false,
      );
}
