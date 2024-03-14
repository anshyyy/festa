// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categories: (json['category'] as List<dynamic>?)
              ?.map(
                  (e) => ArtistCategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      city: json['city'] as String? ?? '',
      tag: json['tag'] == null
          ? null
          : ArtistTagDto.fromJson(json['tag'] as Map<String, dynamic>),
      extraDetailsDto: json['extraDetails'] == null
          ? null
          : ArtistExtraDetailsDto.fromJson(
              json['extraDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'description': instance.description,
      'category': instance.categories,
      'city': instance.city,
      'tag': instance.tag,
      'extraDetails': instance.extraDetailsDto,
    };
