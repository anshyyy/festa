// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentStatusDtoImpl _$$PaymentStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentStatusDtoImpl(
      isDone: json['isDone'] as bool? ?? false,
      reason: json['reason'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentStatusDtoImplToJson(
        _$PaymentStatusDtoImpl instance) =>
    <String, dynamic>{
      'isDone': instance.isDone,
      'reason': instance.reason,
    };
