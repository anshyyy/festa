// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../notification_content/notification_content_dto.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'actionTaken', defaultValue: '') required String actionTaken,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    required NotificationContentDto content,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
