// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/community/community_dto.dart';

part 'artist_extra_details_dto.freezed.dart';
part 'artist_extra_details_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistExtraDetailsDto with _$ArtistExtraDetailsDto {
  const factory ArtistExtraDetailsDto({
    @JsonKey(name: 'followedBy') required CommunityDto followedBy,
    @JsonKey(name: 'isBlocked', defaultValue: false) required bool isBlocked,
    @JsonKey(name: 'isFollowing', defaultValue: false)
    required bool isFollowing,
    @JsonKey(name: 'isHidden', defaultValue: false) required bool isHidden,
    @JsonKey(name: 'totalFollowers', defaultValue: 0)
    required int totalFollowers,
    @JsonKey(name: 'totalFriends', defaultValue: 0) required int totalFriends,
    @JsonKey(name: 'totalParties', defaultValue: 0) required int totalParties,
    @JsonKey(name: 'totalFootFall', defaultValue: 0) required int totalFootFall,
  }) = _ArtistExtraDetailsDto;

  factory ArtistExtraDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistExtraDetailsDtoFromJson(json);
}
