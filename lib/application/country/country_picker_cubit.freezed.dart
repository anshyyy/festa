// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountryPickerState {
  String get selectedCountryDialCode => throw _privateConstructorUsedError;
  String get selectedCountryLocale => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get countryList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get tempCountryList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryPickerStateCopyWith<CountryPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryPickerStateCopyWith<$Res> {
  factory $CountryPickerStateCopyWith(
          CountryPickerState value, $Res Function(CountryPickerState) then) =
      _$CountryPickerStateCopyWithImpl<$Res, CountryPickerState>;
  @useResult
  $Res call(
      {String selectedCountryDialCode,
      String selectedCountryLocale,
      String searchText,
      List<Map<String, dynamic>> countryList,
      List<Map<String, dynamic>> tempCountryList});
}

/// @nodoc
class _$CountryPickerStateCopyWithImpl<$Res, $Val extends CountryPickerState>
    implements $CountryPickerStateCopyWith<$Res> {
  _$CountryPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountryDialCode = null,
    Object? selectedCountryLocale = null,
    Object? searchText = null,
    Object? countryList = null,
    Object? tempCountryList = null,
  }) {
    return _then(_value.copyWith(
      selectedCountryDialCode: null == selectedCountryDialCode
          ? _value.selectedCountryDialCode
          : selectedCountryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryLocale: null == selectedCountryLocale
          ? _value.selectedCountryLocale
          : selectedCountryLocale // ignore: cast_nullable_to_non_nullable
              as String,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      countryList: null == countryList
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tempCountryList: null == tempCountryList
          ? _value.tempCountryList
          : tempCountryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryPickerStateImplCopyWith<$Res>
    implements $CountryPickerStateCopyWith<$Res> {
  factory _$$CountryPickerStateImplCopyWith(_$CountryPickerStateImpl value,
          $Res Function(_$CountryPickerStateImpl) then) =
      __$$CountryPickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedCountryDialCode,
      String selectedCountryLocale,
      String searchText,
      List<Map<String, dynamic>> countryList,
      List<Map<String, dynamic>> tempCountryList});
}

/// @nodoc
class __$$CountryPickerStateImplCopyWithImpl<$Res>
    extends _$CountryPickerStateCopyWithImpl<$Res, _$CountryPickerStateImpl>
    implements _$$CountryPickerStateImplCopyWith<$Res> {
  __$$CountryPickerStateImplCopyWithImpl(_$CountryPickerStateImpl _value,
      $Res Function(_$CountryPickerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountryDialCode = null,
    Object? selectedCountryLocale = null,
    Object? searchText = null,
    Object? countryList = null,
    Object? tempCountryList = null,
  }) {
    return _then(_$CountryPickerStateImpl(
      selectedCountryDialCode: null == selectedCountryDialCode
          ? _value.selectedCountryDialCode
          : selectedCountryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryLocale: null == selectedCountryLocale
          ? _value.selectedCountryLocale
          : selectedCountryLocale // ignore: cast_nullable_to_non_nullable
              as String,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      countryList: null == countryList
          ? _value._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tempCountryList: null == tempCountryList
          ? _value._tempCountryList
          : tempCountryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$CountryPickerStateImpl implements _CountryPickerState {
  const _$CountryPickerStateImpl(
      {required this.selectedCountryDialCode,
      required this.selectedCountryLocale,
      required this.searchText,
      required final List<Map<String, dynamic>> countryList,
      required final List<Map<String, dynamic>> tempCountryList})
      : _countryList = countryList,
        _tempCountryList = tempCountryList;

  @override
  final String selectedCountryDialCode;
  @override
  final String selectedCountryLocale;
  @override
  final String searchText;
  final List<Map<String, dynamic>> _countryList;
  @override
  List<Map<String, dynamic>> get countryList {
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

  final List<Map<String, dynamic>> _tempCountryList;
  @override
  List<Map<String, dynamic>> get tempCountryList {
    if (_tempCountryList is EqualUnmodifiableListView) return _tempCountryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tempCountryList);
  }

  @override
  String toString() {
    return 'CountryPickerState(selectedCountryDialCode: $selectedCountryDialCode, selectedCountryLocale: $selectedCountryLocale, searchText: $searchText, countryList: $countryList, tempCountryList: $tempCountryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryPickerStateImpl &&
            (identical(
                    other.selectedCountryDialCode, selectedCountryDialCode) ||
                other.selectedCountryDialCode == selectedCountryDialCode) &&
            (identical(other.selectedCountryLocale, selectedCountryLocale) ||
                other.selectedCountryLocale == selectedCountryLocale) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList) &&
            const DeepCollectionEquality()
                .equals(other._tempCountryList, _tempCountryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCountryDialCode,
      selectedCountryLocale,
      searchText,
      const DeepCollectionEquality().hash(_countryList),
      const DeepCollectionEquality().hash(_tempCountryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryPickerStateImplCopyWith<_$CountryPickerStateImpl> get copyWith =>
      __$$CountryPickerStateImplCopyWithImpl<_$CountryPickerStateImpl>(
          this, _$identity);
}

abstract class _CountryPickerState implements CountryPickerState {
  const factory _CountryPickerState(
          {required final String selectedCountryDialCode,
          required final String selectedCountryLocale,
          required final String searchText,
          required final List<Map<String, dynamic>> countryList,
          required final List<Map<String, dynamic>> tempCountryList}) =
      _$CountryPickerStateImpl;

  @override
  String get selectedCountryDialCode;
  @override
  String get selectedCountryLocale;
  @override
  String get searchText;
  @override
  List<Map<String, dynamic>> get countryList;
  @override
  List<Map<String, dynamic>> get tempCountryList;
  @override
  @JsonKey(ignore: true)
  _$$CountryPickerStateImplCopyWith<_$CountryPickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
