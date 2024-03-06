
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalization_menu_dto.freezed.dart';
part 'personalization_menu_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PersonalizationMenuDto with _$PersonalizationMenuDto {
  const factory PersonalizationMenuDto({
    @JsonKey(name: 'icon', defaultValue: '') required String icon,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'description', defaultValue: '') required String description,
  }) = _PersonalizationMenuDto;

  factory PersonalizationMenuDto.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationMenuDtoFromJson(json);
}
