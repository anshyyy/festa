import 'package:freezed_annotation/freezed_annotation.dart';

part 'cover_charge_details.freezed.dart';
part 'cover_charge_details.g.dart';

@freezed
class CoverChargeDetails with _$CoverChargeDetails {
  const factory CoverChargeDetails({
    required int id,
    required String razorpayId,
    required String transactionId,
    required dynamic bookingId,
  }) = _CoverChargeDetails;

  factory CoverChargeDetails.fromJson(Map<String, dynamic> json) =>
      _$CoverChargeDetailsFromJson(json);
}
