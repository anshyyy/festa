part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    String? profileImage,
    String? coverImage,
    required CoreRepository coreRepository,
    required UserRepository userRepository,
     UserDto? user,
    required int userId,
    required bool isFollowing,
    required bool qrExpandedView,
  }) = _UserProfileState;

  factory UserProfileState.initial({
    required String serverUrl,
    required int userId,
  }) =>
      UserProfileState(
        isLoading: false,
        isSuccessful: false,
        isFailed: false,
        noUse: false,
        coreRepository: ICoreRepository(
          serverUrl: serverUrl,
        ),
        userRepository: IUserRepository(
          serverUrl: serverUrl,
        ),
     
        isFollowing: false,
        userId: userId,
        qrExpandedView:false,
      );
}
