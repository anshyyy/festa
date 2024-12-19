// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuDtoImpl _$$MenuDtoImplFromJson(Map<String, dynamic> json) =>
    _$MenuDtoImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$MenuDtoImplToJson(_$MenuDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
