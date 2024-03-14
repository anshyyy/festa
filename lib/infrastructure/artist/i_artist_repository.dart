import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/artist/artist_repository.dart';
import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../core/dtos/community/community_dto.dart';
import 'dtos/artist/artist_dto.dart';

class IArtistRepository extends ArtistRepository {
  final String serverUrl;
  IArtistRepository({required this.serverUrl});

  @override
  Future<Either<String, ArtistDto>> getArtistById(
      {required int artistId}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${ArtistApiConstants.ARTIST}/$artistId';
      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);

      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }

      final parsedBody = jsonDecode(response.body) as Map<String, dynamic>;
      ArtistDto artist = ArtistDto.fromJson(parsedBody);
      return right(artist);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  void followUnfollowArtist(
      {required int artistId, required bool isFollowing}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = isFollowing
          ? '$serverUrl${ArtistApiConstants.UNFOLLOW_ARTIST}/$artistId'
          : '$serverUrl${ArtistApiConstants.FOLLOW_ARTIST}/$artistId';
      await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token!);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Either<dynamic, CommunityDto>> getArtistFollowers(
      {required int artistId, required int page, required int limit}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${ArtistApiConstants.ARTIST}/$artistId/followers';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      final artistFollowersRaw = jsonDecode(body) as Map<String, dynamic>;
      final artistFollowers = CommunityDto.fromJson(artistFollowersRaw);
      return right(artistFollowers);
    } catch (e) {
      return left(null);
    }
  }

  @override
  Future<Either<dynamic, CommunityDto>> getArtistFriends(
      {required int artistId, required int page, required int limit}) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = '$serverUrl${ArtistApiConstants.ARTIST}/$artistId/friends';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return left(null);
      }
      final body = response.body;
      final artistFriendsRaw = jsonDecode(body) as Map<String, dynamic>;
      final artistFriends = CommunityDto.fromJson(artistFriendsRaw);
      return right(artistFriends);
    } catch (e) {
      return left(null);
    }
  }
}
