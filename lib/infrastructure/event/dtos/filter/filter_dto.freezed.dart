// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterDto _$FilterDtoFromJson(Map<String, dynamic> json) {
  return _FilterDto.fromJson(json);
}

/// @nodoc
mixin _$FilterDto {
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isApplied => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<FilterValueDto> get values => throw _privateConstructorUsedError;

  /// Serializes this FilterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterDtoCopyWith<FilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDtoCopyWith<$Res> {
  factory $FilterDtoCopyWith(FilterDto value, $Res Function(FilterDto) then) =
      _$FilterDtoCopyWithImpl<$Res, FilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(defaultValue: []) List<FilterValueDto> values});
}

/// @nodoc
class _$FilterDtoCopyWithImpl<$Res, $Val extends FilterDto>
    implements $FilterDtoCopyWith<$Res> {
  _$FilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? name = null,
    Object? isApplied = null,
    Object? values = null,
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
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FilterValueDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterDtoImplCopyWith<$Res>
    implements $FilterDtoCopyWith<$Res> {
  factory _$$FilterDtoImplCopyWith(
          _$FilterDtoImpl value, $Res Function(_$FilterDtoImpl) then) =
      __$$FilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(defaultValue: false) bool isApplied,
      @JsonKey(defaultValue: []) List<FilterValueDto> values});
}

/// @nodoc
class __$$FilterDtoImplCopyWithImpl<$Res>
    extends _$FilterDtoCopyWithImpl<$Res, _$FilterDtoImpl>
    implements _$$FilterDtoImplCopyWith<$Res> {
  __$$FilterDtoImplCopyWithImpl(
      _$FilterDtoImpl _value, $Res Function(_$FilterDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? name = null,
    Object? isApplied = null,
    Object? values = null,
  }) {
    return _then(_$FilterDtoImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FilterValueDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterDtoImpl implements _FilterDto {
  const _$FilterDtoImpl(
      {@JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(defaultValue: false) required this.isApplied,
      @JsonKey(defaultValue: []) required this.values});

  factory _$FilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: false)
  final bool isApplied;
  @override
  @JsonKey(defaultValue: [])
  final List<FilterValueDto> values;

  @override
  String toString() {
    return 'FilterDto(displayName: $displayName, name: $name, isApplied: $isApplied, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterDtoImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isApplied, isApplied) ||
                other.isApplied == isApplied) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, name, isApplied,
      const DeepCollectionEquality().hash(values));

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterDtoImplCopyWith<_$FilterDtoImpl> get copyWith =>
      __$$FilterDtoImplCopyWithImpl<_$FilterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterDtoImplToJson(
      this,
    );
  }
}

abstract class _FilterDto implements FilterDto {
  const factory _FilterDto(
      {@JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(defaultValue: false) required final bool isApplied,
      @JsonKey(defaultValue: [])
      required final List<FilterValueDto> values}) = _$FilterDtoImpl;

  factory _FilterDto.fromJson(Map<String, dynamic> json) =
      _$FilterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: false)
  bool get isApplied;
  @override
  @JsonKey(defaultValue: [])
  List<FilterValueDto> get values;

  /// Create a copy of FilterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterDtoImplCopyWith<_$FilterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
