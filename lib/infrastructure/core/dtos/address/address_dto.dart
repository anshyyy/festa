// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
class AddressDto with _$AddressDto {
  const factory AddressDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'lat', defaultValue: 0) required double lat,
    @JsonKey(name: 'lng', defaultValue: 0) required double lng,
    @JsonKey(name: 'pinCode', defaultValue: '') required String pinCode,
    @JsonKey(name: 'city', defaultValue: '') required String city,
    @JsonKey(name: 'vicinity', defaultValue: '') required String vicinity,
    @JsonKey(name: 'completeAddress', defaultValue: '')
    required String completeAddress,
    @JsonKey(name: 'state', defaultValue: '') required String state,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}
