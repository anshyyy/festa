import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/pub/pub_repository.dart';
import '../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../infrastructure/pub/i_pub_repository.dart';

part 'club_profile_cubit.freezed.dart';
part 'club_profile_state.dart';

class ClubProfileCubit extends Cubit<ClubProfileState> {
  ClubProfileCubit(super.initialState) {
    state.parentController.addListener(() {
    });

    state.scrollController.addListener(() {
      emit(state.copyWith(isAtTop: state.scrollController.offset < 1));
    });
  }

  final int limit = 10;
  bool isFetching = false;

  void init() async {
    emit(state.copyWith(isLoading: true));
    final club = await state.pubRepository.getPubById(pubId: state.clubId);
    final assets = await state.pubRepository.getPubAssets(
      pubId: state.clubId,
      page: state.page,
      limit: limit,
    );
    club.fold((l) {
      emit(state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccessful: false,
          responseMsg: l,
          assets: assets));
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
          assets: assets,
          isFollowing: r.extraDetailsDto!.isFollowing));
    });
  }

  void onCarouselChange({required int index}) {
    emit(state.copyWith(currentImageIndex: index));
  }

  void onControllerChange(ScrollController controller) {
    emit(state.copyWith(parentController: controller));
  }

  void followUnfollowPub({required String pubId}) {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, isFollowing: !state.isFollowing));
  }

  }
