part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required AppStateNotifier appStateNotifier,
    UserDto? user
  })= _EditProfileState;

   factory EditProfileState.initial({
    required AppStateNotifier appStateNotifier
  }) => EditProfileState(appStateNotifier: appStateNotifier, user: appStateNotifier.user);
}
