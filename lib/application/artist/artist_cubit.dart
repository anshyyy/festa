import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../infrastructure/artist/i_artist_repository.dart';

part 'artist_state.dart';
part 'artist_cubit.freezed.dart';

class ArtistCubit extends Cubit<ArtistState> {
  ArtistCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
    try {
      getArtistDetails();
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isFailed: true, isSuccessful: false));
    }

    state.dragController.addListener(() {
      emit(state.copyWith(isAtTop: state.dragController.size >= 1));
    });
  }

  void getArtistDetails() async {
    final artist =
        await state.artistRepository.getArtistById(artistId: state.artistId);
    artist.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccessful: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccessful: false,
          artistProfile: r,
          isFollowing: r.extraDetailsDto!.isFollowing,
        ),
      ),
    );
  }

  void followUnfollowArtist() {
    state.artistRepository.followUnfollowArtist(
        artistId: state.artistId, isFollowing: state.isFollowing);
    emit(state.copyWith(isFollowing: !state.isFollowing));
  }
}
