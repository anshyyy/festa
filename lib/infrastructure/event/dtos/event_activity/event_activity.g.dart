// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventActivityImpl _$$EventActivityImplFromJson(Map<String, dynamic> json) =>
    _$EventActivityImpl(
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EventActivityImplToJson(_$EventActivityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
