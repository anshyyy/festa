// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/dtos/tag/tag_dto.dart';
import '../../user/dtos/user_extra_details/user_extra_details_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'externalUserId', defaultValue: '')
    required String externalUserId,
    @JsonKey(name: 'fullName', defaultValue: '') required String fullName,
    @JsonKey(name: 'profileImage', defaultValue: '')
    required String profileImage,
     @JsonKey(name: 'coverImage', defaultValue: '')
    required String coverImage,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'gender', defaultValue: '') required String gender,
    @JsonKey(name: 'phoneNumber', defaultValue: '') required String phoneNumber,
    @JsonKey(name: 'dob', defaultValue: '') required String dob,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
    @JsonKey(name: 'extraDetails', defaultValue: null) UserExtraDetailsDto? extraDetailsDto,
    @JsonKey(name: 'isPrivateAccount', defaultValue: false) required bool isPrivateAccount,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
