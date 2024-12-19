// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialMediaDTO _$SocialMediaDTOFromJson(Map<String, dynamic> json) {
  return _SocialMediaDTO.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaDTO {
  Map<String, String>? get socialMediaLinks =>
      throw _privateConstructorUsedError;

  /// Serializes this SocialMediaDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialMediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialMediaDTOCopyWith<SocialMediaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaDTOCopyWith<$Res> {
  factory $SocialMediaDTOCopyWith(
          SocialMediaDTO value, $Res Function(SocialMediaDTO) then) =
      _$SocialMediaDTOCopyWithImpl<$Res, SocialMediaDTO>;
  @useResult
  $Res call({Map<String, String>? socialMediaLinks});
}

/// @nodoc
class _$SocialMediaDTOCopyWithImpl<$Res, $Val extends SocialMediaDTO>
    implements $SocialMediaDTOCopyWith<$Res> {
  _$SocialMediaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialMediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialMediaLinks = freezed,
  }) {
    return _then(_value.copyWith(
      socialMediaLinks: freezed == socialMediaLinks
          ? _value.socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaDTOImplCopyWith<$Res>
    implements $SocialMediaDTOCopyWith<$Res> {
  factory _$$SocialMediaDTOImplCopyWith(_$SocialMediaDTOImpl value,
          $Res Function(_$SocialMediaDTOImpl) then) =
      __$$SocialMediaDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String>? socialMediaLinks});
}

/// @nodoc
class __$$SocialMediaDTOImplCopyWithImpl<$Res>
    extends _$SocialMediaDTOCopyWithImpl<$Res, _$SocialMediaDTOImpl>
    implements _$$SocialMediaDTOImplCopyWith<$Res> {
  __$$SocialMediaDTOImplCopyWithImpl(
      _$SocialMediaDTOImpl _value, $Res Function(_$SocialMediaDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialMediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialMediaLinks = freezed,
  }) {
    return _then(_$SocialMediaDTOImpl(
      socialMediaLinks: freezed == socialMediaLinks
          ? _value._socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaDTOImpl implements _SocialMediaDTO {
  _$SocialMediaDTOImpl({final Map<String, String>? socialMediaLinks})
      : _socialMediaLinks = socialMediaLinks;

  factory _$SocialMediaDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialMediaDTOImplFromJson(json);

  final Map<String, String>? _socialMediaLinks;
  @override
  Map<String, String>? get socialMediaLinks {
    final value = _socialMediaLinks;
    if (value == null) return null;
    if (_socialMediaLinks is EqualUnmodifiableMapView) return _socialMediaLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SocialMediaDTO(socialMediaLinks: $socialMediaLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._socialMediaLinks, _socialMediaLinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_socialMediaLinks));

  /// Create a copy of SocialMediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaDTOImplCopyWith<_$SocialMediaDTOImpl> get copyWith =>
      __$$SocialMediaDTOImplCopyWithImpl<_$SocialMediaDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaDTOImplToJson(
      this,
    );
  }
}

abstract class _SocialMediaDTO implements SocialMediaDTO {
  factory _SocialMediaDTO({final Map<String, String>? socialMediaLinks}) =
      _$SocialMediaDTOImpl;

  factory _SocialMediaDTO.fromJson(Map<String, dynamic> json) =
      _$SocialMediaDTOImpl.fromJson;

  @override
  Map<String, String>? get socialMediaLinks;

  /// Create a copy of SocialMediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialMediaDTOImplCopyWith<_$SocialMediaDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
