// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultsImpl _$$SearchResultsImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultsImpl(
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

Map<String, dynamic> _$$SearchResultsImplToJson(_$SearchResultsImpl instance) =>
    <String, dynamic>{
      'pubs': instance.pubs,
      'events': instance.events,
      'artists': instance.artists,
      'users': instance.users,
    };
