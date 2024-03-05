// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_confirmation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeleteConfirmationState {
  bool get noUse => throw _privateConstructorUsedError;
  bool get deleteEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteConfirmationStateCopyWith<DeleteConfirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteConfirmationStateCopyWith<$Res> {
  factory $DeleteConfirmationStateCopyWith(DeleteConfirmationState value,
          $Res Function(DeleteConfirmationState) then) =
      _$DeleteConfirmationStateCopyWithImpl<$Res, DeleteConfirmationState>;
  @useResult
  $Res call({bool noUse, bool deleteEnabled});
}

/// @nodoc
class _$DeleteConfirmationStateCopyWithImpl<$Res,
        $Val extends DeleteConfirmationState>
    implements $DeleteConfirmationStateCopyWith<$Res> {
  _$DeleteConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noUse = null,
    Object? deleteEnabled = null,
  }) {
    return _then(_value.copyWith(
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteEnabled: null == deleteEnabled
          ? _value.deleteEnabled
          : deleteEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteConfirmationStateImplCopyWith<$Res>
    implements $DeleteConfirmationStateCopyWith<$Res> {
  factory _$$DeleteConfirmationStateImplCopyWith(
          _$DeleteConfirmationStateImpl value,
          $Res Function(_$DeleteConfirmationStateImpl) then) =
      __$$DeleteConfirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool noUse, bool deleteEnabled});
}

/// @nodoc
class __$$DeleteConfirmationStateImplCopyWithImpl<$Res>
    extends _$DeleteConfirmationStateCopyWithImpl<$Res,
        _$DeleteConfirmationStateImpl>
    implements _$$DeleteConfirmationStateImplCopyWith<$Res> {
  __$$DeleteConfirmationStateImplCopyWithImpl(
      _$DeleteConfirmationStateImpl _value,
      $Res Function(_$DeleteConfirmationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noUse = null,
    Object? deleteEnabled = null,
  }) {
    return _then(_$DeleteConfirmationStateImpl(
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteEnabled: null == deleteEnabled
          ? _value.deleteEnabled
          : deleteEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeleteConfirmationStateImpl implements _DeleteConfirmationState {
  const _$DeleteConfirmationStateImpl(
      {required this.noUse, required this.deleteEnabled});

  @override
  final bool noUse;
  @override
  final bool deleteEnabled;

  @override
  String toString() {
    return 'DeleteConfirmationState(noUse: $noUse, deleteEnabled: $deleteEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteConfirmationStateImpl &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.deleteEnabled, deleteEnabled) ||
                other.deleteEnabled == deleteEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noUse, deleteEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteConfirmationStateImplCopyWith<_$DeleteConfirmationStateImpl>
      get copyWith => __$$DeleteConfirmationStateImplCopyWithImpl<
          _$DeleteConfirmationStateImpl>(this, _$identity);
}

abstract class _DeleteConfirmationState implements DeleteConfirmationState {
  const factory _DeleteConfirmationState(
      {required final bool noUse,
      required final bool deleteEnabled}) = _$DeleteConfirmationStateImpl;

  @override
  bool get noUse;
  @override
  bool get deleteEnabled;
  @override
  @JsonKey(ignore: true)
  _$$DeleteConfirmationStateImplCopyWith<_$DeleteConfirmationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
