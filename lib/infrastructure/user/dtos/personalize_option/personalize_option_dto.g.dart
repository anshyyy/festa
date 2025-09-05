// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalizationOptionDtoImpl _$$PersonalizationOptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizationOptionDtoImpl(
      type: json['type'] as String? ?? '',
      text: json['text'] as String? ?? '',
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PersonalizationOptionDtoImplToJson(
        _$PersonalizationOptionDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'isSelected': instance.isSelected,
    };
