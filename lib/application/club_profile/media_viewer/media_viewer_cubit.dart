import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/pub/pub_repository.dart';
import '../../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../../infrastructure/pub/i_pub_repository.dart';

part 'media_viewer_state.dart';
part 'media_viewer_cubit.freezed.dart';

class MediaViewerCubit extends Cubit<MediaViewerState> {
  MediaViewerCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
    fetchPubDetails();
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
