// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_extra_details_dto.freezed.dart';
part 'pub_extra_details_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubExtraDetailsDto with _$PubExtraDetailsDto {
  const factory PubExtraDetailsDto({
    @JsonKey(name: 'followedBy', defaultValue: [])
    required List<String> followedBy,
    @JsonKey(name: 'isBlocked', defaultValue: false) required bool isBlocked,
    @JsonKey(name: 'isFollowing', defaultValue: false)
    required bool isFollowing,
    @JsonKey(name: 'isHidden', defaultValue: false) required bool isHidden,
    @JsonKey(name: 'totalFollowers', defaultValue: 0)
    required int totalFollowers,
    @JsonKey(name: 'totalFriends', defaultValue: 0) required int totalFriends,
    @JsonKey(name: 'totalParties', defaultValue: 0) required int totalParties,
  }) = _PubExtraDetailsDto;

  factory PubExtraDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PubExtraDetailsDtoFromJson(json);
}
