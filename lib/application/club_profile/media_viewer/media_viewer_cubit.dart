import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/pub/pub_repository.dart';
import '../../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../../infrastructure/pub/i_pub_repository.dart';

part 'media_viewer_state.dart';
part 'media_viewer_cubit.freezed.dart';

class MediaViewerCubit extends Cubit<MediaViewerState> {
  MediaViewerCubit(super.initialState);

  void init() async{
    emit(state.copyWith(isLoading: true));
    if(state.mediaType == MediaType.VIDEO){
      final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(state.mediaUrl));
      emit(state.copyWith(videoPlayerController: videoPlayerController));
      // await Future.delayed(Duration());
      await state.videoPlayerController!.initialize();
      play();
    }
    fetchPubDetails();
  }

   void onVideoTap() {
    if (state.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  void play() {
    state.videoPlayerController!.play();
    emit(state.copyWith(isPlaying: true));
  }

  void pause() {
    state.videoPlayerController!.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void closePlayer(){
    pause();
    emit(state.copyWith(videoPlayerController: null));
  }

  void fetchPubDetails() async {
    final club = await state.pubRepository.getPubById(pubId: state.pubId);
    club.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailed: true,
        isSuccessful: false,
      ));
    }, (r) {
      if (r.coverImageUrl.isNotEmpty) {
        final coverImageAsset =
            AssetDto(type: 'image', url: r.coverImageUrl, thumbnail: '');
        r.assets.insert(0, coverImageAsset);
      }
      emit(state.copyWith(
          isLoading: false,
          isFailed: false,
          isSuccessful: true,
          pub: r,
          isFollowing: r.extraDetailsDto!.isFollowing));
    });
  }
}
