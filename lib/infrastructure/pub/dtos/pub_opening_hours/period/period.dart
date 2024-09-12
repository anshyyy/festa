import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/infrastructure/pub/dtos/pub_opening_hours/openClose/open_close.dart';

part 'period.freezed.dart';
part 'period.g.dart';

@freezed
class Period with _$Period {
  const factory Period({
    @JsonKey(name: 'open') required OpenClose open,
    @JsonKey(name: 'close') required OpenClose close,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}