part of 'artist_cubit.dart';


@freezed
class ArtistState with _$ArtistState {
  const factory ArtistState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int artistId,
    ArtistDto? artistProfile,
    required IArtistRepository artistRepository,
    required bool isFollowing,
  }) = _ArtistState;

  factory ArtistState.initial(
    {
      required int artistId,
      required String serverUrl,
    }
  ) =>  ArtistState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        artistId: artistId,
        artistRepository: IArtistRepository(serverUrl: serverUrl),
        isFollowing: false,
      );
}
