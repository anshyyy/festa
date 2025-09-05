// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_opening_hours_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PubOpeningHoursImpl _$$PubOpeningHoursImplFromJson(
        Map<String, dynamic> json) =>
    _$PubOpeningHoursImpl(
      periods: (json['periods'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      openNow: json['open_now'] as bool? ?? false,
      weekdayText: (json['weekday_text'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PubOpeningHoursImplToJson(
        _$PubOpeningHoursImpl instance) =>
    <String, dynamic>{
      'periods': instance.periods,
      'open_now': instance.openNow,
      'weekday_text': instance.weekdayText,
    };
