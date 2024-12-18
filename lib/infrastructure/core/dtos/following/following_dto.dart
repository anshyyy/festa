// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/community_user/community_user_dto.dart';

part 'following_dto.freezed.dart';
part 'following_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FollowingDto with _$FollowingDto {
  const factory FollowingDto({
    @JsonKey(name: 'totalCount', defaultValue: 0) required int totalCount,
    @JsonKey(name: 'following', defaultValue: [])
    required List<CommunityUserDto> users,
  }) = _FollowingDto;

  factory FollowingDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingDtoFromJson(json);
}
