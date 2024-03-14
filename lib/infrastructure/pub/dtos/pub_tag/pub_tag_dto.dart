// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_tag_dto.freezed.dart';
part 'pub_tag_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubTagDto with _$PubTagDto {
  const factory PubTagDto({
    @JsonKey(name: 'id', defaultValue: 0)
    required int id,
    @JsonKey(name: 'tag', defaultValue: '') required String tag,
  }) = _PubTagDto;

  factory PubTagDto.fromJson(Map<String, dynamic> json) =>
      _$PubTagDtoFromJson(json);
}
