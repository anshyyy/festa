part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,
    required bool isAccountDelete,
    required bool isLogout,
    required String responseMsg,
    required AuthRepository authRepository,
    required AppStateNotifier appStateNotifier,
    required TextEditingController menuSearchController,
    required List<SettingsMenuDto> settingsMenu,
    required LocationStorageService locationStorage,
    UserDto? user,
  }) = _ProfileState;

  factory ProfileState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) =>
      ProfileState(
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        isLogout: false,
        responseMsg: '',
        user: appStateNotifier.user,
        locationStorage: LocationStorageService(),
        authRepository: IAuthRepository(serverUrl: serverUrl),
        appStateNotifier: appStateNotifier,
        isAccountDelete: false,
        noUse: false,
        menuSearchController:TextEditingController(),
        settingsMenu: []
      );
}
