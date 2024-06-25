// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'music_dto.freezed.dart';
part 'music_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MusicDto with _$MusicDto {
  const factory MusicDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'audioUrl', defaultValue: '') required String audioUrl,
    @JsonKey(name: 'imageUrl', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'isLiked', defaultValue: false) required bool isLiked,
    @JsonKey(name: 'isPlaying', defaultValue: false) required bool isPlaying,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'length', defaultValue: 0) required int length,
  }) = _MusicDto;

  factory MusicDto.fromJson(Map<String, dynamic> json) => _$MusicDtoFromJson(json);
}
