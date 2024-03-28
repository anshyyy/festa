import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:video_player/video_player.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(super.initialState);

  void init() async {
    emit(state.copyWith(isLoading: true));
    await state.videoPlayerController.initialize();
    play();
    emit(state.copyWith(isLoading: false));
  }

  void onVideoTap() {
    if (state.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  void play() {
    state.videoPlayerController.play();
    emit(state.copyWith(isPlaying: true));
  }

  void pause() {
    state.videoPlayerController.pause();
    emit(state.copyWith(isPlaying: false));
  }
}
