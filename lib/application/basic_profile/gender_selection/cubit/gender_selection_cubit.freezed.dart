// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenderSelectionState {
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaveEnable => throw _privateConstructorUsedError;
  List<String> get lsOFSex => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  int get selectedSex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenderSelectionStateCopyWith<GenderSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderSelectionStateCopyWith<$Res> {
  factory $GenderSelectionStateCopyWith(GenderSelectionState value,
          $Res Function(GenderSelectionState) then) =
      _$GenderSelectionStateCopyWithImpl<$Res, GenderSelectionState>;
  @useResult
  $Res call(
      {bool isFailed,
      bool isSuccessful,
      bool isLoading,
      bool isSaveEnable,
      List<String> lsOFSex,
      String sex,
      int selectedSex});
}

/// @nodoc
class _$GenderSelectionStateCopyWithImpl<$Res,
        $Val extends GenderSelectionState>
    implements $GenderSelectionStateCopyWith<$Res> {
  _$GenderSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? isLoading = null,
    Object? isSaveEnable = null,
    Object? lsOFSex = null,
    Object? sex = null,
    Object? selectedSex = null,
  }) {
    return _then(_value.copyWith(
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaveEnable: null == isSaveEnable
          ? _value.isSaveEnable
          : isSaveEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      lsOFSex: null == lsOFSex
          ? _value.lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSex: null == selectedSex
          ? _value.selectedSex
          : selectedSex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderSelectionStateImplCopyWith<$Res>
    implements $GenderSelectionStateCopyWith<$Res> {
  factory _$$GenderSelectionStateImplCopyWith(_$GenderSelectionStateImpl value,
          $Res Function(_$GenderSelectionStateImpl) then) =
      __$$GenderSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFailed,
      bool isSuccessful,
      bool isLoading,
      bool isSaveEnable,
      List<String> lsOFSex,
      String sex,
      int selectedSex});
}

/// @nodoc
class __$$GenderSelectionStateImplCopyWithImpl<$Res>
    extends _$GenderSelectionStateCopyWithImpl<$Res, _$GenderSelectionStateImpl>
    implements _$$GenderSelectionStateImplCopyWith<$Res> {
  __$$GenderSelectionStateImplCopyWithImpl(_$GenderSelectionStateImpl _value,
      $Res Function(_$GenderSelectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? isLoading = null,
    Object? isSaveEnable = null,
    Object? lsOFSex = null,
    Object? sex = null,
    Object? selectedSex = null,
  }) {
    return _then(_$GenderSelectionStateImpl(
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaveEnable: null == isSaveEnable
          ? _value.isSaveEnable
          : isSaveEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      lsOFSex: null == lsOFSex
          ? _value._lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSex: null == selectedSex
          ? _value.selectedSex
          : selectedSex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GenderSelectionStateImpl implements _GenderSelectionState {
  const _$GenderSelectionStateImpl(
      {required this.isFailed,
      required this.isSuccessful,
      required this.isLoading,
      required this.isSaveEnable,
      required final List<String> lsOFSex,
      required this.sex,
      required this.selectedSex})
      : _lsOFSex = lsOFSex;

  @override
  final bool isFailed;
  @override
  final bool isSuccessful;
  @override
  final bool isLoading;
  @override
  final bool isSaveEnable;
  final List<String> _lsOFSex;
  @override
  List<String> get lsOFSex {
    if (_lsOFSex is EqualUnmodifiableListView) return _lsOFSex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOFSex);
  }

  @override
  final String sex;
  @override
  final int selectedSex;

  @override
  String toString() {
    return 'GenderSelectionState(isFailed: $isFailed, isSuccessful: $isSuccessful, isLoading: $isLoading, isSaveEnable: $isSaveEnable, lsOFSex: $lsOFSex, sex: $sex, selectedSex: $selectedSex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderSelectionStateImpl &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaveEnable, isSaveEnable) ||
                other.isSaveEnable == isSaveEnable) &&
            const DeepCollectionEquality().equals(other._lsOFSex, _lsOFSex) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.selectedSex, selectedSex) ||
                other.selectedSex == selectedSex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFailed,
      isSuccessful,
      isLoading,
      isSaveEnable,
      const DeepCollectionEquality().hash(_lsOFSex),
      sex,
      selectedSex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderSelectionStateImplCopyWith<_$GenderSelectionStateImpl>
      get copyWith =>
          __$$GenderSelectionStateImplCopyWithImpl<_$GenderSelectionStateImpl>(
              this, _$identity);
}

abstract class _GenderSelectionState implements GenderSelectionState {
  const factory _GenderSelectionState(
      {required final bool isFailed,
      required final bool isSuccessful,
      required final bool isLoading,
      required final bool isSaveEnable,
      required final List<String> lsOFSex,
      required final String sex,
      required final int selectedSex}) = _$GenderSelectionStateImpl;

  @override
  bool get isFailed;
  @override
  bool get isSuccessful;
  @override
  bool get isLoading;
  @override
  bool get isSaveEnable;
  @override
  List<String> get lsOFSex;
  @override
  String get sex;
  @override
  int get selectedSex;
  @override
  @JsonKey(ignore: true)
  _$$GenderSelectionStateImplCopyWith<_$GenderSelectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
