import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/artist/artist_repository.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../../infrastructure/artist/i_artist_repository.dart';

part 'artist_profile_state.dart';
part 'artist_profile_cubit.freezed.dart';

class ArtistProfileCubit extends Cubit<ArtistProfileState> {
  ArtistProfileCubit(super.initialState);

  void followUnfollowArtist(
      {required int artistId, required bool isFollowing}) async {
     state.artistRepository
        .followUnfollowArtist(artistId: artistId, isFollowing: isFollowing);
    final updated = state.artists.map((e) {
      if (e.id == artistId) {
        return e.copyWith(isFollowing: !e.isFollowing);
      }
      return e;
    }).toList();
   
    emit(state.copyWith(noUse: !state.noUse, artists: updated));
  }

  


  void emitFromAnywhere({required ArtistProfileState state}){
    emit(state);
  }
}
