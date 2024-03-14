// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_event_dto.freezed.dart';
part 'pub_event_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubEventDto with _$PubEventDto {
  const factory PubEventDto({
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'coverImageUrl', defaultValue: '') required String coverImageUrl,
    @JsonKey(name: 'startDate') required DateTime startDate,
  }) = _PubEventDto;

  factory PubEventDto.fromJson(Map<String, dynamic> json) =>
      _$PubEventDtoFromJson(json);
}
