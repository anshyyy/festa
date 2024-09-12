import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/pub/pub_repository.dart';
import '../core/dtos/asset/asset_dto.dart';
import '../core/dtos/community/community_dto.dart';
import '../event/dtos/pub/pub_dto.dart';
import 'dtos/pub_events_clubbed/pub_events_clubbed_dto.dart';

class IPubRepository extends PubRepository {
  final String serverUrl;
  IPubRepository({required this.serverUrl});
  @override
  Future<Either<String, PubDto>> getPubById({required int pubId}) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${PubApiConstants.PUBS}/$pubId';
      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);

      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }

      final parsedBody = jsonDecode(response.body);

      PubDto pub = PubDto.fromJson(parsedBody);

      return right(pub);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<CommunityDto> getPubFollowers({
    required int pubId,
    required int page,
    required int limit,
    required String searchQuery,
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${PubApiConstants.PUBS}/$pubId/followers';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': searchQuery.toLowerCase(),
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return const CommunityDto(totalCount: 0, users: []);
      }
      final body = response.body;
      final pubfollowersRaw = jsonDecode(body) as Map<String, dynamic>;
      final clubCommunity = CommunityDto.fromJson(pubfollowersRaw);

      return clubCommunity;
    } catch (e) {
      return const CommunityDto(totalCount: 0, users: []);
    }
  }

  @override
  Future<CommunityDto> getPubFriends({
    required int pubId,
    required int page,
    required int limit,
    required String searchQuery,
  }) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${PubApiConstants.PUBS}/$pubId/friends';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': searchQuery.toLowerCase(),
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);
      if (response.statusCode != 200) {
        return const CommunityDto(totalCount: 0, users: []);
      }
      final body = response.body;
      final pubFriendsRaw = jsonDecode(body) as Map<String, dynamic>;
      final clubCommunity = CommunityDto.fromJson(pubFriendsRaw);

      return clubCommunity;
    } catch (e) {
      return const CommunityDto(totalCount: 0, users: []);
    }
  }

  @override
  Future<List<AssetDto>> getPubAssets(
      {required int pubId, required int page, required int limit}) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${PubApiConstants.PUBS}/$pubId/assets';
      final Map<String, String> param = {
        'page': page.toString(),
        'limit': limit.toString(),
      };
      final response = await RESTService.performGETRequest(
          httpUrl: url, param: param, isAuth: true, token: token!);

      if (response.statusCode != 200) {
        return [];
      }

      final body = response.body;
      final pubAssetsRaw = jsonDecode(body) as Map;
      // final totalFollowers = pubfollowersRaw['count'];
      final assets = pubAssetsRaw['assets'] as List;
      var pubAssets = assets.map((e) => AssetDto.fromJson(e)).toList();
      //(pubAssets);
    
      return pubAssets;
    } catch (e) {
      (e);
      return [];
    }
  }

  @override
  Future<Either<dynamic, PubEventsClubbedDto>> getEventsByPubId(
      {required int pubId}) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

      final url = '$serverUrl${EventApiConstants.GET_EVENTS_BY_PUB_ID}/$pubId';

      final response = await RESTService.performGETRequest(
          httpUrl: url, isAuth: true, token: token!);

      if (response.statusCode != 200) {
        return left(null);
      }

      final body = response.body;
      final pubEvents = jsonDecode(body) as Map<String, dynamic>;
      final pubeventsClubbed = PubEventsClubbedDto.fromJson(pubEvents);
      return right(pubeventsClubbed);
    } catch (e) {
      return left(null);
    }
  }
}
