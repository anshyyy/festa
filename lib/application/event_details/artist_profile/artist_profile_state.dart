part of 'artist_profile_cubit.dart';

@freezed
class ArtistProfileState with _$ArtistProfileState {
  const factory ArtistProfileState({
    required bool isLoading,
    required bool isSuccess,
    required bool isFailure,
    required bool noUse,

    required ArtistRepository artistRepository,
    required List<ArtistProfileDto> artists,
  }) = _ArtistProfileState;

  factory ArtistProfileState.initial({
    required String serverUrl,
    required List<ArtistProfileDto> artists,
  }) => ArtistProfileState(
        noUse: false,
        isLoading: false,
        isFailure: false,
        isSuccess: false,

        artistRepository: IArtistRepository(serverUrl: serverUrl),
        artists: artists,
      );
}
