
import 'package:freezed_annotation/freezed_annotation.dart';

part 'happyhours.freezed.dart';
part 'happyhours.g.dart';

@freezed
class HappyhoursDto with _$HappyhoursDto {
  factory HappyhoursDto({
    @JsonKey(name:'id') required int id,
    @JsonKey(name:'url') required List<String> urls,
  }) = _HappyhoursDto;
	

  factory HappyhoursDto.fromJson(Map<String, dynamic> json) =>
			_$HappyhoursDtoFromJson(json);
}
