// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingDtoImpl _$$FollowingDtoImplFromJson(Map<String, dynamic> json) =>
    _$FollowingDtoImpl(
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      users: (json['following'] as List<dynamic>?)
              ?.map((e) => CommunityUserDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FollowingDtoImplToJson(_$FollowingDtoImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'following': instance.users,
    };
