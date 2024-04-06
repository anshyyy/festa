import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/artist/artist_repository.dart';
import '../../../infrastructure/artist/dtos/music/music_dto.dart';
import '../../../infrastructure/artist/i_artist_repository.dart';

part 'artist_music_cubit.freezed.dart';
part 'artist_music_state.dart';

class ArtistMusicCubit extends Cubit<ArtistMusicState> {
  ArtistMusicCubit(super.initialState);
  int currenPlaying = -1;
  void init() {
    fetchArtistMusic(artistId: state.artistId);
  }

  void fetchArtistMusic({required int artistId}) async {
    emit(state.copyWith(isLoading: true));
    final musicList =
        await state.artistRepository.fetchMusicByArtistId(id: artistId);
    emit(state.copyWith(isLoading: false, musicList: musicList));
  }

  void likeMusic({required int musicId}) async {
    emit(state.copyWith(isLoading: true));
    final updatedMusicList = state.musicList.map((e) {
      if (e.id == musicId) {
        return e.copyWith(isLiked: true);
      }
      return e;
    }).toList();
    state.artistRepository.likeMusicById(musicId: musicId);
    emit(state.copyWith(isLoading: false, musicList: updatedMusicList));
  }

  void unLikeMusic({required int musicId}) async {
    emit(state.copyWith(isLoading: true));
    final updatedMusicList = state.musicList.map((e) {
      if (e.id == musicId) {
        return e.copyWith(isLiked: false);
      }
      return e;
    }).toList();
    state.artistRepository.unLikeMusicById(musicId: musicId);
    emit(state.copyWith(isLoading: false, musicList: updatedMusicList));
  }

  void playMusic({
    required int id,
    required String audioUrl,
  }) async {
    if (id != currenPlaying) {
      initMusic(prev: currenPlaying, curr: id, audioUrl: audioUrl);
    }
    currenPlaying = id;

    final updatedMusicList = state.musicList.map((e) {
      if (e.id == id) {
        return e.copyWith(isPlaying: true);
      }
      return e;
    }).toList();
    emit(state.copyWith(musicList: updatedMusicList));
    await state.audioPlayer.play();
  }

  void initMusic(
      {required int prev, required int curr, required String audioUrl}) async {
    stopMusic(id: prev);
    state.audioPlayer.stop();
    // await state.audioPlayer
    //     .setUrl('https://samplelib.com/lib/preview/mp3/sample-15s.mp3');
    try {
      await state.audioPlayer.setUrl(audioUrl);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something Went Wrong');
      stopMusic(id: curr);
    }
  }

  void pauseMusic({required int id}) async {
    stopMusic(id: id);
    await state.audioPlayer.pause();
  }

  void stopMusic({required int id}) {
    final updatedMusicList = state.musicList.map((e) {
      if (e.id == id) {
        return e.copyWith(isPlaying: false);
      }
      return e;
    }).toList();

    emit(state.copyWith(musicList: updatedMusicList));
  }
}
