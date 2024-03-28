part of 'club_community_cubit.dart';

@freezed
class ClubCommunityState with _$ClubCommunityState {
  const factory ClubCommunityState({
    required bool isFollowersFetching,
    required bool isFriendsFetching,
    required bool isFailed,
    required bool isSuccessful,
    required bool noUse,
    required int clubId,
    required int followersPage,
    required int friendsPage,
    required PubRepository pubRepository,
    required UserRepository userRepository,
    required CommunityDto pubFollowers,
    required CommunityDto pubFriends,
    required int pubFollowersCount,
    required ScrollController scrollController,
    required ScrollController followersScrollController,
    required ScrollController friendsScrollController,
    required bool hasMoreFollowers,
    required bool hasMoreFriends,
    required String clubName,
    required TextEditingController followersSearchController,
    required TextEditingController friendsSearchController,
  }) = _ClubCommunityState;

  factory ClubCommunityState.initial({
    required int clubId,
    required String serverUrl,
    required String clubName,
  }) =>
      ClubCommunityState(
        isFailed: false,
        isSuccessful: false,
        noUse: false,
        clubId: clubId,
        followersPage: 1,
        friendsPage: 1,
        pubFollowersCount: 0,
        scrollController: ScrollController(),
        pubRepository: IPubRepository(serverUrl: serverUrl),
        userRepository: IUserRepository(serverUrl: serverUrl),
        hasMoreFollowers: true,
        hasMoreFriends: false,
        isFollowersFetching: false,
        isFriendsFetching: false,
        pubFollowers: const CommunityDto(totalCount: 0, users: []),
        pubFriends: const CommunityDto(totalCount: 0, users: []),
        followersScrollController: ScrollController(),
        friendsScrollController: ScrollController(),
        clubName:clubName,
        followersSearchController: TextEditingController(),
        friendsSearchController: TextEditingController(),
      );
}
