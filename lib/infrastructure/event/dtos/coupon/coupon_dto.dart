// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_dto.freezed.dart';
part 'coupon_dto.g.dart';

@freezed
class CouponDTO with _$CouponDTO {
  const factory CouponDTO({
    @JsonKey(name: 'message', defaultValue: '') required String message,
    @JsonKey(name: 'couponId', defaultValue: 0) required int couponId,
    @JsonKey(name: 'value',defaultValue: 0) required int value,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'redeemedById', defaultValue: 0) required int redeemedById,
    @JsonKey(name: 'eventId', defaultValue: 0) required int eventId,
  }) = _CouponDTO;

  factory CouponDTO.fromJson(Map<String, dynamic> json) => CouponDTO(
    message: json['message'] as String? ?? '',
    couponId: json['couponId'] as int? ?? 0,
    status: json['status'] as String? ?? '',
    value: json['value'] as int? ?? 0,
    redeemedById: (json['redeemedBy'] as Map<String, dynamic>)['userId'] as int? ?? 0,
    eventId: (json['event'] as Map<String, dynamic>)['eventId'] as int? ?? 0,
  );
}
