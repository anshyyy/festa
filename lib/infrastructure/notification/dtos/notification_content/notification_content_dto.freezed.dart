// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationContentDto _$NotificationContentDtoFromJson(
    Map<String, dynamic> json) {
  return _NotificationContentDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationContentDto {
  @JsonKey(name: 'body', defaultValue: '')
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;

  /// Serializes this NotificationContentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationContentDtoCopyWith<NotificationContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationContentDtoCopyWith<$Res> {
  factory $NotificationContentDtoCopyWith(NotificationContentDto value,
          $Res Function(NotificationContentDto) then) =
      _$NotificationContentDtoCopyWithImpl<$Res, NotificationContentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'body', defaultValue: '') String body,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class _$NotificationContentDtoCopyWithImpl<$Res,
        $Val extends NotificationContentDto>
    implements $NotificationContentDtoCopyWith<$Res> {
  _$NotificationContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationContentDtoImplCopyWith<$Res>
    implements $NotificationContentDtoCopyWith<$Res> {
  factory _$$NotificationContentDtoImplCopyWith(
          _$NotificationContentDtoImpl value,
          $Res Function(_$NotificationContentDtoImpl) then) =
      __$$NotificationContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'body', defaultValue: '') String body,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class __$$NotificationContentDtoImplCopyWithImpl<$Res>
    extends _$NotificationContentDtoCopyWithImpl<$Res,
        _$NotificationContentDtoImpl>
    implements _$$NotificationContentDtoImplCopyWith<$Res> {
  __$$NotificationContentDtoImplCopyWithImpl(
      _$NotificationContentDtoImpl _value,
      $Res Function(_$NotificationContentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? title = null,
  }) {
    return _then(_$NotificationContentDtoImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationContentDtoImpl implements _NotificationContentDto {
  const _$NotificationContentDtoImpl(
      {@JsonKey(name: 'body', defaultValue: '') required this.body,
      @JsonKey(name: 'title', defaultValue: '') required this.title});

  factory _$NotificationContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationContentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'body', defaultValue: '')
  final String body;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @override
  String toString() {
    return 'NotificationContentDto(body: $body, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationContentDtoImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, body, title);

  /// Create a copy of NotificationContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationContentDtoImplCopyWith<_$NotificationContentDtoImpl>
      get copyWith => __$$NotificationContentDtoImplCopyWithImpl<
          _$NotificationContentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationContentDtoImplToJson(
      this,
    );
  }
}

abstract class _NotificationContentDto implements NotificationContentDto {
  const factory _NotificationContentDto(
      {@JsonKey(name: 'body', defaultValue: '') required final String body,
      @JsonKey(name: 'title', defaultValue: '')
      required final String title}) = _$NotificationContentDtoImpl;

  factory _NotificationContentDto.fromJson(Map<String, dynamic> json) =
      _$NotificationContentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'body', defaultValue: '')
  String get body;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;

  /// Create a copy of NotificationContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationContentDtoImplCopyWith<_$NotificationContentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
