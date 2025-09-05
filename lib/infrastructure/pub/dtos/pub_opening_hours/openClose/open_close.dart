
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_close.freezed.dart';
part 'open_close.g.dart';

@freezed
class OpenClose with _$OpenClose {
  const factory OpenClose({
    required int day,
    required String time,
  }) = _OpenClose;

  factory OpenClose.fromJson(Map<String, dynamic> json) =>
      _$OpenCloseFromJson(json);
}
