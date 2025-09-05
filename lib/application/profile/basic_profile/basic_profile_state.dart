part of 'basic_profile_cubit.dart';

@freezed
class BasicProfileState with _$BasicProfileState {
  const factory BasicProfileState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isContinueEnabled,
    required bool isSaveDetailsEnable,
    required bool startValidation,
    required String errorMessage,
    String? profileImage,
    UserDto? user,
    required AppStateNotifier appStateNotifier,
    required DateTime selectedDate,
    required CoreRepository coreRepository,
    required AuthRepository authRepository,
    required UserRepository userRepository,
    required TextEditingController fullNameController,
    required TextEditingController birthDayController,
    required String errorFullName,
    required bool showPermissionDialog,
  }) = _BasicProfileState;

  factory BasicProfileState.initial({
    required final AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) =>
      BasicProfileState(
        noUse: false,
        isLoading: false,
        startValidation: false,
        isContinueEnabled: false,
        isFailed: false,
        isSuccessful: false,
        isSaveDetailsEnable: false,
        userRepository: IUserRepository(serverUrl: serverUrl),
        authRepository: IAuthRepository(serverUrl: serverUrl),
        coreRepository: ICoreRepository(serverUrl: serverUrl),
        appStateNotifier: appStateNotifier,
        errorMessage: '',
        profileImage: null,
        fullNameController: TextEditingController(),
        birthDayController: TextEditingController(),
        errorFullName: '',
        showPermissionDialog: false,
        user: null,
        selectedDate: DateTime(
          2010,
          DateTime.now().month,
          DateTime.now().day,
        ),
      );
}
