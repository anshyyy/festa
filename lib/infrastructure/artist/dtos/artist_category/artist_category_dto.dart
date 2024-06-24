// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_category_dto.freezed.dart';
part 'artist_category_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistCategoryDto with _$ArtistCategoryDto {
  const factory ArtistCategoryDto({
    @JsonKey(name: 'id', defaultValue: 0)
    required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'type', defaultValue: '') required String type,
  }) = _ArtistCategoryDto;

  factory ArtistCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistCategoryDtoFromJson(json);
}
