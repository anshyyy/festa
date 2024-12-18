// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/community_user/community_user_dto.dart';

part 'follower_dto.freezed.dart';
part 'follower_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FollowerDto with _$FollowerDto {
  const factory FollowerDto({
    @JsonKey(name: 'totalCount', defaultValue: 0) required int totalCount,
    @JsonKey(name: 'followers', defaultValue: [])
    required List<CommunityUserDto> users,
  }) = _FollowerDto;

  factory FollowerDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerDtoFromJson(json);
}
