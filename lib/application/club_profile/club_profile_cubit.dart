import 'dart:developer';

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
   print(club);

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
     // r.assets.insert(0, const AssetDto(type: 'video', url: 'https://rr2---sn-h5576nsz.googlevideo.com/videoplayback?expire=1724154660&ei=xC7EZtKYLOSWvcAP656pkQs&ip=2405%3A4802%3Aa47b%3Ab8c0%3A55a3%3Ad8f2%3Ab96b%3A9278&id=o-ADv16UvnCZEzgYXm0ZcHrvQsheBEXSahi7u0zmgtF2mY&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&bui=AQmm2expeoDDsbW440qwRKCdHd8oyFWnfO2VhiTwJJEStwjo47GIZGxjc9BA7lRdYB4Njm-xhblAI24Z&spc=Mv1m9tvzE3QeE2XWCWqfbe6Ud6kaIEDJfzeGyTWra6YXcue56HRGk-o&vprv=1&svpuc=1&mime=video%2Fmp4&ns=8YdeVxChryiAlYnacmOBaFwQ&rqh=1&gir=yes&clen=9798541&ratebypass=yes&dur=146.053&lmt=1716094580575773&c=WEB_CREATOR&sefc=1&txp=4538434&n=O0p8k1yktZlW8w&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgXFKJ4SEgyItaCriaGH7lufTsGGlvbQWPPIrWHwxvgYMCIQDe7cE3igf1ms2Q9FvIsE0i-NXYak_EK-tSyPhoI37z4w%3D%3D&title=Sajni%20(Song)%3A%20Arijit%20Singh%2C%20Ram%20Sampath%20%7C%20Laapataa%20Ladies%20%7C%20%20Aamir%20Khan%20Productions&rm=sn-42u-nboze7d,sn-i3bd67l&rrc=79,104&fexp=24350516,24350518,24350557,24350561&req_id=21f36445cb0da3ee&cmsv=e&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mh=Sg&mip=2405:201:d030:b80a:dcd3:ca50:5eb0:7d63&mm=30&mn=sn-h5576nsz&ms=nxu&mt=1724134605&mv=m&mvi=2&pl=49&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AGtxev0wRQIhAJeRY2WDmgGKF8GzRX4LZnpiCtR9fid1qFItcbbDrOi1AiBXUH9ok5_91t_kmkXN_Pq1a-LMmORmMLl7Woai5Suxng%3D%3D', thumbnail: ''));
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
     // (state.dragController.size);
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
