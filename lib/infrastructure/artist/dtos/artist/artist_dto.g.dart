// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistProfileDtoImpl _$$ArtistProfileDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistProfileDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      categories: (json['category'] as List<dynamic>?)
              ?.map(
                  (e) => ArtistCategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      city: json['city'] as String? ?? '',
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
      extraDetailsDto: json['extraDetails'] == null
          ? null
          : ArtistExtraDetailsDto.fromJson(
              json['extraDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtistProfileDtoImplToJson(
        _$ArtistProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'description': instance.description,
      'profileImage': instance.profileImage,
      'category': instance.categories,
      'city': instance.city,
      'tag': instance.tag,
      'extraDetails': instance.extraDetailsDto,
    };
