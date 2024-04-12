// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubEventDtoImpl _$$PubEventDtoImplFromJson(Map<String, dynamic> json) =>
    _$PubEventDtoImpl(
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String,
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
      startDate: DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$$PubEventDtoImplToJson(_$PubEventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'coverImageUrl': instance.coverImageUrl,
      'startDate': instance.startDate.toIso8601String(),
    };
