// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TagDto with _$TagDto {
  const factory TagDto({
    @JsonKey(name: 'id', defaultValue: 0)
    required int id,
    @JsonKey(name: 'tag', defaultValue: '') required String tag,
  }) = _TagDto;

  factory TagDto.fromJson(Map<String, dynamic> json) =>
      _$TagDtoFromJson(json);
}
