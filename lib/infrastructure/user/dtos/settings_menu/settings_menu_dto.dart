
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_menu_dto.freezed.dart';
part 'settings_menu_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SettingsMenuDto with _$SettingsMenuDto {
  const factory SettingsMenuDto({
    @JsonKey(name: 'icon', defaultValue: '') required String icon,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'navigationRoute', defaultValue: '') required String navigationRoute,
  }) = _SettingsMenuDto;

  factory SettingsMenuDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsMenuDtoFromJson(json);
}
