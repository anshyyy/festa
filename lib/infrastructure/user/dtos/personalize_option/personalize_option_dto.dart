
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalize_option_dto.freezed.dart';
part 'personalize_option_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PersonalizationOptionDto with _$PersonalizationOptionDto {
  const factory PersonalizationOptionDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'text', defaultValue: '') required String text,
    @JsonKey(name: 'isSelected', defaultValue: false) required bool isSelected,
  }) = _PersonalizationOptionDto;

  factory PersonalizationOptionDto.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationOptionDtoFromJson(json);
}
