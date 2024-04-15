import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/artist/artist_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/artist/i_artist_repository.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/dtos/community_user/community_user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'artist_community_cubit.freezed.dart';
part 'artist_community_state.dart';

class ArtistCommunityCubit extends Cubit<ArtistCommunityState> {
  final int limit = 10;
  bool isFollowersFetching = false;
  bool isFriendsFetching = false;

  ArtistCommunityCubit(super.initialState);

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
            getArtistFollowers();
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
            getArtistFriends();
          }
        }
      }
    });

    getArtistFollowers();
    getArtistFriends();
  }

  Future getArtistFollowers() async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers =
          await state.artistRepository.getArtistFollowers(
        artistId: state.artistId,
        page: state.followersPage,
        limit: limit,
        searchQuery: state.followersSearchController.text,
      );
      List<CommunityUserDto> tempUsers = state.artistFollowers == null
              ? []
              : state.artistFollowers!.users.map((e) => e).toList();
          tempUsers.addAll(followers.users);
          isFollowersFetching = false;

          emit(
            state.copyWith(
              isFollowersFetching: false,
              followersPage: state.followersPage + 1,
              hasMoreFollowers: followers.users.length == limit,
              artistFollowers:
                  CommunityDto(totalCount: followers.totalCount, users: tempUsers),
            ),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getArtistFriends() async {
    try {
      emit(state.copyWith(isFriendsFetching: true));
      final friends =
          await state.artistRepository.getArtistFriends(
        artistId: state.artistId,
        page: state.friendsPage,
        limit: limit,
        searchQuery: state.followersSearchController.text,
      );
      
          List<CommunityUserDto> tempUsers = state.artistFriends == null
              ? []
              : state.artistFriends!.users.map((e) => e).toList();
          tempUsers.addAll(friends.users);
          isFriendsFetching = false;

          emit(
            state.copyWith(
              isFriendsFetching: false,
              friendsPage: state.friendsPage + 1,
              hasMoreFriends: friends.users.length == limit,
              artistFriends:
                  CommunityDto(totalCount: friends.totalCount, users: tempUsers),
            ),
          );
        
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void followFollower({required int id}) {
    state.userRepository.followUser(userId: id);
    final List<CommunityUserDto> listOfFollowers =
        List.from(state.artistFollowers!.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        artistFollowers: CommunityDto(
            totalCount: state.artistFollowers!.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFollower({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.artistFollowers!.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        artistFollowers: CommunityDto(
            totalCount: state.artistFollowers!.totalCount,
            users: listOfFollowers)));
  }

  void followFriend({required int id}) {
    state.userRepository.followUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.artistFriends!.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: true);
      }
      return e;
    }));

    emit(state.copyWith(
        artistFriends: CommunityDto(
            totalCount: state.artistFriends!.totalCount,
            users: listOfFollowers)));
  }

  void unFollowFriend({required int id}) {
    state.userRepository.unFollowUser(userId: id);

    final List<CommunityUserDto> listOfFollowers =
        List.from(state.artistFriends!.users.map((e) {
      if (e.id == id) {
        return e.copyWith(isFollowing: false);
      }
      return e;
    }));

    emit(state.copyWith(
        artistFriends: CommunityDto(
            totalCount: state.artistFriends!.totalCount,
            users: listOfFollowers)));
  }

  Future searchArtistFollowers({
    required int page,
  }) async {
    try {
      emit(state.copyWith(isFollowersFetching: true));
      final followers = await state.artistRepository.getArtistFollowers(
          artistId: state.artistId,
          page: page,
          limit: limit,
          searchQuery: state.followersSearchController.text,);
      List<CommunityUserDto> temp = followers.users;
      isFollowersFetching = false;
      // isFollowersFetching = false;
      emit(
        state.copyWith(
            isFollowersFetching: false,
            followersPage: page + 1,
            hasMoreFollowers: followers.users.length == limit,
            artistFollowers:
                CommunityDto(totalCount: followers.totalCount, users: temp)),
      );
    } catch (e) {
        debugPrint(e.toString());
    }
  }

  Future searchArtistFriends({
    required int page,
  }) async {
    try {
      emit(state.copyWith(isFriendsFetching: true));
      final friends = await state.artistRepository.getArtistFollowers(
          artistId: state.artistId,
          page: page,
          limit: limit,
          searchQuery: state.friendsSearchController.text,);
      List<CommunityUserDto> temp = friends.users;
      isFriendsFetching = false;
      emit(
        state.copyWith(
            isFriendsFetching: false,
            friendsPage: page + 1,
            hasMoreFriends: friends.users.length == limit,
            artistFriends:
                CommunityDto(totalCount: friends.totalCount, users: temp)),
      );
    } catch (e) {
        debugPrint(e.toString());
    }
  }
}
