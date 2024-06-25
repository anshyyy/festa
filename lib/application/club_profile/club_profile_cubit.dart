import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/pub/pub_repository.dart';
import '../../domain/user/user_repository.dart';
import '../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../infrastructure/pub/i_pub_repository.dart';
import '../../infrastructure/user/i_user_repository.dart';

part 'club_profile_cubit.freezed.dart';
part 'club_profile_state.dart';

class ClubProfileCubit extends Cubit<ClubProfileState> {
  ClubProfileCubit(super.initialState) {}

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
        isBlocked: r.extraDetailsDto!.isBlocked,
        isFollowing: r.extraDetailsDto!.isFollowing,
      ));
    });

    state.dragController.addListener(() {
      emit(state.copyWith(
        isAtTop: state.dragController.size >= 1,
      ));
    });
  }

  void emitFromAnywhere({
    required ClubProfileState state,
  }) {
    emit(state);
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

  void blockOrUnblockPub({bool isBlock = true}) async {
    if (isBlock) {
      emit(state.copyWith(isBlocked: true));
      await state.userRepository.block(
        type: 'pub',
        id: state.clubId.toString(),
      );
    } else {
      //
      emit(state.copyWith(isBlocked: false));
      await state.userRepository.unBlock(
        type: 'pub',
        id: state.clubId.toString(),
      );
    }
  }
}
