// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingsMenuDto _$SettingsMenuDtoFromJson(Map<String, dynamic> json) {
  return _SettingsMenuDto.fromJson(json);
}

/// @nodoc
mixin _$SettingsMenuDto {
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'navigationRoute', defaultValue: '')
  String get navigationRoute => throw _privateConstructorUsedError;

  /// Serializes this SettingsMenuDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsMenuDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsMenuDtoCopyWith<SettingsMenuDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsMenuDtoCopyWith<$Res> {
  factory $SettingsMenuDtoCopyWith(
          SettingsMenuDto value, $Res Function(SettingsMenuDto) then) =
      _$SettingsMenuDtoCopyWithImpl<$Res, SettingsMenuDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'icon', defaultValue: '') String icon,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'navigationRoute', defaultValue: '')
      String navigationRoute});
}

/// @nodoc
class _$SettingsMenuDtoCopyWithImpl<$Res, $Val extends SettingsMenuDto>
    implements $SettingsMenuDtoCopyWith<$Res> {
  _$SettingsMenuDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsMenuDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? title = null,
    Object? navigationRoute = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      navigationRoute: null == navigationRoute
          ? _value.navigationRoute
          : navigationRoute // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsMenuDtoImplCopyWith<$Res>
    implements $SettingsMenuDtoCopyWith<$Res> {
  factory _$$SettingsMenuDtoImplCopyWith(_$SettingsMenuDtoImpl value,
          $Res Function(_$SettingsMenuDtoImpl) then) =
      __$$SettingsMenuDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'icon', defaultValue: '') String icon,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'navigationRoute', defaultValue: '')
      String navigationRoute});
}

/// @nodoc
class __$$SettingsMenuDtoImplCopyWithImpl<$Res>
    extends _$SettingsMenuDtoCopyWithImpl<$Res, _$SettingsMenuDtoImpl>
    implements _$$SettingsMenuDtoImplCopyWith<$Res> {
  __$$SettingsMenuDtoImplCopyWithImpl(
      _$SettingsMenuDtoImpl _value, $Res Function(_$SettingsMenuDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsMenuDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? title = null,
    Object? navigationRoute = null,
  }) {
    return _then(_$SettingsMenuDtoImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      navigationRoute: null == navigationRoute
          ? _value.navigationRoute
          : navigationRoute // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsMenuDtoImpl implements _SettingsMenuDto {
  const _$SettingsMenuDtoImpl(
      {@JsonKey(name: 'icon', defaultValue: '') required this.icon,
      @JsonKey(name: 'title', defaultValue: '') required this.title,
      @JsonKey(name: 'navigationRoute', defaultValue: '')
      required this.navigationRoute});

  factory _$SettingsMenuDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsMenuDtoImplFromJson(json);

  @override
  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'navigationRoute', defaultValue: '')
  final String navigationRoute;

  @override
  String toString() {
    return 'SettingsMenuDto(icon: $icon, title: $title, navigationRoute: $navigationRoute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsMenuDtoImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.navigationRoute, navigationRoute) ||
                other.navigationRoute == navigationRoute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, title, navigationRoute);

  /// Create a copy of SettingsMenuDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsMenuDtoImplCopyWith<_$SettingsMenuDtoImpl> get copyWith =>
      __$$SettingsMenuDtoImplCopyWithImpl<_$SettingsMenuDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsMenuDtoImplToJson(
      this,
    );
  }
}

abstract class _SettingsMenuDto implements SettingsMenuDto {
  const factory _SettingsMenuDto(
      {@JsonKey(name: 'icon', defaultValue: '') required final String icon,
      @JsonKey(name: 'title', defaultValue: '') required final String title,
      @JsonKey(name: 'navigationRoute', defaultValue: '')
      required final String navigationRoute}) = _$SettingsMenuDtoImpl;

  factory _SettingsMenuDto.fromJson(Map<String, dynamic> json) =
      _$SettingsMenuDtoImpl.fromJson;

  @override
  @JsonKey(name: 'icon', defaultValue: '')
  String get icon;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'navigationRoute', defaultValue: '')
  String get navigationRoute;

  /// Create a copy of SettingsMenuDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsMenuDtoImplCopyWith<_$SettingsMenuDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
