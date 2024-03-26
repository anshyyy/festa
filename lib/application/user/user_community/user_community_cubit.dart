import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/dtos/community_user/community_user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'user_community_state.dart';
part 'user_community_cubit.freezed.dart';

class UserCommunityCubit extends Cubit<UserCommunityState> {
  final int limit = 10;
  bool isFollowersFetching = false;
  bool isFriendsFetching = false;

  UserCommunityCubit(super.initialState);

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
            getUserFollowers();
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
            getUserFriends();
          }
        }
      }
    });

    getUserFollowers();
    getUserFriends();
  }

  Future getUserFollowers() async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers = await state.userRepository.getUserFollowers(
        userId: state.userId,
        page: state.followersPage,
        limit: limit,
      );
      List<CommunityUserDto> temp =
          state.userFollowers.users.map((e) => e).toList();
      temp.addAll(followers.users);
      isFollowersFetching = false;
      // isFollowersFetching = false;
      emit(
        state.copyWith(
            isFollowersFetching: false,
            followersPage: state.followersPage + 1,
            hasMoreFollowers: followers.users.length == limit,
            userFollowers:
                CommunityDto(totalCount: followers.totalCount, users: temp)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future getUserFriends() async {
    try {
      emit(state.copyWith(isFriendsFetching: true));
      final friends = await state.userRepository.getUserFriends(
        userId: state.userId,
        page: state.friendsPage,
        limit: limit,
      );
      List<CommunityUserDto> temp =
          state.userFriends.users.map((e) => e).toList();
      temp.addAll(friends.users);
      isFriendsFetching = false;
      emit(
        state.copyWith(
            isFriendsFetching: false,
            friendsPage: state.friendsPage + 1,
            hasMoreFriends: friends.users.length == limit,
            userFriends:
                CommunityDto(totalCount: friends.totalCount, users: temp)),
      );
    } catch (e) {
      print(e);
    }
  }

  void followFollower({required int id}) {
    state.userRepository.followUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.userFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        userFollowers: CommunityDto(
            totalCount: state.userFollowers.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFollower({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.userFollowers.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        userFollowers: CommunityDto(
            totalCount: state.userFollowers.totalCount,
            users: listOfFollowers)));
  }

  void followFriend({required int id}) {
    state.userRepository.followUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.userFriends.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        userFriends: CommunityDto(
            totalCount: state.userFriends.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFriend({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.userFriends.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        userFriends: CommunityDto(
            totalCount: state.userFriends.totalCount,
            users: listOfFollowers)));
  }
}
