// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_opening_hours_dto.freezed.dart';
part 'pub_opening_hours_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubOpeningHours with _$PubOpeningHours {
  const factory PubOpeningHours({
    @JsonKey(name: 'open_now', defaultValue: false) required bool openNow,
  }) = _PubOpeningHours;

  factory PubOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$PubOpeningHoursFromJson(json);
}
