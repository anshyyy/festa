part of 'artist_music_cubit.dart';

@freezed
class ArtistMusicState with _$ArtistMusicState {
  const factory ArtistMusicState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int artistId,
    required List<MusicDto> musicList,
    required ArtistRepository artistRepository,
    required AudioPlayer audioPlayer,
  }) = _ArtistMusicState;

  factory ArtistMusicState.initial({
    required String serverUrl,
    required int artistId,
  }) =>
      ArtistMusicState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        artistId: artistId,
        musicList: [],
        artistRepository: IArtistRepository(serverUrl: serverUrl),
        audioPlayer: AudioPlayer()
      );
}
