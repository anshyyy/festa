// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalization_menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalizationMenuDto _$PersonalizationMenuDtoFromJson(
    Map<String, dynamic> json) {
  return _PersonalizationMenuDto.fromJson(json);
}

/// @nodoc
mixin _$PersonalizationMenuDto {
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'list', defaultValue: [])
  List<PersonalizationOptionDto> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalizationMenuDtoCopyWith<PersonalizationMenuDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizationMenuDtoCopyWith<$Res> {
  factory $PersonalizationMenuDtoCopyWith(PersonalizationMenuDto value,
          $Res Function(PersonalizationMenuDto) then) =
      _$PersonalizationMenuDtoCopyWithImpl<$Res, PersonalizationMenuDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'list', defaultValue: [])
      List<PersonalizationOptionDto> list});
}

/// @nodoc
class _$PersonalizationMenuDtoCopyWithImpl<$Res,
        $Val extends PersonalizationMenuDto>
    implements $PersonalizationMenuDtoCopyWith<$Res> {
  _$PersonalizationMenuDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationOptionDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizationMenuDtoImplCopyWith<$Res>
    implements $PersonalizationMenuDtoCopyWith<$Res> {
  factory _$$PersonalizationMenuDtoImplCopyWith(
          _$PersonalizationMenuDtoImpl value,
          $Res Function(_$PersonalizationMenuDtoImpl) then) =
      __$$PersonalizationMenuDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'list', defaultValue: [])
      List<PersonalizationOptionDto> list});
}

/// @nodoc
class __$$PersonalizationMenuDtoImplCopyWithImpl<$Res>
    extends _$PersonalizationMenuDtoCopyWithImpl<$Res,
        _$PersonalizationMenuDtoImpl>
    implements _$$PersonalizationMenuDtoImplCopyWith<$Res> {
  __$$PersonalizationMenuDtoImplCopyWithImpl(
      _$PersonalizationMenuDtoImpl _value,
      $Res Function(_$PersonalizationMenuDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? list = null,
  }) {
    return _then(_$PersonalizationMenuDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationOptionDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizationMenuDtoImpl implements _PersonalizationMenuDto {
  const _$PersonalizationMenuDtoImpl(
      {@JsonKey(name: 'title', defaultValue: '') required this.title,
      @JsonKey(name: 'list', defaultValue: []) required this.list});

  factory _$PersonalizationMenuDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizationMenuDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'list', defaultValue: [])
  final List<PersonalizationOptionDto> list;

  @override
  String toString() {
    return 'PersonalizationMenuDto(title: $title, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizationMenuDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizationMenuDtoImplCopyWith<_$PersonalizationMenuDtoImpl>
      get copyWith => __$$PersonalizationMenuDtoImplCopyWithImpl<
          _$PersonalizationMenuDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizationMenuDtoImplToJson(
      this,
    );
  }
}

abstract class _PersonalizationMenuDto implements PersonalizationMenuDto {
  const factory _PersonalizationMenuDto(
      {@JsonKey(name: 'title', defaultValue: '') required final String title,
      @JsonKey(name: 'list', defaultValue: [])
      required final List<PersonalizationOptionDto>
          list}) = _$PersonalizationMenuDtoImpl;

  factory _PersonalizationMenuDto.fromJson(Map<String, dynamic> json) =
      _$PersonalizationMenuDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'list', defaultValue: [])
  List<PersonalizationOptionDto> get list;
  @override
  @JsonKey(ignore: true)
  _$$PersonalizationMenuDtoImplCopyWith<_$PersonalizationMenuDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
