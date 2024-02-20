// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false
)
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
