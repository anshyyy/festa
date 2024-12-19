// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventActivity _$EventActivityFromJson(Map<String, dynamic> json) {
  return _EventActivity.fromJson(json);
}

/// @nodoc
mixin _$EventActivity {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;

  /// Serializes this EventActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventActivityCopyWith<EventActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventActivityCopyWith<$Res> {
  factory $EventActivityCopyWith(
          EventActivity value, $Res Function(EventActivity) then) =
      _$EventActivityCopyWithImpl<$Res, EventActivity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'description', defaultValue: '') String description});
}

/// @nodoc
class _$EventActivityCopyWithImpl<$Res, $Val extends EventActivity>
    implements $EventActivityCopyWith<$Res> {
  _$EventActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventActivityImplCopyWith<$Res>
    implements $EventActivityCopyWith<$Res> {
  factory _$$EventActivityImplCopyWith(
          _$EventActivityImpl value, $Res Function(_$EventActivityImpl) then) =
      __$$EventActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'description', defaultValue: '') String description});
}

/// @nodoc
class __$$EventActivityImplCopyWithImpl<$Res>
    extends _$EventActivityCopyWithImpl<$Res, _$EventActivityImpl>
    implements _$$EventActivityImplCopyWith<$Res> {
  __$$EventActivityImplCopyWithImpl(
      _$EventActivityImpl _value, $Res Function(_$EventActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_$EventActivityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventActivityImpl implements _EventActivity {
  _$EventActivityImpl(
      {@JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'imageUrl', defaultValue: '') required this.imageUrl,
      @JsonKey(name: 'description', defaultValue: '')
      required this.description});

  factory _$EventActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventActivityImplFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @override
  String toString() {
    return 'EventActivity(name: $name, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventActivityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, description);

  /// Create a copy of EventActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventActivityImplCopyWith<_$EventActivityImpl> get copyWith =>
      __$$EventActivityImplCopyWithImpl<_$EventActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventActivityImplToJson(
      this,
    );
  }
}

abstract class _EventActivity implements EventActivity {
  factory _EventActivity(
      {@JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'imageUrl', defaultValue: '')
      required final String imageUrl,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description}) = _$EventActivityImpl;

  factory _EventActivity.fromJson(Map<String, dynamic> json) =
      _$EventActivityImpl.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;

  /// Create a copy of EventActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventActivityImplCopyWith<_$EventActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
