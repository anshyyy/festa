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
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      extraDetailsDto: PubExtraDetailsDto.fromJson(
          json['extraDetailsDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PubDtoImplToJson(_$PubDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'description': instance.description,
      'userName': instance.userName,
      'averageRating': instance.averageRating,
      'coverImageUrl': instance.coverImageUrl,
      'assets': instance.assets,
      'extraDetailsDto': instance.extraDetailsDto,
    };
