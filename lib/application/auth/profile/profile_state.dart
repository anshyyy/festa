part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool isAccountDelete,
    required bool isLogout,
    required String responseMsg,
    required AuthRepository authRepository,
    required AppStateNotifier appStateNotifier,
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
        authRepository: IAuthRepository(serverUrl: serverUrl),
        appStateNotifier: appStateNotifier,
        isAccountDelete: false,
      );
}
