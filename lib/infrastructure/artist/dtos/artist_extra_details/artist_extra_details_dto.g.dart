// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_extra_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistExtraDetailsDtoImpl _$$ArtistExtraDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistExtraDetailsDtoImpl(
      followedBy:
          CommunityDto.fromJson(json['followedBy'] as Map<String, dynamic>),
      isBlocked: json['isBlocked'] as bool? ?? false,
      isFollowing: json['isFollowing'] as bool? ?? false,
      isHidden: json['isHidden'] as bool? ?? false,
      totalFollowers: json['totalFollowers'] as int? ?? 0,
      totalFriends: json['totalFriends'] as int? ?? 0,
      totalParties: json['totalParties'] as int? ?? 0,
      totalFootFall: json['totalFootFall'] as int? ?? 0,
    );

Map<String, dynamic> _$$ArtistExtraDetailsDtoImplToJson(
        _$ArtistExtraDetailsDtoImpl instance) =>
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
