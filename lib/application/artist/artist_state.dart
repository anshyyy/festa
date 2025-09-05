part of 'artist_cubit.dart';

@freezed
class ArtistState with _$ArtistState {
  const factory ArtistState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int artistId,
    required bool isAtTop,
    required DraggableScrollableController dragController,
    ArtistProfileDto? artistProfile,
    required IArtistRepository artistRepository,
    required IUserRepository userRepository,
    required bool isFollowing,
    required bool isBlocked,
  }) = _ArtistState;

  factory ArtistState.initial({
    required int artistId,
    required String serverUrl,
  }) =>
      ArtistState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        isBlocked: false,
        artistId: artistId,
        dragController: DraggableScrollableController(),
        isAtTop: false,
        userRepository: IUserRepository(serverUrl: serverUrl),
        artistRepository: IArtistRepository(serverUrl: serverUrl),
        isFollowing: false,
      );
}
