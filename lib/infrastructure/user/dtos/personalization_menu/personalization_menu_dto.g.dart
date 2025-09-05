// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalization_menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalizationMenuDtoImpl _$$PersonalizationMenuDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizationMenuDtoImpl(
      title: json['title'] as String? ?? '',
      list: (json['list'] as List<dynamic>?)
              ?.map((e) =>
                  PersonalizationOptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PersonalizationMenuDtoImplToJson(
        _$PersonalizationMenuDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
    };
