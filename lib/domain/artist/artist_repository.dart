import 'package:dartz/dartz.dart';

import '../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../infrastructure/artist/dtos/music/music_dto.dart';
import '../../infrastructure/core/dtos/community/community_dto.dart';

abstract class ArtistRepository {
  Future<Either<String, ArtistProfileDto>> getArtistById({required int artistId});
  void followUnfollowArtist({required int artistId, required bool isFollowing});
  Future<Either<dynamic, CommunityDto>> getArtistFollowers({
    required int artistId,
    required int page,
    required int limit,
  });

  Future<Either<dynamic, CommunityDto>> getArtistFriends({
    required int artistId,
    required int page,
    required int limit,
  });

  Future<List<MusicDto>> fetchMusicByArtistId({required int id});

  void likeMusicById({required int musicId});
  void unLikeMusicById({required int musicId});
}
