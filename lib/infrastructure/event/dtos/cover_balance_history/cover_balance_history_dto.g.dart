// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_balance_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoverBalanceHistoryDtoImpl _$$CoverBalanceHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CoverBalanceHistoryDtoImpl(
      id: json['id'] as int,
      amount: json['amount'] as String,
      transactionType: json['transactionType'] as String? ?? 'admin_recharge',
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      transactionDirection: json['transactionDirection'] as String,
    );

Map<String, dynamic> _$$CoverBalanceHistoryDtoImplToJson(
        _$CoverBalanceHistoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'transactionDirection': instance.transactionDirection,
    };
