// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    @JsonKey(name: 'latitude', defaultValue: 0.0) required double latitude,
    @JsonKey(name: 'longitude', defaultValue: 0.0) required double longitude,
    @JsonKey(name: 'area', defaultValue: '') required String area,
    @JsonKey(name: 'city', defaultValue: '') required String city,
    @JsonKey(name: 'state', defaultValue: '') required String state,
    @JsonKey(name: 'country', defaultValue: '') required String country,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}
