import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/artist/artist_repository.dart';
import '../../../infrastructure/artist/dtos/music/music_dto.dart';
import '../../../infrastructure/artist/i_artist_repository.dart';

part 'artist_music_state.dart';
part 'artist_music_cubit.freezed.dart';

class ArtistMusicCubit extends Cubit<ArtistMusicState> {
  ArtistMusicCubit(super.initialState);

  void init(){
    fetchArtistMusic(artistId: state.artistId);
  }

  void fetchArtistMusic({required int artistId}) async{
    emit(state.copyWith(isLoading: true));
    final musicList = await state.artistRepository.fetchMusicByArtistId(id: artistId);
    emit(state.copyWith(isLoading: false, musicList: musicList));
  }

  void likeMusic({required int musicId}) async{
    emit(state.copyWith(isLoading: true));
    final updatedMusicList = state.musicList.map((e) {
      if(e.id == musicId){
        return e.copyWith(isLiked: true);
      }
      return e;
    }).toList();
    state.artistRepository.likeMusicById(musicId: musicId);
    emit(state.copyWith(isLoading: false, musicList: updatedMusicList));
  }

  void unLikeMusic({required int musicId}) async{
    emit(state.copyWith(isLoading: true));
    final updatedMusicList = state.musicList.map((e) {
      if(e.id == musicId){
        return e.copyWith(isLiked: false);
      }
      return e;
    }).toList();
    state.artistRepository.unLikeMusicById(musicId: musicId);
    emit(state.copyWith(isLoading: false, musicList: updatedMusicList));
  }
}
