
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cordinates.freezed.dart';
part 'cordinates.g.dart';

@freezed
class Cordinates with _$Cordinates {
  factory Cordinates({
    required double lat,
    required double lng,
  }) = _Cordinates;
	
  factory Cordinates.fromJson(Map<String, dynamic> json) =>
			_$CordinatesFromJson(json);
}
