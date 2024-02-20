// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bullet_dto.freezed.dart';
part 'bullet_dto.g.dart';

@freezed
class BulletDto with _$BulletDto {
  const factory BulletDto({
    @JsonKey(name: 'text', defaultValue: '') required String text,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'order', defaultValue: 0) required int order,
  }) = _BulletDto;

  factory BulletDto.fromJson(Map<String, dynamic> json) =>
      _$BulletDtoFromJson(json);
}
