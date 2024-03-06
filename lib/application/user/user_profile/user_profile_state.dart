part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    String? profileImage,
    required CoreRepository coreRepository,
  }) = _UserProfileState;

  factory UserProfileState.initial({
    required String serverUrl,
  }) =>
      UserProfileState(
          isLoading: false,
          isSuccessful: false,
          isFailed: false,
          noUse: false,
          coreRepository: ICoreRepository(serverUrl: serverUrl));
}
