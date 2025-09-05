// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_location_dto.freezed.dart';
part 'pub_location_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubLocationDto with _$PubLocationDto {
  const factory PubLocationDto({
    @JsonKey(name: 'lat', defaultValue: 0.0) required double lat,
    @JsonKey(name: 'lng', defaultValue: 0.0) required double lng,
    @JsonKey(name: 'pinCode', defaultValue: '') required String pinCode,
    @JsonKey(name: 'city', defaultValue: '') required String city,
    @JsonKey(name: 'vicinity', defaultValue: '') required String vicinity,
    @JsonKey(name: 'state', defaultValue: '') required String state,
  }) = _PubLocationDto;

  factory PubLocationDto.fromJson(Map<String, dynamic> json) =>
      _$PubLocationDtoFromJson(json);
}
