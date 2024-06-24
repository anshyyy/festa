// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_events_clubbed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubEventsClubbedDtoImpl _$$PubEventsClubbedDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PubEventsClubbedDtoImpl(
      eventMonths:
          (json['eventMonths'] as List<dynamic>).map((e) => e as int).toList(),
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => PubEventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PubEventsClubbedDtoImplToJson(
        _$PubEventsClubbedDtoImpl instance) =>
    <String, dynamic>{
      'eventMonths': instance.eventMonths,
      'events': instance.events,
    };
