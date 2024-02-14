// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterState {
  List<Map<String, dynamic>> get filtersList =>
      throw _privateConstructorUsedError;
  String get currentFilter => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get filterOptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> filtersList,
      String currentFilter,
      List<Map<String, dynamic>> filterOptions});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filtersList = null,
    Object? currentFilter = null,
    Object? filterOptions = null,
  }) {
    return _then(_value.copyWith(
      filtersList: null == filtersList
          ? _value.filtersList
          : filtersList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as String,
      filterOptions: null == filterOptions
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> filtersList,
      String currentFilter,
      List<Map<String, dynamic>> filterOptions});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filtersList = null,
    Object? currentFilter = null,
    Object? filterOptions = null,
  }) {
    return _then(_$FilterStateImpl(
      filtersList: null == filtersList
          ? _value._filtersList
          : filtersList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as String,
      filterOptions: null == filterOptions
          ? _value._filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl(
      {required final List<Map<String, dynamic>> filtersList,
      required this.currentFilter,
      required final List<Map<String, dynamic>> filterOptions})
      : _filtersList = filtersList,
        _filterOptions = filterOptions;

  final List<Map<String, dynamic>> _filtersList;
  @override
  List<Map<String, dynamic>> get filtersList {
    if (_filtersList is EqualUnmodifiableListView) return _filtersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filtersList);
  }

  @override
  final String currentFilter;
  final List<Map<String, dynamic>> _filterOptions;
  @override
  List<Map<String, dynamic>> get filterOptions {
    if (_filterOptions is EqualUnmodifiableListView) return _filterOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterOptions);
  }

  @override
  String toString() {
    return 'FilterState(filtersList: $filtersList, currentFilter: $currentFilter, filterOptions: $filterOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._filtersList, _filtersList) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            const DeepCollectionEquality()
                .equals(other._filterOptions, _filterOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filtersList),
      currentFilter,
      const DeepCollectionEquality().hash(_filterOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
          {required final List<Map<String, dynamic>> filtersList,
          required final String currentFilter,
          required final List<Map<String, dynamic>> filterOptions}) =
      _$FilterStateImpl;

  @override
  List<Map<String, dynamic>> get filtersList;
  @override
  String get currentFilter;
  @override
  List<Map<String, dynamic>> get filterOptions;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
