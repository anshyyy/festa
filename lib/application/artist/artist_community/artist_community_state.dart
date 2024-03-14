part of 'artist_community_cubit.dart';

@freezed
class ArtistCommunityState with _$ArtistCommunityState {
  const factory ArtistCommunityState({
    required bool isFollowersFetching,
    required bool isFriendsFetching,
    required bool isFailed,
    required bool isSuccessful,
    required int artistId,
    required int page,
    required ArtistRepository artistRepository,
    CommunityDto? artistFollowers,
    CommunityDto? artistFriends,
    required ScrollController followersScrollController,
    required ScrollController friendsScrollController,
    required bool hasMoreFollowers,
    required bool hasMoreFriends,
  }) = _ArtistCommunityState;

  factory ArtistCommunityState.initial({
    required int artistId,
    required String serverUrl,
  }) =>
      ArtistCommunityState(
        isFollowersFetching: false,
        isFriendsFetching: false,
        isFailed: false,
        isSuccessful: false,
        artistId: artistId,
        page: 1,
        followersScrollController: ScrollController(),
        friendsScrollController: ScrollController(),
        artistRepository: IArtistRepository(serverUrl: serverUrl),
        hasMoreFollowers:true,
        hasMoreFriends:true,
      );
}
