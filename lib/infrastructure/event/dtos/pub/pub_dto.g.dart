// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubDtoImpl _$$PubDtoImplFromJson(Map<String, dynamic> json) => _$PubDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
      barMenu: (json['barMenu'] as List<dynamic>?)
          ?.map((e) => MenuDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      foodMenu: (json['foodMenu'] as List<dynamic>?)
          ?.map((e) => MenuDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['address'] == null
          ? null
          : PubLocationDto.fromJson(json['address'] as Map<String, dynamic>),
      extraDetailsDto: json['extraDetails'] == null
          ? null
          : PubExtraDetailsDto.fromJson(
              json['extraDetails'] as Map<String, dynamic>),
      happyHours: (json['happyHours'] as List<dynamic>?)
              ?.map((e) => HappyhoursDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      openingHours: json['openingHours'] == null
          ? null
          : PubOpeningHours.fromJson(
              json['openingHours'] as Map<String, dynamic>),
      completedEventsCount:
          (json['completedEventsCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PubDtoImplToJson(_$PubDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'description': instance.description,
      'userName': instance.userName,
      'logo': instance.logo,
      'averageRating': instance.averageRating,
      'coverImageUrl': instance.coverImageUrl,
      'assets': instance.assets,
      'highlights': instance.highlights,
      'tag': instance.tag,
      'barMenu': instance.barMenu,
      'foodMenu': instance.foodMenu,
      'address': instance.location,
      'extraDetails': instance.extraDetailsDto,
      'happyHours': instance.happyHours,
      'openingHours': instance.openingHours,
      'completedEventsCount': instance.completedEventsCount,
    };
