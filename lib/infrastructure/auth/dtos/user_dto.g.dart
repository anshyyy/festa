// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: (json['id'] as num).toInt(),
      externalUserId: json['externalUserId'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      coverImage: json['coverImage'] as String? ?? '',
      description: json['description'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      email: json['email'] as String?,
      highlight: (json['highlights'] as List<dynamic>?)
              ?.map((e) => HighlightDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
      extraDetailsDto: json['extraDetails'] == null
          ? null
          : UserExtraDetailsDto.fromJson(
              json['extraDetails'] as Map<String, dynamic>),
      isPrivateAccount: json['isPrivateAccount'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalUserId': instance.externalUserId,
      'fullName': instance.fullName,
      'profileImage': instance.profileImage,
      'coverImage': instance.coverImage,
      'description': instance.description,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'dob': instance.dob,
      'email': instance.email,
      'highlights': instance.highlight,
      'tag': instance.tag,
      'extraDetails': instance.extraDetailsDto,
      'isPrivateAccount': instance.isPrivateAccount,
    };
