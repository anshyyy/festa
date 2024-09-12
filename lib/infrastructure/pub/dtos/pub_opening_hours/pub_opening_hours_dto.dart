// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'period/period.dart';

part 'pub_opening_hours_dto.freezed.dart';
part 'pub_opening_hours_dto.g.dart';

@freezed
class PubOpeningHours with _$PubOpeningHours {
  const factory PubOpeningHours({
    @JsonKey(name: 'periods') required List<Period> periods,
    @JsonKey(name: 'open_now', defaultValue: false) required bool openNow,
    @JsonKey(name: 'weekday_text') required List<String> weekdayText,
  }) = _PubOpeningHours;

  factory PubOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$PubOpeningHoursFromJson(json);
}
