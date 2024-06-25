
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dto.freezed.dart';
part 'menu_dto.g.dart';

@freezed
class MenuDto with _$MenuDto{
  const factory MenuDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'icon', defaultValue: '') required String icon,
  }) = _MenuDto;

factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);

}