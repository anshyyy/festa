import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/pub/pub_repository.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/dtos/community_user/community_user_dto.dart';
import '../../../infrastructure/pub/i_pub_repository.dart';

part 'club_community_state.dart';
part 'club_community_cubit.freezed.dart';

class ClubCommunityCubit extends Cubit<ClubCommunityState> {
  final int limit = 10;
  bool isFollowersFetching = false;
  bool isFriendsFetching = false;

  ClubCommunityCubit(super.initialState);

  void init() async {
    state.followersScrollController.addListener(() {
      final double maxScroll =
          state.followersScrollController.position.maxScrollExtent;
      final double currentScroll =
          state.followersScrollController.position.pixels;
      const double delta = 50;
      if (maxScroll - currentScroll <= delta) {
        if (state.hasMoreFollowers) {
          if (!isFollowersFetching) {
            isFollowersFetching = true;
            getPubFollowers();
          }
        }
      }
    });

    state.friendsScrollController.addListener(() {
      final double maxScroll =
          state.friendsScrollController.position.maxScrollExtent;
      final double currentScroll =
          state.friendsScrollController.position.pixels;
      const double delta = 50;
      if (maxScroll - currentScroll <= delta) {
        if (state.hasMoreFriends) {
          if (!isFriendsFetching) {
            isFriendsFetching = true;
            getPubFriends();
          }
        }
      }
    });

    getPubFollowers();
    getPubFriends();
  }

  Future getPubFollowers() async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers = await state.pubRepository.getPubFollowers(
        pubId: state.clubId,
        page: state.followersPage,
        limit: limit,
      );
      List<CommunityUserDto> temp =
          state.pubFollowers.users.map((e) => e).toList();
      temp.addAll(followers.users);
      isFollowersFetching = false;
      // isFollowersFetching = false;
      emit(
        state.copyWith(
            isFollowersFetching: false,
            followersPage: state.followersPage + 1,
            hasMoreFollowers: followers.users.length == limit,
            pubFollowers:
                CommunityDto(totalCount: followers.totalCount, users: temp)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future getPubFriends() async {
    try {
      emit(state.copyWith(isFriendsFetching: true));
      final friends = await state.pubRepository.getPubFriends(
        pubId: state.clubId,
        page: state.friendsPage,
        limit: limit,
      );
      List<CommunityUserDto> temp =
          state.pubFriends.users.map((e) => e).toList();
      temp.addAll(friends.users);
      isFriendsFetching = false;
      emit(
        state.copyWith(
            isFriendsFetching: false,
            friendsPage: state.friendsPage + 1,
            hasMoreFriends: friends.users.length == limit,
            pubFriends:
                CommunityDto(totalCount: friends.totalCount, users: temp)),
      );
    } catch (e) {
      print(e);
    }
  }
}
