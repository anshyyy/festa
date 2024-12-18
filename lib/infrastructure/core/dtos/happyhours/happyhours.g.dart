// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happyhours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HappyhoursDtoImpl _$$HappyhoursDtoImplFromJson(Map<String, dynamic> json) =>
    _$HappyhoursDtoImpl(
      id: (json['id'] as num).toInt(),
      urls: (json['url'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$HappyhoursDtoImplToJson(_$HappyhoursDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.urls,
    };
