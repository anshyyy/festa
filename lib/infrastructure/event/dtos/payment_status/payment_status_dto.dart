// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_dto.freezed.dart';
part 'payment_status_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PaymentStatusDto with _$PaymentStatusDto {
  const factory PaymentStatusDto({
    @JsonKey(name: 'isDone', defaultValue: false) required bool isDone,
    @JsonKey(name: 'reason', defaultValue: '') required String reason,
  }) = _PaymentStatusDto;

  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusDtoFromJson(json);
}
