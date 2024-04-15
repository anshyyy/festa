import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/pub/pub_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/dtos/community_user/community_user_dto.dart';
import '../../../infrastructure/pub/i_pub_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

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
            getPubFollowers(page: state.followersPage);
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
            getPubFriends(page: state.friendsPage);
          }
        }
      }
    });

    getPubFollowers(page: state.followersPage);
    getPubFriends(page: state.friendsPage);
  }

  Future searchPubFollowers({
    required int page,
  }) async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers = await state.pubRepository.getPubFollowers(
          pubId: state.clubId,
          page: page,
          limit: limit,
          searchQuery: state.followersSearchController.text);
      List<CommunityUserDto> temp = followers.users;
      isFollowersFetching = false;
      // isFollowersFetching = false;
      emit(
        state.copyWith(
            isFollowersFetching: false,
            followersPage: page + 1,
            hasMoreFollowers: followers.users.length == limit,
            pubFollowers:
                CommunityDto(totalCount: followers.totalCount, users: temp)),
      );
    } catch (e) {
        debugPrint(e.toString());
    }
  }

  Future getPubFollowers({
    required int page,
  }) async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers = await state.pubRepository.getPubFollowers(
          pubId: state.clubId,
          page: page,
          limit: limit,
          searchQuery: state.followersSearchController.text);
      List<CommunityUserDto> temp =
          state.pubFollowers.users.map((e) => e).toList();
      temp.addAll(followers.users);
      isFollowersFetching = false;
      emit(
        state.copyWith(
            isFollowersFetching: false,
            followersPage: page + 1,
            hasMoreFollowers: followers.users.length == limit,
            pubFollowers:
                CommunityDto(totalCount: followers.totalCount, users: temp)),
      );
    } catch (e) {
        debugPrint(e.toString());
    }
  }

  Future searchPubFriends({
    required int page,
  }) async {
      emit(state.copyWith(isFriendsFetching: true));
      final friends = await state.pubRepository.getPubFriends(
          pubId: state.clubId,
          page: page,
          limit: limit,
          searchQuery: state.friendsSearchController.text);
      List<CommunityUserDto> temp = friends.users;
      isFriendsFetching = false;
      emit(
        state.copyWith(
            isFriendsFetching: false,
            friendsPage: page + 1,
            hasMoreFriends: friends.users.length == limit,
            pubFriends:
                CommunityDto(totalCount: friends.totalCount, users: temp)),
      );
  }

  Future getPubFriends({
    required int page,
  }) async {
      emit(state.copyWith(isFriendsFetching: true));
      final friends = await state.pubRepository.getPubFriends(
          pubId: state.clubId, page: page, limit: limit, searchQuery: state.friendsSearchController.text);
      List<CommunityUserDto> temp =
          state.pubFriends.users.map((e) => e).toList();
      temp.addAll(friends.users);
      isFriendsFetching = false;
      emit(
        state.copyWith(
            isFriendsFetching: false,
            friendsPage: page + 1,
            hasMoreFriends: friends.users.length == limit,
            pubFriends:
                CommunityDto(totalCount: friends.totalCount, users: temp)),
      );
    
  }

  void followFollower({required int id}) {
    state.userRepository.followUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.pubFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        pubFollowers: CommunityDto(
            totalCount: state.pubFollowers.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFollower({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.pubFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        pubFollowers: CommunityDto(
            totalCount: state.pubFollowers.totalCount,
            users: listOfFollowers)));
  }

  void followFriend({required int id}) {
    state.userRepository.followUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.pubFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        pubFollowers: CommunityDto(
            totalCount: state.pubFollowers.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFriend({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.pubFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        pubFollowers: CommunityDto(
            totalCount: state.pubFollowers.totalCount,
            users: listOfFollowers)));
  }

  void clearSearch() {
    state.followersSearchController.clear();
    state.friendsSearchController.clear();
    emit(state.copyWith(noUse: !state.noUse));
  }
}
