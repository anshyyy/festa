// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_tag_dto.freezed.dart';
part 'artist_tag_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistTagDto with _$ArtistTagDto {
  const factory ArtistTagDto({
    @JsonKey(name: 'id', defaultValue: 0)
    required int id,
    @JsonKey(name: 'tag', defaultValue: '') required String tag,
  }) = _ArtistTagDto;

  factory ArtistTagDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistTagDtoFromJson(json);
}
