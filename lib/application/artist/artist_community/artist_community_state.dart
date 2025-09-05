part of 'artist_community_cubit.dart';

@freezed
class ArtistCommunityState with _$ArtistCommunityState {
  const factory ArtistCommunityState({
    required bool isFollowersFetching,
    required bool isFriendsFetching,
    required bool isFailed,
    required bool isSuccessful,
    required int artistId,
    required String artistName,
    required int followersPage,
    required int friendsPage,
    required ArtistRepository artistRepository,
    required UserRepository userRepository,
    CommunityDto? artistFollowers,
    CommunityDto? artistFriends,
    required ScrollController followersScrollController,
    required ScrollController friendsScrollController,
    required bool hasMoreFollowers,
    required bool hasMoreFriends,
    required TextEditingController followersSearchController,
    required TextEditingController friendsSearchController,

  }) = _ArtistCommunityState;

  factory ArtistCommunityState.initial({
    required int artistId,
    required String serverUrl,
    required String artistName,
  }) =>
      ArtistCommunityState(
        isFollowersFetching: false,
        isFriendsFetching: false,
        isFailed: false,
        isSuccessful: false,
        artistId: artistId,
        artistName: artistName,
        friendsPage: 1,
        followersPage: 1,
        followersScrollController: ScrollController(),
        friendsScrollController: ScrollController(),
        artistRepository: IArtistRepository(serverUrl: serverUrl),
        userRepository: IUserRepository(serverUrl: serverUrl),
        hasMoreFollowers:true,
        hasMoreFriends:true,
        friendsSearchController: TextEditingController(),
        followersSearchController: TextEditingController(),
      );
}
