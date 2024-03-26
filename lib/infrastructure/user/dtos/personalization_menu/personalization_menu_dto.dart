// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../personalize_option/personalize_option_dto.dart';

part 'personalization_menu_dto.freezed.dart';
part 'personalization_menu_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PersonalizationMenuDto with _$PersonalizationMenuDto {
  const factory PersonalizationMenuDto({
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'list', defaultValue: [])
    required List<PersonalizationOptionDto> list,
  }) = _PersonalizationMenuDto;

  factory PersonalizationMenuDto.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationMenuDtoFromJson(json);
}
