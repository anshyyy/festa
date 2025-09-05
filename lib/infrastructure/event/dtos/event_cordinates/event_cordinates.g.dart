// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_cordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCordinatesImpl _$$EventCordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$EventCordinatesImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      address: Cordinates.fromJson(json['address'] as Map<String, dynamic>),
      coverImagerUrl: json['coverImagerUrl'] as String,
    );

Map<String, dynamic> _$$EventCordinatesImplToJson(
        _$EventCordinatesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'address': instance.address,
      'coverImagerUrl': instance.coverImagerUrl,
    };
