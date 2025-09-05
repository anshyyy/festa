// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationContentDtoImpl _$$NotificationContentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationContentDtoImpl(
      body: json['body'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$NotificationContentDtoImplToJson(
        _$NotificationContentDtoImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
    };
