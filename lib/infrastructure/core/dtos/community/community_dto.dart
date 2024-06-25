// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/community_user/community_user_dto.dart';

part 'community_dto.freezed.dart';
part 'community_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CommunityDto with _$CommunityDto {
  const factory CommunityDto({
    @JsonKey(name: 'totalCount', defaultValue: 0) required int totalCount,
    @JsonKey(name: 'users', defaultValue: [])
    required List<CommunityUserDto> users,
  }) = _CommunityDto;

  factory CommunityDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityDtoFromJson(json);
}
