// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubDtoImpl _$$PubDtoImplFromJson(Map<String, dynamic> json) => _$PubDtoImpl(
      id: json['id'] as int? ?? 0,
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
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
      location: json['address'] == null
          ? null
          : PubLocationDto.fromJson(json['address'] as Map<String, dynamic>),
      extraDetailsDto: json['extraDetails'] == null
          ? null
          : PubExtraDetailsDto.fromJson(
              json['extraDetails'] as Map<String, dynamic>),
      openingHours: json['openingHours'] == null
          ? null
          : PubOpeningHours.fromJson(
              json['openingHours'] as Map<String, dynamic>),
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
      'tag': instance.tag,
      'address': instance.location,
      'extraDetails': instance.extraDetailsDto,
      'openingHours': instance.openingHours,
    };
