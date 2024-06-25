// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StarterState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTermsAndConditionChecked => throw _privateConstructorUsedError;
  bool get isOnboardingComplete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarterStateCopyWith<StarterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarterStateCopyWith<$Res> {
  factory $StarterStateCopyWith(
          StarterState value, $Res Function(StarterState) then) =
      _$StarterStateCopyWithImpl<$Res, StarterState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isTermsAndConditionChecked,
      bool isOnboardingComplete});
}

/// @nodoc
class _$StarterStateCopyWithImpl<$Res, $Val extends StarterState>
    implements $StarterStateCopyWith<$Res> {
  _$StarterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTermsAndConditionChecked = null,
    Object? isOnboardingComplete = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermsAndConditionChecked: null == isTermsAndConditionChecked
          ? _value.isTermsAndConditionChecked
          : isTermsAndConditionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnboardingComplete: null == isOnboardingComplete
          ? _value.isOnboardingComplete
          : isOnboardingComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StarterStateImplCopyWith<$Res>
    implements $StarterStateCopyWith<$Res> {
  factory _$$StarterStateImplCopyWith(
          _$StarterStateImpl value, $Res Function(_$StarterStateImpl) then) =
      __$$StarterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isTermsAndConditionChecked,
      bool isOnboardingComplete});
}

/// @nodoc
class __$$StarterStateImplCopyWithImpl<$Res>
    extends _$StarterStateCopyWithImpl<$Res, _$StarterStateImpl>
    implements _$$StarterStateImplCopyWith<$Res> {
  __$$StarterStateImplCopyWithImpl(
      _$StarterStateImpl _value, $Res Function(_$StarterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTermsAndConditionChecked = null,
    Object? isOnboardingComplete = null,
  }) {
    return _then(_$StarterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermsAndConditionChecked: null == isTermsAndConditionChecked
          ? _value.isTermsAndConditionChecked
          : isTermsAndConditionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnboardingComplete: null == isOnboardingComplete
          ? _value.isOnboardingComplete
          : isOnboardingComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StarterStateImpl with DiagnosticableTreeMixin implements _StarterState {
  const _$StarterStateImpl(
      {required this.isLoading,
      required this.isTermsAndConditionChecked,
      required this.isOnboardingComplete});

  @override
  final bool isLoading;
  @override
  final bool isTermsAndConditionChecked;
  @override
  final bool isOnboardingComplete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StarterState(isLoading: $isLoading, isTermsAndConditionChecked: $isTermsAndConditionChecked, isOnboardingComplete: $isOnboardingComplete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StarterState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty(
          'isTermsAndConditionChecked', isTermsAndConditionChecked))
      ..add(DiagnosticsProperty('isOnboardingComplete', isOnboardingComplete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTermsAndConditionChecked,
                    isTermsAndConditionChecked) ||
                other.isTermsAndConditionChecked ==
                    isTermsAndConditionChecked) &&
            (identical(other.isOnboardingComplete, isOnboardingComplete) ||
                other.isOnboardingComplete == isOnboardingComplete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isTermsAndConditionChecked, isOnboardingComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StarterStateImplCopyWith<_$StarterStateImpl> get copyWith =>
      __$$StarterStateImplCopyWithImpl<_$StarterStateImpl>(this, _$identity);
}

abstract class _StarterState implements StarterState {
  const factory _StarterState(
      {required final bool isLoading,
      required final bool isTermsAndConditionChecked,
      required final bool isOnboardingComplete}) = _$StarterStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isTermsAndConditionChecked;
  @override
  bool get isOnboardingComplete;
  @override
  @JsonKey(ignore: true)
  _$$StarterStateImplCopyWith<_$StarterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
