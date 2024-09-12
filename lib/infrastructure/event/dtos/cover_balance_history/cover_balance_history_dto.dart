import 'package:freezed_annotation/freezed_annotation.dart';

part 'cover_balance_history_dto.freezed.dart';
part 'cover_balance_history_dto.g.dart';

@freezed
class CoverBalanceHistoryDto with _$CoverBalanceHistoryDto {
  const factory CoverBalanceHistoryDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge') required String transactionType,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name:'transactionDirection') required String transactionDirection,
  }) = _CoverBalanceHistoryDto;

  factory CoverBalanceHistoryDto.fromJson(Map<String, dynamic> json) => _$CoverBalanceHistoryDtoFromJson(json);
}