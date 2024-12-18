// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDtoImpl _$$AddressDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddressDtoImpl(
      id: (json['id'] as num).toInt(),
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0,
      pinCode: json['pinCode'] as String? ?? '',
      city: json['city'] as String? ?? '',
      vicinity: json['vicinity'] as String? ?? '',
      completeAddress: json['completeAddress'] as String? ?? '',
      state: json['state'] as String? ?? '',
    );

Map<String, dynamic> _$$AddressDtoImplToJson(_$AddressDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'pinCode': instance.pinCode,
      'city': instance.city,
      'vicinity': instance.vicinity,
      'completeAddress': instance.completeAddress,
      'state': instance.state,
    };
