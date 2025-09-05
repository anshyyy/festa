// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_extra_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubExtraDetailsDtoImpl _$$PubExtraDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PubExtraDetailsDtoImpl(
      followedBy: (json['followedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isBlocked: json['isBlocked'] as bool? ?? false,
      isFollowing: json['isFollowing'] as bool? ?? false,
      isHidden: json['isHidden'] as bool? ?? false,
      totalFollowers: (json['totalFollowers'] as num?)?.toInt() ?? 0,
      totalFriends: (json['totalFriends'] as num?)?.toInt() ?? 0,
      totalParties: (json['totalParties'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PubExtraDetailsDtoImplToJson(
        _$PubExtraDetailsDtoImpl instance) =>
    <String, dynamic>{
      'followedBy': instance.followedBy,
      'isBlocked': instance.isBlocked,
      'isFollowing': instance.isFollowing,
      'isHidden': instance.isHidden,
      'totalFollowers': instance.totalFollowers,
      'totalFriends': instance.totalFriends,
      'totalParties': instance.totalParties,
    };
