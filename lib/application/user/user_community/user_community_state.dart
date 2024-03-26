part of 'user_community_cubit.dart';

@freezed
class UserCommunityState with _$UserCommunityState {
  const factory UserCommunityState({
    required bool isFollowersFetching,
    required bool isFriendsFetching,
    required bool isFailed,
    required bool isSuccessful,
    required int userId,
    required String username,
    required int followersPage,
    required int friendsPage,
    required UserRepository userRepository,
    required CommunityDto userFollowers,
    required CommunityDto userFriends,
    required int pubFollowersCount,
    required ScrollController scrollController,
    required ScrollController followersScrollController,
    required ScrollController friendsScrollController,
    required bool hasMoreFollowers,
    required bool hasMoreFriends,
  }) = _UserCommunityState;

  factory UserCommunityState.initial({
    required int userId,
    required String username,
    required String serverUrl,
  }) =>
      UserCommunityState(
        isFailed: false,
        isSuccessful: false,
        userId: userId,
        username: username,
        followersPage: 1,
        friendsPage: 1,
        pubFollowersCount: 0,
        scrollController: ScrollController(),
        userRepository: IUserRepository(serverUrl: serverUrl),
        hasMoreFollowers: true,
        hasMoreFriends: false,
        isFollowersFetching: false,
        isFriendsFetching: false,
        userFollowers: const CommunityDto(totalCount: 0, users: []),
        userFriends: const CommunityDto(totalCount: 0, users: []),
        followersScrollController: ScrollController(),
        friendsScrollController: ScrollController(),
      );
}
