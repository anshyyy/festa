// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventRulesImpl _$$EventRulesImplFromJson(Map<String, dynamic> json) =>
    _$EventRulesImpl(
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isAllowed: json['isAllowed'] as bool? ?? false,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EventRulesImplToJson(_$EventRulesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'isAllowed': instance.isAllowed,
      'description': instance.description,
    };
