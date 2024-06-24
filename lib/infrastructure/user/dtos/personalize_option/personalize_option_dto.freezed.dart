// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalize_option_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalizationOptionDto _$PersonalizationOptionDtoFromJson(
    Map<String, dynamic> json) {
  return _PersonalizationOptionDto.fromJson(json);
}

/// @nodoc
mixin _$PersonalizationOptionDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'text', defaultValue: '')
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected', defaultValue: false)
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalizationOptionDtoCopyWith<PersonalizationOptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizationOptionDtoCopyWith<$Res> {
  factory $PersonalizationOptionDtoCopyWith(PersonalizationOptionDto value,
          $Res Function(PersonalizationOptionDto) then) =
      _$PersonalizationOptionDtoCopyWithImpl<$Res, PersonalizationOptionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'text', defaultValue: '') String text,
      @JsonKey(name: 'isSelected', defaultValue: false) bool isSelected});
}

/// @nodoc
class _$PersonalizationOptionDtoCopyWithImpl<$Res,
        $Val extends PersonalizationOptionDto>
    implements $PersonalizationOptionDtoCopyWith<$Res> {
  _$PersonalizationOptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizationOptionDtoImplCopyWith<$Res>
    implements $PersonalizationOptionDtoCopyWith<$Res> {
  factory _$$PersonalizationOptionDtoImplCopyWith(
          _$PersonalizationOptionDtoImpl value,
          $Res Function(_$PersonalizationOptionDtoImpl) then) =
      __$$PersonalizationOptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'text', defaultValue: '') String text,
      @JsonKey(name: 'isSelected', defaultValue: false) bool isSelected});
}

/// @nodoc
class __$$PersonalizationOptionDtoImplCopyWithImpl<$Res>
    extends _$PersonalizationOptionDtoCopyWithImpl<$Res,
        _$PersonalizationOptionDtoImpl>
    implements _$$PersonalizationOptionDtoImplCopyWith<$Res> {
  __$$PersonalizationOptionDtoImplCopyWithImpl(
      _$PersonalizationOptionDtoImpl _value,
      $Res Function(_$PersonalizationOptionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? isSelected = null,
  }) {
    return _then(_$PersonalizationOptionDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizationOptionDtoImpl implements _PersonalizationOptionDto {
  const _$PersonalizationOptionDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'text', defaultValue: '') required this.text,
      @JsonKey(name: 'isSelected', defaultValue: false)
      required this.isSelected});

  factory _$PersonalizationOptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizationOptionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'text', defaultValue: '')
  final String text;
  @override
  @JsonKey(name: 'isSelected', defaultValue: false)
  final bool isSelected;

  @override
  String toString() {
    return 'PersonalizationOptionDto(type: $type, text: $text, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizationOptionDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, text, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizationOptionDtoImplCopyWith<_$PersonalizationOptionDtoImpl>
      get copyWith => __$$PersonalizationOptionDtoImplCopyWithImpl<
          _$PersonalizationOptionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizationOptionDtoImplToJson(
      this,
    );
  }
}

abstract class _PersonalizationOptionDto implements PersonalizationOptionDto {
  const factory _PersonalizationOptionDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'text', defaultValue: '') required final String text,
      @JsonKey(name: 'isSelected', defaultValue: false)
      required final bool isSelected}) = _$PersonalizationOptionDtoImpl;

  factory _PersonalizationOptionDto.fromJson(Map<String, dynamic> json) =
      _$PersonalizationOptionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'text', defaultValue: '')
  String get text;
  @override
  @JsonKey(name: 'isSelected', defaultValue: false)
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$PersonalizationOptionDtoImplCopyWith<_$PersonalizationOptionDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
