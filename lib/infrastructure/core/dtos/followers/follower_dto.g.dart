// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowerDtoImpl _$$FollowerDtoImplFromJson(Map<String, dynamic> json) =>
    _$FollowerDtoImpl(
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      users: (json['followers'] as List<dynamic>?)
              ?.map((e) => CommunityUserDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FollowerDtoImplToJson(_$FollowerDtoImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'followers': instance.users,
    };
