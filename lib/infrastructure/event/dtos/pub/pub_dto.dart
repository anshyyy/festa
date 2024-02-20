// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_dto.freezed.dart';
part 'pub_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PubDto with _$PubDto {
  const factory PubDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'userName', defaultValue: '') required String userName,
    @JsonKey(name: 'averageRating', defaultValue: 0.0)
    required double averageRating,
    @JsonKey(name: 'coverImageUrl', defaultValue: '')
    required String coverImageUrl,
  }) = _PubDto;

  factory PubDto.fromJson(Map<String, dynamic> json) => _$PubDtoFromJson(json);
}
