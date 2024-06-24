// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicDtoImpl _$$MusicDtoImplFromJson(Map<String, dynamic> json) =>
    _$MusicDtoImpl(
      id: json['id'] as int? ?? 0,
      audioUrl: json['audioUrl'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isLiked: json['isLiked'] as bool? ?? false,
      isPlaying: json['isPlaying'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      length: json['length'] as int? ?? 0,
    );

Map<String, dynamic> _$$MusicDtoImplToJson(_$MusicDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'audioUrl': instance.audioUrl,
      'imageUrl': instance.imageUrl,
      'isLiked': instance.isLiked,
      'isPlaying': instance.isPlaying,
      'name': instance.name,
      'length': instance.length,
    };
