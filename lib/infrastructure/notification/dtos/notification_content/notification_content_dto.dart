// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_content_dto.freezed.dart';
part 'notification_content_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class NotificationContentDto with _$NotificationContentDto {
  const factory NotificationContentDto({
    @JsonKey(name: 'body', defaultValue: '') required String body,
    @JsonKey(name: 'title', defaultValue: '') required String title,
  }) = _NotificationContentDto;

  factory NotificationContentDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationContentDtoFromJson(json);
}
