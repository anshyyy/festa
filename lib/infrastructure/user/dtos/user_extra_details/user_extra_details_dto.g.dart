// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_extra_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserExtraDetailsDtoImpl _$$UserExtraDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserExtraDetailsDtoImpl(
      followedBy:
          CommunityDto.fromJson(json['followedBy'] as Map<String, dynamic>),
      isBlocked: json['isBlocked'] as bool? ?? false,
      isFollowing: json['isFollowing'] as bool? ?? false,
      isHidden: json['isHidden'] as bool? ?? false,
      totalFollowers: (json['totalFollowers'] as num?)?.toInt() ?? 0,
      totalFriends: (json['totalFriends'] as num?)?.toInt() ?? 0,
      totalParties: (json['totalParties'] as num?)?.toInt() ?? 0,
      totalFootFall: (json['totalFootFall'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserExtraDetailsDtoImplToJson(
        _$UserExtraDetailsDtoImpl instance) =>
    <String, dynamic>{
      'followedBy': instance.followedBy,
      'isBlocked': instance.isBlocked,
      'isFollowing': instance.isFollowing,
      'isHidden': instance.isHidden,
      'totalFollowers': instance.totalFollowers,
      'totalFriends': instance.totalFriends,
      'totalParties': instance.totalParties,
      'totalFootFall': instance.totalFootFall,
    };
