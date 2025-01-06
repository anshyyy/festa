// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsAndConditionImpl _$$TermsAndConditionImplFromJson(
        Map<String, dynamic> json) =>
    _$TermsAndConditionImpl(
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$TermsAndConditionImplToJson(
        _$TermsAndConditionImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'title': instance.title,
      'description': instance.description,
    };
