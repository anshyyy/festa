// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/asset/asset_dto.dart';
import '../../../core/dtos/tag/tag_dto.dart';
import '../../../pub/dtos/pub_extra_details/pub_extra_details_dto.dart';
import '../../../pub/dtos/pub_location/pub_location_dto.dart';
import '../../../pub/dtos/pub_opening_hours/pub_opening_hours_dto.dart';


part 'pub_dto.freezed.dart';
part 'pub_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubDto with _$PubDto {
  const factory PubDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'userName', defaultValue: '') required String userName,
    @JsonKey(name: 'logo', defaultValue: '') required String logo,
    @JsonKey(name: 'averageRating', defaultValue: 0.0)
    required double averageRating,
    @JsonKey(name: 'coverImageUrl', defaultValue: '')
    required String coverImageUrl,
    @JsonKey(name: 'assets', defaultValue: []) required List<AssetDto> assets,
    @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
    @JsonKey(name: 'address', defaultValue: null) PubLocationDto? location,
    @JsonKey(name: 'extraDetails', defaultValue: null) PubExtraDetailsDto? extraDetailsDto,
    @JsonKey(name: 'openingHours', defaultValue: null) PubOpeningHours? openingHours,
  }) = _PubDto;

  factory PubDto.fromJson(Map<String, dynamic> json) => _$PubDtoFromJson(json);
}
