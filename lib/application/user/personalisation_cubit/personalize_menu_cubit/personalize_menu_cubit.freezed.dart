// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalize_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalizeMenuState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  List<PersonalizationOptionDto> get menuOptionsList =>
      throw _privateConstructorUsedError;

  /// Create a copy of PersonalizeMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalizeMenuStateCopyWith<PersonalizeMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizeMenuStateCopyWith<$Res> {
  factory $PersonalizeMenuStateCopyWith(PersonalizeMenuState value,
          $Res Function(PersonalizeMenuState) then) =
      _$PersonalizeMenuStateCopyWithImpl<$Res, PersonalizeMenuState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      List<PersonalizationOptionDto> menuOptionsList});
}

/// @nodoc
class _$PersonalizeMenuStateCopyWithImpl<$Res,
        $Val extends PersonalizeMenuState>
    implements $PersonalizeMenuStateCopyWith<$Res> {
  _$PersonalizeMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalizeMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? menuOptionsList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      menuOptionsList: null == menuOptionsList
          ? _value.menuOptionsList
          : menuOptionsList // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationOptionDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizeMenuStateImplCopyWith<$Res>
    implements $PersonalizeMenuStateCopyWith<$Res> {
  factory _$$PersonalizeMenuStateImplCopyWith(_$PersonalizeMenuStateImpl value,
          $Res Function(_$PersonalizeMenuStateImpl) then) =
      __$$PersonalizeMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      List<PersonalizationOptionDto> menuOptionsList});
}

/// @nodoc
class __$$PersonalizeMenuStateImplCopyWithImpl<$Res>
    extends _$PersonalizeMenuStateCopyWithImpl<$Res, _$PersonalizeMenuStateImpl>
    implements _$$PersonalizeMenuStateImplCopyWith<$Res> {
  __$$PersonalizeMenuStateImplCopyWithImpl(_$PersonalizeMenuStateImpl _value,
      $Res Function(_$PersonalizeMenuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalizeMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? menuOptionsList = null,
  }) {
    return _then(_$PersonalizeMenuStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      menuOptionsList: null == menuOptionsList
          ? _value._menuOptionsList
          : menuOptionsList // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationOptionDto>,
    ));
  }
}

/// @nodoc

class _$PersonalizeMenuStateImpl implements _PersonalizeMenuState {
  const _$PersonalizeMenuStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      required final List<PersonalizationOptionDto> menuOptionsList})
      : _menuOptionsList = menuOptionsList;

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  final List<PersonalizationOptionDto> _menuOptionsList;
  @override
  List<PersonalizationOptionDto> get menuOptionsList {
    if (_menuOptionsList is EqualUnmodifiableListView) return _menuOptionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuOptionsList);
  }

  @override
  String toString() {
    return 'PersonalizeMenuState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, menuOptionsList: $menuOptionsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizeMenuStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            const DeepCollectionEquality()
                .equals(other._menuOptionsList, _menuOptionsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccessful,
      isFailed, noUse, const DeepCollectionEquality().hash(_menuOptionsList));

  /// Create a copy of PersonalizeMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizeMenuStateImplCopyWith<_$PersonalizeMenuStateImpl>
      get copyWith =>
          __$$PersonalizeMenuStateImplCopyWithImpl<_$PersonalizeMenuStateImpl>(
              this, _$identity);
}

abstract class _PersonalizeMenuState implements PersonalizeMenuState {
  const factory _PersonalizeMenuState(
          {required final bool isLoading,
          required final bool isSuccessful,
          required final bool isFailed,
          required final bool noUse,
          required final List<PersonalizationOptionDto> menuOptionsList}) =
      _$PersonalizeMenuStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  List<PersonalizationOptionDto> get menuOptionsList;

  /// Create a copy of PersonalizeMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalizeMenuStateImplCopyWith<_$PersonalizeMenuStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
