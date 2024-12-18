// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_rules.freezed.dart';
part 'event_rules.g.dart';

@freezed
class EventRules with _$EventRules {
  factory EventRules({
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'imageUrl', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'isAllowed', defaultValue: false) required bool isAllowed,
    @JsonKey(name: 'description', defaultValue: '') required String description,
  }) = _EventRules;

  factory EventRules.fromJson(Map<String, dynamic> json) =>
      _$EventRulesFromJson(json);
}
