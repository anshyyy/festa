// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      coverImageUrl: json['userName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'userName': instance.coverImageUrl,
      'description': instance.description,
      'profileImage': instance.profileImage,
    };
