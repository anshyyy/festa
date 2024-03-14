// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_user_dto.freezed.dart';
part 'community_user_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CommunityUserDto with _$CommunityUserDto {
  const factory CommunityUserDto({
    @JsonKey(name: 'id', defaultValue: 0)
    required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'profileImage', defaultValue: '') required String profileImage,
  }) = _CommunityUserDto;

  factory CommunityUserDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityUserDtoFromJson(json);
}
