// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistCategoryDtoImpl _$$ArtistCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistCategoryDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$ArtistCategoryDtoImplToJson(
        _$ArtistCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
