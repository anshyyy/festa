
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_activity.freezed.dart';
part 'event_activity.g.dart';

@freezed
class EventActivity with _$EventActivity {
  factory EventActivity({
    @JsonKey(name: 'name',defaultValue: '') required String name,
    @JsonKey(name:'imageUrl',defaultValue: '') required String imageUrl,
    @JsonKey(name:'description',defaultValue: '') required String description
  }) = _EventActivity;
	
  factory EventActivity.fromJson(Map<String, dynamic> json) =>
			_$EventActivityFromJson(json);
}
