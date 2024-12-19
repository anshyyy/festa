// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityDtoImpl _$$CommunityDtoImplFromJson(Map<String, dynamic> json) =>
    _$CommunityDtoImpl(
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => CommunityUserDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$CommunityDtoImplToJson(_$CommunityDtoImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'users': instance.users,
    };
