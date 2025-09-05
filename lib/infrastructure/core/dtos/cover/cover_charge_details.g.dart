// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_charge_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoverChargeDetailsImpl _$$CoverChargeDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$CoverChargeDetailsImpl(
      id: (json['id'] as num).toInt(),
      razorpayId: json['razorpayId'] as String,
      transactionId: json['transactionId'] as String,
      bookingId: json['bookingId'],
    );

Map<String, dynamic> _$$CoverChargeDetailsImplToJson(
        _$CoverChargeDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'razorpayId': instance.razorpayId,
      'transactionId': instance.transactionId,
      'bookingId': instance.bookingId,
    };
