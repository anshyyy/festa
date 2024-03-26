// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/tag/tag_dto.dart';
import '../artist_category/artist_category_dto.dart';
import '../artist_extra_details/artist_extra_details_dto.dart';


part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistDto with _$ArtistDto {
  const factory ArtistDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'category', defaultValue: []) required List<ArtistCategoryDto> categories,
    @JsonKey(name: 'city', defaultValue: '') required String city,
    @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
    @JsonKey(name: 'extraDetails', defaultValue: null) ArtistExtraDetailsDto? extraDetailsDto,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, dynamic> json) => _$ArtistDtoFromJson(json);
}
