part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required AppStateNotifier appStateNotifier,
    UserDto? user,
  }) = _ProfileState;

  factory ProfileState.initial({
    required AppStateNotifier appStateNotifier,
  }) =>
      ProfileState(
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        user: appStateNotifier.user,
        appStateNotifier: appStateNotifier,
      );
}
