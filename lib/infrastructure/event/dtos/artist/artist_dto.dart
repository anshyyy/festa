// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistDto with _$ArtistDto {
  const factory ArtistDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'userName', defaultValue: '') required String coverImageUrl,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'profileImage', defaultValue: '')
    required String profileImage,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);
}
