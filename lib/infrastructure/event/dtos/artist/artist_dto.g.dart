// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['fullName'] as String? ?? '',
      username: json['username'] as String? ?? '',
      description: json['description'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      email: json['email'] as String?,
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'username': instance.username,
      'description': instance.description,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'tag': instance.tag,
    };
