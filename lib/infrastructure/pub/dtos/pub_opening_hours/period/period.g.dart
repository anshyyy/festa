// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PeriodImpl _$$PeriodImplFromJson(Map<String, dynamic> json) => _$PeriodImpl(
      open: OpenClose.fromJson(json['open'] as Map<String, dynamic>),
      close: OpenClose.fromJson(json['close'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PeriodImplToJson(_$PeriodImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
    };
