// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'externalUserId', defaultValue: '')
  String get externalUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage', defaultValue: '')
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImage', defaultValue: '')
  String get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', defaultValue: '')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber', defaultValue: '')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'dob', defaultValue: '')
  String get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlights', defaultValue: [])
  List<HighlightDto>? get highlight => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'extraDetails', defaultValue: null)
  UserExtraDetailsDto? get extraDetailsDto =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'isPrivateAccount', defaultValue: false)
  bool get isPrivateAccount => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'externalUserId', defaultValue: '') String externalUserId,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '') String profileImage,
      @JsonKey(name: 'coverImage', defaultValue: '') String coverImage,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'gender', defaultValue: '') String gender,
      @JsonKey(name: 'phoneNumber', defaultValue: '') String phoneNumber,
      @JsonKey(name: 'dob', defaultValue: '') String dob,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'highlights', defaultValue: [])
      List<HighlightDto>? highlight,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      UserExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'isPrivateAccount', defaultValue: false)
      bool isPrivateAccount});

  $TagDtoCopyWith<$Res>? get tag;
  $UserExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalUserId = null,
    Object? fullName = null,
    Object? profileImage = null,
    Object? coverImage = null,
    Object? description = null,
    Object? gender = null,
    Object? phoneNumber = null,
    Object? dob = null,
    Object? email = freezed,
    Object? highlight = freezed,
    Object? tag = freezed,
    Object? extraDetailsDto = freezed,
    Object? isPrivateAccount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      externalUserId: null == externalUserId
          ? _value.externalUserId
          : externalUserId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      highlight: freezed == highlight
          ? _value.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as List<HighlightDto>?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as UserExtraDetailsDto?,
      isPrivateAccount: null == isPrivateAccount
          ? _value.isPrivateAccount
          : isPrivateAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagDtoCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $TagDtoCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto {
    if (_value.extraDetailsDto == null) {
      return null;
    }

    return $UserExtraDetailsDtoCopyWith<$Res>(_value.extraDetailsDto!, (value) {
      return _then(_value.copyWith(extraDetailsDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'externalUserId', defaultValue: '') String externalUserId,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '') String profileImage,
      @JsonKey(name: 'coverImage', defaultValue: '') String coverImage,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'gender', defaultValue: '') String gender,
      @JsonKey(name: 'phoneNumber', defaultValue: '') String phoneNumber,
      @JsonKey(name: 'dob', defaultValue: '') String dob,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'highlights', defaultValue: [])
      List<HighlightDto>? highlight,
      @JsonKey(name: 'tag', defaultValue: null) TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      UserExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'isPrivateAccount', defaultValue: false)
      bool isPrivateAccount});

  @override
  $TagDtoCopyWith<$Res>? get tag;
  @override
  $UserExtraDetailsDtoCopyWith<$Res>? get extraDetailsDto;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalUserId = null,
    Object? fullName = null,
    Object? profileImage = null,
    Object? coverImage = null,
    Object? description = null,
    Object? gender = null,
    Object? phoneNumber = null,
    Object? dob = null,
    Object? email = freezed,
    Object? highlight = freezed,
    Object? tag = freezed,
    Object? extraDetailsDto = freezed,
    Object? isPrivateAccount = null,
  }) {
    return _then(_$UserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      externalUserId: null == externalUserId
          ? _value.externalUserId
          : externalUserId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      highlight: freezed == highlight
          ? _value._highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as List<HighlightDto>?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDto?,
      extraDetailsDto: freezed == extraDetailsDto
          ? _value.extraDetailsDto
          : extraDetailsDto // ignore: cast_nullable_to_non_nullable
              as UserExtraDetailsDto?,
      isPrivateAccount: null == isPrivateAccount
          ? _value.isPrivateAccount
          : isPrivateAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  const _$UserDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'externalUserId', defaultValue: '')
      required this.externalUserId,
      @JsonKey(name: 'fullName', defaultValue: '') required this.fullName,
      @JsonKey(name: 'profileImage', defaultValue: '')
      required this.profileImage,
      @JsonKey(name: 'coverImage', defaultValue: '') required this.coverImage,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'gender', defaultValue: '') required this.gender,
      @JsonKey(name: 'phoneNumber', defaultValue: '') required this.phoneNumber,
      @JsonKey(name: 'dob', defaultValue: '') required this.dob,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'highlights', defaultValue: [])
      final List<HighlightDto>? highlight,
      @JsonKey(name: 'tag', defaultValue: null) this.tag,
      @JsonKey(name: 'extraDetails', defaultValue: null) this.extraDetailsDto,
      @JsonKey(name: 'isPrivateAccount', defaultValue: false)
      required this.isPrivateAccount})
      : _highlight = highlight;

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'externalUserId', defaultValue: '')
  final String externalUserId;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  final String fullName;
  @override
  @JsonKey(name: 'profileImage', defaultValue: '')
  final String profileImage;
  @override
  @JsonKey(name: 'coverImage', defaultValue: '')
  final String coverImage;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'gender', defaultValue: '')
  final String gender;
  @override
  @JsonKey(name: 'phoneNumber', defaultValue: '')
  final String phoneNumber;
  @override
  @JsonKey(name: 'dob', defaultValue: '')
  final String dob;
  @override
  @JsonKey(name: 'email')
  final String? email;
  final List<HighlightDto>? _highlight;
  @override
  @JsonKey(name: 'highlights', defaultValue: [])
  List<HighlightDto>? get highlight {
    final value = _highlight;
    if (value == null) return null;
    if (_highlight is EqualUnmodifiableListView) return _highlight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'tag', defaultValue: null)
  final TagDto? tag;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  final UserExtraDetailsDto? extraDetailsDto;
  @override
  @JsonKey(name: 'isPrivateAccount', defaultValue: false)
  final bool isPrivateAccount;

  @override
  String toString() {
    return 'UserDto(id: $id, externalUserId: $externalUserId, fullName: $fullName, profileImage: $profileImage, coverImage: $coverImage, description: $description, gender: $gender, phoneNumber: $phoneNumber, dob: $dob, email: $email, highlight: $highlight, tag: $tag, extraDetailsDto: $extraDetailsDto, isPrivateAccount: $isPrivateAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.externalUserId, externalUserId) ||
                other.externalUserId == externalUserId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._highlight, _highlight) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.extraDetailsDto, extraDetailsDto) ||
                other.extraDetailsDto == extraDetailsDto) &&
            (identical(other.isPrivateAccount, isPrivateAccount) ||
                other.isPrivateAccount == isPrivateAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      externalUserId,
      fullName,
      profileImage,
      coverImage,
      description,
      gender,
      phoneNumber,
      dob,
      email,
      const DeepCollectionEquality().hash(_highlight),
      tag,
      extraDetailsDto,
      isPrivateAccount);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'externalUserId', defaultValue: '')
      required final String externalUserId,
      @JsonKey(name: 'fullName', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'profileImage', defaultValue: '')
      required final String profileImage,
      @JsonKey(name: 'coverImage', defaultValue: '')
      required final String coverImage,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'gender', defaultValue: '') required final String gender,
      @JsonKey(name: 'phoneNumber', defaultValue: '')
      required final String phoneNumber,
      @JsonKey(name: 'dob', defaultValue: '') required final String dob,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'highlights', defaultValue: [])
      final List<HighlightDto>? highlight,
      @JsonKey(name: 'tag', defaultValue: null) final TagDto? tag,
      @JsonKey(name: 'extraDetails', defaultValue: null)
      final UserExtraDetailsDto? extraDetailsDto,
      @JsonKey(name: 'isPrivateAccount', defaultValue: false)
      required final bool isPrivateAccount}) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'externalUserId', defaultValue: '')
  String get externalUserId;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName;
  @override
  @JsonKey(name: 'profileImage', defaultValue: '')
  String get profileImage;
  @override
  @JsonKey(name: 'coverImage', defaultValue: '')
  String get coverImage;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'gender', defaultValue: '')
  String get gender;
  @override
  @JsonKey(name: 'phoneNumber', defaultValue: '')
  String get phoneNumber;
  @override
  @JsonKey(name: 'dob', defaultValue: '')
  String get dob;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'highlights', defaultValue: [])
  List<HighlightDto>? get highlight;
  @override
  @JsonKey(name: 'tag', defaultValue: null)
  TagDto? get tag;
  @override
  @JsonKey(name: 'extraDetails', defaultValue: null)
  UserExtraDetailsDto? get extraDetailsDto;
  @override
  @JsonKey(name: 'isPrivateAccount', defaultValue: false)
  bool get isPrivateAccount;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
