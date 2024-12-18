// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventRules _$EventRulesFromJson(Map<String, dynamic> json) {
  return _EventRules.fromJson(json);
}

/// @nodoc
mixin _$EventRules {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAllowed', defaultValue: false)
  bool get isAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;

  /// Serializes this EventRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventRulesCopyWith<EventRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRulesCopyWith<$Res> {
  factory $EventRulesCopyWith(
          EventRules value, $Res Function(EventRules) then) =
      _$EventRulesCopyWithImpl<$Res, EventRules>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'isAllowed', defaultValue: false) bool isAllowed,
      @JsonKey(name: 'description', defaultValue: '') String description});
}

/// @nodoc
class _$EventRulesCopyWithImpl<$Res, $Val extends EventRules>
    implements $EventRulesCopyWith<$Res> {
  _$EventRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? isAllowed = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventRulesImplCopyWith<$Res>
    implements $EventRulesCopyWith<$Res> {
  factory _$$EventRulesImplCopyWith(
          _$EventRulesImpl value, $Res Function(_$EventRulesImpl) then) =
      __$$EventRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'imageUrl', defaultValue: '') String imageUrl,
      @JsonKey(name: 'isAllowed', defaultValue: false) bool isAllowed,
      @JsonKey(name: 'description', defaultValue: '') String description});
}

/// @nodoc
class __$$EventRulesImplCopyWithImpl<$Res>
    extends _$EventRulesCopyWithImpl<$Res, _$EventRulesImpl>
    implements _$$EventRulesImplCopyWith<$Res> {
  __$$EventRulesImplCopyWithImpl(
      _$EventRulesImpl _value, $Res Function(_$EventRulesImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? isAllowed = null,
    Object? description = null,
  }) {
    return _then(_$EventRulesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventRulesImpl implements _EventRules {
  _$EventRulesImpl(
      {@JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'imageUrl', defaultValue: '') required this.imageUrl,
      @JsonKey(name: 'isAllowed', defaultValue: false) required this.isAllowed,
      @JsonKey(name: 'description', defaultValue: '')
      required this.description});

  factory _$EventRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRulesImplFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(name: 'isAllowed', defaultValue: false)
  final bool isAllowed;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @override
  String toString() {
    return 'EventRules(name: $name, type: $type, imageUrl: $imageUrl, isAllowed: $isAllowed, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRulesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAllowed, isAllowed) ||
                other.isAllowed == isAllowed) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, imageUrl, isAllowed, description);

  /// Create a copy of EventRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventRulesImplCopyWith<_$EventRulesImpl> get copyWith =>
      __$$EventRulesImplCopyWithImpl<_$EventRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventRulesImplToJson(
      this,
    );
  }
}

abstract class _EventRules implements EventRules {
  factory _EventRules(
      {@JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'imageUrl', defaultValue: '')
      required final String imageUrl,
      @JsonKey(name: 'isAllowed', defaultValue: false)
      required final bool isAllowed,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description}) = _$EventRulesImpl;

  factory _EventRules.fromJson(Map<String, dynamic> json) =
      _$EventRulesImpl.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(name: 'isAllowed', defaultValue: false)
  bool get isAllowed;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;

  /// Create a copy of EventRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventRulesImplCopyWith<_$EventRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
