// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      id: json['artist_id'] as int? ?? 0,
      fullName: json['full_name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      description: json['description'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'artist_id': instance.id,
      'full_name': instance.fullName,
      'username': instance.username,
      'description': instance.description,
      'profile_image': instance.profileImage,
    };
