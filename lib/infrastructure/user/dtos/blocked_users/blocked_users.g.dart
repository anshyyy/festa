// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockedUsersImpl _$$BlockedUsersImplFromJson(Map<String, dynamic> json) =>
    _$BlockedUsersImpl(
      pubs: (json['pubs'] as List<dynamic>)
          .map((e) => PubDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlockedUsersImplToJson(_$BlockedUsersImpl instance) =>
    <String, dynamic>{
      'pubs': instance.pubs,
      'events': instance.events,
      'artists': instance.artists,
      'users': instance.users,
    };
