// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsMenuDtoImpl _$$SettingsMenuDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingsMenuDtoImpl(
      icon: json['icon'] as String? ?? '',
      title: json['title'] as String? ?? '',
      navigationRoute: json['navigationRoute'] as String? ?? '',
    );

Map<String, dynamic> _$$SettingsMenuDtoImplToJson(
        _$SettingsMenuDtoImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'navigationRoute': instance.navigationRoute,
    };
