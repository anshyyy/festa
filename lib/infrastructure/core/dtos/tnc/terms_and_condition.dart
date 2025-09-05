import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_and_condition.freezed.dart';
part 'terms_and_condition.g.dart';

@freezed
class TermsAndCondition with _$TermsAndCondition {
  const factory TermsAndCondition({
    required int order,
    required String title,
    required String description,
  }) = _TermsAndCondition;

  factory TermsAndCondition.fromJson(Map<String, dynamic> json) => _$TermsAndConditionFromJson(json);
}
