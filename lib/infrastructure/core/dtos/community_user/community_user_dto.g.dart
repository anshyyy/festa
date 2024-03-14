// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityUserDtoImpl _$$CommunityUserDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityUserDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
    );

Map<String, dynamic> _$$CommunityUserDtoImplToJson(
        _$CommunityUserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'profileImage': instance.profileImage,
    };
