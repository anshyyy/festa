// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../pub_event/pub_event_dto.dart';

part 'pub_events_clubbed_dto.freezed.dart';
part 'pub_events_clubbed_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubEventsClubbedDto with _$PubEventsClubbedDto {
  const factory PubEventsClubbedDto({
    @JsonKey(name: 'eventMonths') required List<int> eventMonths,
    @JsonKey(name: 'events', defaultValue: []) required List<PubEventDto> events,
  }) = _PubEventsClubbedDto;

  factory PubEventsClubbedDto.fromJson(Map<String, dynamic> json) =>
      _$PubEventsClubbedDtoFromJson(json);
}
