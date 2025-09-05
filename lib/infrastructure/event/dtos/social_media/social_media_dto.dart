import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_dto.freezed.dart';
part 'social_media_dto.g.dart';

@freezed
class SocialMediaDTO with _$SocialMediaDTO {
  factory SocialMediaDTO({
    Map<String, String>? socialMediaLinks,
  }) = _SocialMediaDTO;

  factory SocialMediaDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaDTOFromJson(json);
}
