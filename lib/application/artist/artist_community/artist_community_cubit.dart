import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/artist/artist_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/artist/i_artist_repository.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/dtos/community_user/community_user_dto.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'artist_community_state.dart';
part 'artist_community_cubit.freezed.dart';

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
      Either<dynamic, CommunityDto> followers =
          await state.artistRepository.getArtistFollowers(
        artistId: state.artistId,
        page: state.page,
        limit: limit,
      );
      followers.fold(
        (l) {
          emit(state.copyWith(
            isFollowersFetching: false,
            isFailed: true,
            isSuccessful: false,
          ));
        },
        (r) {
          List<CommunityUserDto> tempUsers = state.artistFollowers == null
              ? []
              : state.artistFollowers!.users.map((e) => e).toList();
          tempUsers.addAll(r.users);
          isFollowersFetching = false;

          emit(
            state.copyWith(
              isFollowersFetching: false,
              isFailed: false,
              isSuccessful: true,
              page: state.page + 1,
              hasMoreFollowers: r.users.length == limit,
              artistFollowers:
                  CommunityDto(totalCount: r.totalCount, users: tempUsers),
            ),
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getArtistFriends() async {
    try {
      emit(state.copyWith(isFriendsFetching: true));
      Either<dynamic, CommunityDto> followers =
          await state.artistRepository.getArtistFriends(
        artistId: state.artistId,
        page: state.page,
        limit: limit,
      );
      followers.fold(
        (l) {
          emit(state.copyWith(
            isFriendsFetching: false,
            isFailed: true,
            isSuccessful: false,
          ));
        },
        (r) {
          List<CommunityUserDto> tempUsers = state.artistFriends == null
              ? []
              : state.artistFriends!.users.map((e) => e).toList();
          tempUsers.addAll(r.users);
          isFriendsFetching = false;

          emit(
            state.copyWith(
              isFriendsFetching: false,
              isFailed: false,
              isSuccessful: true,
              page: state.page + 1,
              hasMoreFriends: r.users.length == limit,
              artistFriends:
                  CommunityDto(totalCount: r.totalCount, users: tempUsers),
            ),
          );
        },
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

}
