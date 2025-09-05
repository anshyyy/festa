// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialMediaDTOImpl _$$SocialMediaDTOImplFromJson(Map<String, dynamic> json) =>
    _$SocialMediaDTOImpl(
      socialMediaLinks:
          (json['socialMediaLinks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$SocialMediaDTOImplToJson(
        _$SocialMediaDTOImpl instance) =>
    <String, dynamic>{
      'socialMediaLinks': instance.socialMediaLinks,
    };
