// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../filter_value/filter_value_dto.dart';
part 'filter_dto.freezed.dart';
part 'filter_dto.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false
)
class FilterDto with _$FilterDto {
  const factory FilterDto({
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(defaultValue: false) required bool isApplied,
     @JsonKey(defaultValue: []) required List<FilterValueDto> values,
  }) = _FilterDto;

  factory FilterDto.fromJson(Map<String, dynamic> json) =>
      _$FilterDtoFromJson(json);
}
