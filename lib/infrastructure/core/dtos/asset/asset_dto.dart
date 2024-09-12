// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_dto.freezed.dart';
part 'asset_dto.g.dart';

@freezed
class AssetDto with _$AssetDto {
  const factory AssetDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'url', defaultValue: '') required String url,
    @JsonKey(name: 'thumbnail', defaultValue: '') required String thumbnail,
  }) = _AssetDto;

  factory AssetDto.fromJson(Map<String, dynamic> json) =>
      _$AssetDtoFromJson(json);
}

enum AssetType {
  image,
  video,
}