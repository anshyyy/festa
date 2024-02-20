// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ArtistDto with _$ArtistDto {
  const factory ArtistDto({
    @JsonKey(name: 'artist_id', defaultValue: 0) required int id,
    @JsonKey(name: 'full_name', defaultValue: '') required String fullName,
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'profile_image', defaultValue: '')
    required String profileImage,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);
}
