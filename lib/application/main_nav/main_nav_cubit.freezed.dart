// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_nav_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainNavState {
  int get currentIndex => throw _privateConstructorUsedError;
  bool get isTabLoading => throw _privateConstructorUsedError;
  bool get isGoToTop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainNavStateCopyWith<MainNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainNavStateCopyWith<$Res> {
  factory $MainNavStateCopyWith(
          MainNavState value, $Res Function(MainNavState) then) =
      _$MainNavStateCopyWithImpl<$Res, MainNavState>;
  @useResult
  $Res call({int currentIndex, bool isTabLoading, bool isGoToTop});
}

/// @nodoc
class _$MainNavStateCopyWithImpl<$Res, $Val extends MainNavState>
    implements $MainNavStateCopyWith<$Res> {
  _$MainNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isTabLoading = null,
    Object? isGoToTop = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isTabLoading: null == isTabLoading
          ? _value.isTabLoading
          : isTabLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoToTop: null == isGoToTop
          ? _value.isGoToTop
          : isGoToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainNavStateImplCopyWith<$Res>
    implements $MainNavStateCopyWith<$Res> {
  factory _$$MainNavStateImplCopyWith(
          _$MainNavStateImpl value, $Res Function(_$MainNavStateImpl) then) =
      __$$MainNavStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, bool isTabLoading, bool isGoToTop});
}

/// @nodoc
class __$$MainNavStateImplCopyWithImpl<$Res>
    extends _$MainNavStateCopyWithImpl<$Res, _$MainNavStateImpl>
    implements _$$MainNavStateImplCopyWith<$Res> {
  __$$MainNavStateImplCopyWithImpl(
      _$MainNavStateImpl _value, $Res Function(_$MainNavStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isTabLoading = null,
    Object? isGoToTop = null,
  }) {
    return _then(_$MainNavStateImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isTabLoading: null == isTabLoading
          ? _value.isTabLoading
          : isTabLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoToTop: null == isGoToTop
          ? _value.isGoToTop
          : isGoToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainNavStateImpl implements _MainNavState {
  const _$MainNavStateImpl(
      {required this.currentIndex,
      required this.isTabLoading,
      required this.isGoToTop});

  @override
  final int currentIndex;
  @override
  final bool isTabLoading;
  @override
  final bool isGoToTop;

  @override
  String toString() {
    return 'MainNavState(currentIndex: $currentIndex, isTabLoading: $isTabLoading, isGoToTop: $isGoToTop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainNavStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.isTabLoading, isTabLoading) ||
                other.isTabLoading == isTabLoading) &&
            (identical(other.isGoToTop, isGoToTop) ||
                other.isGoToTop == isGoToTop));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentIndex, isTabLoading, isGoToTop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainNavStateImplCopyWith<_$MainNavStateImpl> get copyWith =>
      __$$MainNavStateImplCopyWithImpl<_$MainNavStateImpl>(this, _$identity);
}

abstract class _MainNavState implements MainNavState {
  const factory _MainNavState(
      {required final int currentIndex,
      required final bool isTabLoading,
      required final bool isGoToTop}) = _$MainNavStateImpl;

  @override
  int get currentIndex;
  @override
  bool get isTabLoading;
  @override
  bool get isGoToTop;
  @override
  @JsonKey(ignore: true)
  _$$MainNavStateImplCopyWith<_$MainNavStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
