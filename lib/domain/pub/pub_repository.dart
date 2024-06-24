import 'package:dartz/dartz.dart';

import '../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../infrastructure/core/dtos/community/community_dto.dart';
import '../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../infrastructure/pub/dtos/pub_events_clubbed/pub_events_clubbed_dto.dart';

abstract class PubRepository {
  Future<Either<String, PubDto>> getPubById({required int pubId});
  Future<CommunityDto> getPubFollowers({
    required int pubId,
    required int page,
    required int limit,
    required String searchQuery,
  });
  Future<CommunityDto> getPubFriends({
    required int pubId,
    required int page,
    required int limit,
    required String searchQuery,
  });
  Future<List<AssetDto>> getPubAssets({
    required int pubId,
    required int page,
    required int limit,
  });
  Future<Either<dynamic, PubEventsClubbedDto>> getEventsByPubId({required int pubId});

}
