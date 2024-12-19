// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false
)
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'emoji', defaultValue: '') required String emoji,
    @JsonKey(name: 'image_url', defaultValue: '') required String imageUrl,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
