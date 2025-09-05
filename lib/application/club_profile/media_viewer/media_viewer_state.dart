part of 'media_viewer_cubit.dart';

@freezed
class MediaViewerState with _$MediaViewerState {
  const factory MediaViewerState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required int pubId,
    required bool isFollowing,
    required bool isExpanded,
    PubDto? pub,
    required String mediaUrl,
    required String mediaType,
    required PubRepository pubRepository,
    required bool isPlaying,
    VideoPlayerController? videoPlayerController,
    @Default(false) bool isVideoInitialized,
  }) = _MediaViewerState;

  factory MediaViewerState.initial({
    required int pubId,
    required String url,
    required String serverUrl,
    required String type,
  }) =>
      MediaViewerState(
        noUse: false,
        isLoading: false,
        isExpanded: false,
        isFailed: false,
        isSuccessful: false,
        pubId: pubId,
        isFollowing: false,
        pubRepository: IPubRepository(serverUrl: serverUrl),
        mediaUrl: url,
        isPlaying: false,
        mediaType: type,
        isVideoInitialized: false,
      );
}
