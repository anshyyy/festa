// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/tag/tag_dto.dart';
import '../artist_category/artist_category_dto.dart';
import '../artist_extra_details/artist_extra_details_dto.dart';


part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistProfileDto with _$ArtistProfileDto {
  const factory ArtistProfileDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'profileImage', defaultValue: '') required String profileImage,
    @JsonKey(name: 'category', defaultValue: []) required List<ArtistCategoryDto> categories,
    @JsonKey(name: 'city', defaultValue: '') required String city,
    @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
    @JsonKey(name: 'isFollowing', defaultValue: false) bool? isFollowing,
    @JsonKey(name: 'extraDetails', defaultValue: null) ArtistExtraDetailsDto? extraDetailsDto,
  }) = _ArtistProfileDto;

  factory ArtistProfileDto.fromJson(Map<String, dynamic> json) => _$ArtistProfileDtoFromJson(json);
}
