// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_value_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterValueDto _$FilterValueDtoFromJson(Map<String, dynamic> json) {
  return _FilterValueDto.fromJson(json);
}

/// @nodoc
mixin _$FilterValueDto {
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rule', defaultValue: '')
  String get rule => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'emoji')
  String? get emoji => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isApplied => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  dynamic get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryId')
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this FilterValueDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterValueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterValueDtoCopyWith<FilterValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterValueDtoCopyWith<$Res> {
  factory $FilterValueDtoCopyWith(
          FilterValueDto value, $Res Function(FilterValueDto) then) =
      _$FilterValueDtoCopyWithImpl<$Res, FilterValueDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'rule', defaultValue: '') String rule,
      @JsonKey(name: 'icon', defaultValue: '') String icon,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(name: 'value') dynamic value,
      @JsonKey(name: 'categoryId') int? categoryId});
}

/// @nodoc
class _$FilterValueDtoCopyWithImpl<$Res, $Val extends FilterValueDto>
    implements $FilterValueDtoCopyWith<$Res> {
  _$FilterValueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterValueDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? name = null,
    Object? rule = null,
    Object? icon = null,
    Object? emoji = freezed,
    Object? isApplied = null,
    Object? value = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterValueDtoImplCopyWith<$Res>
    implements $FilterValueDtoCopyWith<$Res> {
  factory _$$FilterValueDtoImplCopyWith(_$FilterValueDtoImpl value,
          $Res Function(_$FilterValueDtoImpl) then) =
      __$$FilterValueDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'rule', defaultValue: '') String rule,
      @JsonKey(name: 'icon', defaultValue: '') String icon,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(name: 'value') dynamic value,
      @JsonKey(name: 'categoryId') int? categoryId});
}

/// @nodoc
class __$$FilterValueDtoImplCopyWithImpl<$Res>
    extends _$FilterValueDtoCopyWithImpl<$Res, _$FilterValueDtoImpl>
    implements _$$FilterValueDtoImplCopyWith<$Res> {
  __$$FilterValueDtoImplCopyWithImpl(
      _$FilterValueDtoImpl _value, $Res Function(_$FilterValueDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterValueDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? name = null,
    Object? rule = null,
    Object? icon = null,
    Object? emoji = freezed,
    Object? isApplied = null,
    Object? value = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$FilterValueDtoImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterValueDtoImpl implements _FilterValueDto {
  const _$FilterValueDtoImpl(
      {@JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'rule', defaultValue: '') required this.rule,
      @JsonKey(name: 'icon', defaultValue: '') required this.icon,
      @JsonKey(name: 'emoji') this.emoji,
      @JsonKey(defaultValue: false) required this.isApplied,
      @JsonKey(name: 'value') this.value,
      @JsonKey(name: 'categoryId') this.categoryId});

  factory _$FilterValueDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterValueDtoImplFromJson(json);

  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'rule', defaultValue: '')
  final String rule;
  @override
  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;
  @override
  @JsonKey(name: 'emoji')
  final String? emoji;
  @override
  @JsonKey(defaultValue: false)
  final bool isApplied;
  @override
  @JsonKey(name: 'value')
  final dynamic value;
  @override
  @JsonKey(name: 'categoryId')
  final int? categoryId;

  @override
  String toString() {
    return 'FilterValueDto(displayName: $displayName, name: $name, rule: $rule, icon: $icon, emoji: $emoji, isApplied: $isApplied, value: $value, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterValueDtoImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.isApplied, isApplied) ||
                other.isApplied == isApplied) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, name, rule, icon,
      emoji, isApplied, const DeepCollectionEquality().hash(value), categoryId);

  /// Create a copy of FilterValueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterValueDtoImplCopyWith<_$FilterValueDtoImpl> get copyWith =>
      __$$FilterValueDtoImplCopyWithImpl<_$FilterValueDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterValueDtoImplToJson(
      this,
    );
  }
}

abstract class _FilterValueDto implements FilterValueDto {
  const factory _FilterValueDto(
          {@JsonKey(name: 'displayName', defaultValue: '')
          required final String displayName,
          @JsonKey(name: 'name', defaultValue: '') required final String name,
          @JsonKey(name: 'rule', defaultValue: '') required final String rule,
          @JsonKey(name: 'icon', defaultValue: '') required final String icon,
          @JsonKey(name: 'emoji') final String? emoji,
          @JsonKey(defaultValue: false) required final bool isApplied,
          @JsonKey(name: 'value') final dynamic value,
          @JsonKey(name: 'categoryId') final int? categoryId}) =
      _$FilterValueDtoImpl;

  factory _FilterValueDto.fromJson(Map<String, dynamic> json) =
      _$FilterValueDtoImpl.fromJson;

  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'rule', defaultValue: '')
  String get rule;
  @override
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon;
  @override
  @JsonKey(name: 'emoji')
  String? get emoji;
  @override
  @JsonKey(defaultValue: false)
  bool get isApplied;
  @override
  @JsonKey(name: 'value')
  dynamic get value;
  @override
  @JsonKey(name: 'categoryId')
  int? get categoryId;

  /// Create a copy of FilterValueDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterValueDtoImplCopyWith<_$FilterValueDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
