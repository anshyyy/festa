// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_dto.freezed.dart';
part 'suggestion_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SuggestionDto with _$SuggestionDto {
  const factory SuggestionDto({
    @JsonKey(name: 'place_id', defaultValue: '') required String placeId,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'main_text', defaultValue: '') required String mainText
  }) = _SuggestionDto;

  factory SuggestionDto.fromJson(Map<String, dynamic> json) =>
      _$SuggestionDtoFromJson(json);
}
