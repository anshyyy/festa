// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_dto.freezed.dart';
part 'faq_dto.g.dart';

@freezed
class FAQDto with _$FAQDto {
  const factory FAQDto({
    @JsonKey(name: 'answer', defaultValue: '') required String answer,
    @JsonKey(name: 'question', defaultValue: '') required String question
  }) = _FAQDto;

  factory FAQDto.fromJson(Map<String, dynamic> json) =>
      _$FAQDtoFromJson(json);
}
