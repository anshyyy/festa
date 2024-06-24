// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDtoImpl _$$NotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDtoImpl(
      id: json['id'] as int? ?? 0,
      actionTaken: json['actionTaken'] as String? ?? '',
      status: json['status'] as String? ?? '',
      content: NotificationContentDto.fromJson(
          json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationDtoImplToJson(
        _$NotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actionTaken': instance.actionTaken,
      'status': instance.status,
      'content': instance.content,
    };
