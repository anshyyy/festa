
import 'package:freezed_annotation/freezed_annotation.dart';

import '../cordinates/cordinates.dart';

part 'event_cordinates.freezed.dart';
part 'event_cordinates.g.dart';

@freezed
class EventCordinates with _$EventCordinates {
  factory EventCordinates({
     required int id,
    required String fullName,
    required Cordinates address,
    required String coverImagerUrl,
  }) = _EventCordinates;
	
  factory EventCordinates.fromJson(Map<String, dynamic> json) =>
			_$EventCordinatesFromJson(json);
}
