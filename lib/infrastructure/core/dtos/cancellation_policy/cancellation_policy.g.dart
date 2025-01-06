// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancellation_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancellationPolicyImpl _$$CancellationPolicyImplFromJson(
        Map<String, dynamic> json) =>
    _$CancellationPolicyImpl(
      intro: json['intro'] as String,
      policyDetails: (json['policyDetails'] as List<dynamic>)
          .map((e) => PolicyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      acknowledgment: json['acknowledgment'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$$CancellationPolicyImplToJson(
        _$CancellationPolicyImpl instance) =>
    <String, dynamic>{
      'intro': instance.intro,
      'policyDetails': instance.policyDetails,
      'acknowledgment': instance.acknowledgment,
      'note': instance.note,
    };

_$PolicyDetailImpl _$$PolicyDetailImplFromJson(Map<String, dynamic> json) =>
    _$PolicyDetailImpl(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PolicyDetailImplToJson(_$PolicyDetailImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
