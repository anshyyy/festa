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
  bool get isLoading => throw _privateConstructorUsedError;
  String get currentActive => throw _privateConstructorUsedError;
  List<FilterDto> get filters => throw _privateConstructorUsedError;
  List<FilterValueDto> get filterValues => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get isClearFilters => throw _privateConstructorUsedError;
  bool get isFiltersApplied => throw _privateConstructorUsedError;

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
      {bool isLoading,
      String currentActive,
      List<FilterDto> filters,
      List<FilterValueDto> filterValues,
      bool noUse,
      bool isClearFilters,
      bool isFiltersApplied});
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
    Object? isLoading = null,
    Object? currentActive = null,
    Object? filters = null,
    Object? filterValues = null,
    Object? noUse = null,
    Object? isClearFilters = null,
    Object? isFiltersApplied = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentActive: null == currentActive
          ? _value.currentActive
          : currentActive // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<FilterDto>,
      filterValues: null == filterValues
          ? _value.filterValues
          : filterValues // ignore: cast_nullable_to_non_nullable
              as List<FilterValueDto>,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearFilters: null == isClearFilters
          ? _value.isClearFilters
          : isClearFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      isFiltersApplied: null == isFiltersApplied
          ? _value.isFiltersApplied
          : isFiltersApplied // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {bool isLoading,
      String currentActive,
      List<FilterDto> filters,
      List<FilterValueDto> filterValues,
      bool noUse,
      bool isClearFilters,
      bool isFiltersApplied});
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
    Object? isLoading = null,
    Object? currentActive = null,
    Object? filters = null,
    Object? filterValues = null,
    Object? noUse = null,
    Object? isClearFilters = null,
    Object? isFiltersApplied = null,
  }) {
    return _then(_$FilterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentActive: null == currentActive
          ? _value.currentActive
          : currentActive // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<FilterDto>,
      filterValues: null == filterValues
          ? _value.filterValues
          : filterValues // ignore: cast_nullable_to_non_nullable
              as List<FilterValueDto>,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearFilters: null == isClearFilters
          ? _value.isClearFilters
          : isClearFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      isFiltersApplied: null == isFiltersApplied
          ? _value.isFiltersApplied
          : isFiltersApplied // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl(
      {required this.isLoading,
      required this.currentActive,
      required this.filters,
      required this.filterValues,
      required this.noUse,
      required this.isClearFilters,
      required this.isFiltersApplied});

  @override
  final bool isLoading;
  @override
  final String currentActive;
  @override
  final List<FilterDto> filters;
  @override
  final List<FilterValueDto> filterValues;
  @override
  final bool noUse;
  @override
  final bool isClearFilters;
  @override
  final bool isFiltersApplied;

  @override
  String toString() {
    return 'FilterState(isLoading: $isLoading, currentActive: $currentActive, filters: $filters, filterValues: $filterValues, noUse: $noUse, isClearFilters: $isClearFilters, isFiltersApplied: $isFiltersApplied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentActive, currentActive) ||
                other.currentActive == currentActive) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            const DeepCollectionEquality()
                .equals(other.filterValues, filterValues) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.isClearFilters, isClearFilters) ||
                other.isClearFilters == isClearFilters) &&
            (identical(other.isFiltersApplied, isFiltersApplied) ||
                other.isFiltersApplied == isFiltersApplied));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      currentActive,
      const DeepCollectionEquality().hash(filters),
      const DeepCollectionEquality().hash(filterValues),
      noUse,
      isClearFilters,
      isFiltersApplied);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {required final bool isLoading,
      required final String currentActive,
      required final List<FilterDto> filters,
      required final List<FilterValueDto> filterValues,
      required final bool noUse,
      required final bool isClearFilters,
      required final bool isFiltersApplied}) = _$FilterStateImpl;

  @override
  bool get isLoading;
  @override
  String get currentActive;
  @override
  List<FilterDto> get filters;
  @override
  List<FilterValueDto> get filterValues;
  @override
  bool get noUse;
  @override
  bool get isClearFilters;
  @override
  bool get isFiltersApplied;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
