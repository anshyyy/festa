part of 'video_player_cubit.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isPlaying,
    required VideoPlayerController videoPlayerController,
  }) = _VideoPlayerState;

  factory VideoPlayerState.initial({
    required String url,
  }) =>
      VideoPlayerState(
          noUse: false,
          isLoading: false,
          isFailed: false,
          isSuccessful: false,
          isPlaying: false,
          videoPlayerController:
              VideoPlayerController.networkUrl(Uri.parse(url)));
}
