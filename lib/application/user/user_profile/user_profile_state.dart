part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool isUpdating,
    required bool noUse,
    String? profileImage,
    String? coverImage,
    required CoreRepository coreRepository,
    required UserRepository userRepository,
     UserDto? user,
    required int userId,
    required bool isFollowing,
    required bool isBlocked,
    required bool qrExpandedView,
    required AppStateNotifier appStateNotifier
  }) = _UserProfileState;

  factory UserProfileState.initial({
    required String serverUrl,
    required AppStateNotifier appStateNotifier
  }) =>
      UserProfileState(
        appStateNotifier: appStateNotifier,
        isLoading: false,
        isUpdating: false,
        isSuccessful: false,
        isFailed: false,
        isBlocked: false,
        noUse: false,
        coreRepository: ICoreRepository(
          serverUrl: serverUrl,
        ),
        userRepository: IUserRepository(
          serverUrl: serverUrl,
        ),
     
        isFollowing: false,
        userId: appStateNotifier.user!.id,
        qrExpandedView:false,
      );
}
