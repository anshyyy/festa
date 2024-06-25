// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_value_dto.freezed.dart';
part 'filter_value_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FilterValueDto with _$FilterValueDto {
  const factory FilterValueDto({
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'rule', defaultValue: '') required String rule,
    @JsonKey(name: 'icon', defaultValue: '') required String icon,
    @JsonKey(defaultValue: false) required bool isApplied,
    @JsonKey(name: 'value') dynamic value,
    @JsonKey(name: 'categoryId') int? categoryId,
  }) = _FilterValueDto;

  factory FilterValueDto.fromJson(Map<String, dynamic> json) =>
      _$FilterValueDtoFromJson(json);
}
