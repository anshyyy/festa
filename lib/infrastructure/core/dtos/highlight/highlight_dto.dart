
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_dto.freezed.dart';
part 'highlight_dto.g.dart';

@freezed
class HighlightDto with _$HighlightDto {
  const factory HighlightDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'url', defaultValue: '') required String url
  }) = _HighlightDto;

  factory HighlightDto.fromJson(Map<String, dynamic> json) =>
      _$HighlightDtoFromJson(json);
}
