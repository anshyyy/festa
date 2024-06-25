// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubLocationDtoImpl _$$PubLocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$PubLocationDtoImpl(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      pinCode: json['pinCode'] as String? ?? '',
      city: json['city'] as String? ?? '',
      vicinity: json['vicinity'] as String? ?? '',
      state: json['state'] as String? ?? '',
    );

Map<String, dynamic> _$$PubLocationDtoImplToJson(
        _$PubLocationDtoImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'pinCode': instance.pinCode,
      'city': instance.city,
      'vicinity': instance.vicinity,
      'state': instance.state,
    };
