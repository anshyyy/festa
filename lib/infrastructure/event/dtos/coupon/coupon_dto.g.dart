// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponDTOImpl _$$CouponDTOImplFromJson(Map<String, dynamic> json) =>
    _$CouponDTOImpl(
      message: json['message'] as String? ?? '',
      couponId: json['couponId'] as int? ?? 0,
      value: json['value'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      redeemedById: json['redeemedById'] as int? ?? 0,
      eventId: json['eventId'] as int? ?? 0,
    );

Map<String, dynamic> _$$CouponDTOImplToJson(_$CouponDTOImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'couponId': instance.couponId,
      'value': instance.value,
      'status': instance.status,
      'redeemedById': instance.redeemedById,
      'eventId': instance.eventId,
    };
