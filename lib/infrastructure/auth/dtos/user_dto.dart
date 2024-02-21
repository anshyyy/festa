// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'gender', defaultValue: '') required String gender,
    @JsonKey(name: 'phoneNumber', defaultValue: '') required String phoneNumber,
    @JsonKey(name: 'dob', defaultValue: '') required String dob,
    @JsonKey(name: 'email') String? email,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
