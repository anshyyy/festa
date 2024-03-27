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
    PubDto? pub,
    required PubRepository pubRepository,
  }) = _MediaViewerState;

  factory MediaViewerState.initial({
    required int pubId,
    required String serverUrl,
  }) =>
      MediaViewerState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        pubId: pubId,
        isFollowing: false,
        pubRepository: IPubRepository(serverUrl: serverUrl),
      );
}
