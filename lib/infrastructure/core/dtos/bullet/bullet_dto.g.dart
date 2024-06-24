// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bullet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BulletDtoImpl _$$BulletDtoImplFromJson(Map<String, dynamic> json) =>
    _$BulletDtoImpl(
      text: json['text'] as String? ?? '',
      type: json['type'] as String? ?? '',
      order: json['order'] as int? ?? 0,
    );

Map<String, dynamic> _$$BulletDtoImplToJson(_$BulletDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'order': instance.order,
    };
