// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_dto.freezed.dart';
part 'filter_dto.g.dart';

@freezed
class FilterDto with _$FilterDto {
  const factory FilterDto({
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _FilterDto;

  factory FilterDto.fromJson(Map<String, dynamic> json) => _$FilterDtoFromJson(json);
}
