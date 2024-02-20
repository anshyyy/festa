// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_value_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterValueDtoImpl _$$FilterValueDtoImplFromJson(Map<String, dynamic> json) =>
    _$FilterValueDtoImpl(
      displayName: json['displayName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      rule: json['rule'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      isApplied: json['isApplied'] as bool? ?? false,
      value: json['value'],
    );

Map<String, dynamic> _$$FilterValueDtoImplToJson(
        _$FilterValueDtoImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'name': instance.name,
      'rule': instance.rule,
      'icon': instance.icon,
      'isApplied': instance.isApplied,
      'value': instance.value,
    };
