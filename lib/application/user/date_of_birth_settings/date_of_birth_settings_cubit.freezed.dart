// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_of_birth_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DateOfBirthSettingsState {
  bool get openDatePicker => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;
  DateTime get updatedDate => throw _privateConstructorUsedError;
  String get currentDob => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateOfBirthSettingsStateCopyWith<DateOfBirthSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateOfBirthSettingsStateCopyWith<$Res> {
  factory $DateOfBirthSettingsStateCopyWith(DateOfBirthSettingsState value,
          $Res Function(DateOfBirthSettingsState) then) =
      _$DateOfBirthSettingsStateCopyWithImpl<$Res, DateOfBirthSettingsState>;
  @useResult
  $Res call(
      {bool openDatePicker,
      DateTime selectedDate,
      DateTime updatedDate,
      String currentDob,
      UserRepository userRepository,
      UserDto? user,
      bool isLoading});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$DateOfBirthSettingsStateCopyWithImpl<$Res,
        $Val extends DateOfBirthSettingsState>
    implements $DateOfBirthSettingsStateCopyWith<$Res> {
  _$DateOfBirthSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openDatePicker = null,
    Object? selectedDate = null,
    Object? updatedDate = null,
    Object? currentDob = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      openDatePicker: null == openDatePicker
          ? _value.openDatePicker
          : openDatePicker // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDob: null == currentDob
          ? _value.currentDob
          : currentDob // ignore: cast_nullable_to_non_nullable
              as String,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DateOfBirthSettingsStateImplCopyWith<$Res>
    implements $DateOfBirthSettingsStateCopyWith<$Res> {
  factory _$$DateOfBirthSettingsStateImplCopyWith(
          _$DateOfBirthSettingsStateImpl value,
          $Res Function(_$DateOfBirthSettingsStateImpl) then) =
      __$$DateOfBirthSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool openDatePicker,
      DateTime selectedDate,
      DateTime updatedDate,
      String currentDob,
      UserRepository userRepository,
      UserDto? user,
      bool isLoading});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$DateOfBirthSettingsStateImplCopyWithImpl<$Res>
    extends _$DateOfBirthSettingsStateCopyWithImpl<$Res,
        _$DateOfBirthSettingsStateImpl>
    implements _$$DateOfBirthSettingsStateImplCopyWith<$Res> {
  __$$DateOfBirthSettingsStateImplCopyWithImpl(
      _$DateOfBirthSettingsStateImpl _value,
      $Res Function(_$DateOfBirthSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openDatePicker = null,
    Object? selectedDate = null,
    Object? updatedDate = null,
    Object? currentDob = null,
    Object? userRepository = null,
    Object? user = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$DateOfBirthSettingsStateImpl(
      openDatePicker: null == openDatePicker
          ? _value.openDatePicker
          : openDatePicker // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDob: null == currentDob
          ? _value.currentDob
          : currentDob // ignore: cast_nullable_to_non_nullable
              as String,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DateOfBirthSettingsStateImpl implements _DateOfBirthSettingsState {
  const _$DateOfBirthSettingsStateImpl(
      {required this.openDatePicker,
      required this.selectedDate,
      required this.updatedDate,
      required this.currentDob,
      required this.userRepository,
      this.user,
      required this.isLoading});

  @override
  final bool openDatePicker;
  @override
  final DateTime selectedDate;
  @override
  final DateTime updatedDate;
  @override
  final String currentDob;
  @override
  final UserRepository userRepository;
  @override
  final UserDto? user;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'DateOfBirthSettingsState(openDatePicker: $openDatePicker, selectedDate: $selectedDate, updatedDate: $updatedDate, currentDob: $currentDob, userRepository: $userRepository, user: $user, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateOfBirthSettingsStateImpl &&
            (identical(other.openDatePicker, openDatePicker) ||
                other.openDatePicker == openDatePicker) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.currentDob, currentDob) ||
                other.currentDob == currentDob) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, openDatePicker, selectedDate,
      updatedDate, currentDob, userRepository, user, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateOfBirthSettingsStateImplCopyWith<_$DateOfBirthSettingsStateImpl>
      get copyWith => __$$DateOfBirthSettingsStateImplCopyWithImpl<
          _$DateOfBirthSettingsStateImpl>(this, _$identity);
}

abstract class _DateOfBirthSettingsState implements DateOfBirthSettingsState {
  const factory _DateOfBirthSettingsState(
      {required final bool openDatePicker,
      required final DateTime selectedDate,
      required final DateTime updatedDate,
      required final String currentDob,
      required final UserRepository userRepository,
      final UserDto? user,
      required final bool isLoading}) = _$DateOfBirthSettingsStateImpl;

  @override
  bool get openDatePicker;
  @override
  DateTime get selectedDate;
  @override
  DateTime get updatedDate;
  @override
  String get currentDob;
  @override
  UserRepository get userRepository;
  @override
  UserDto? get user;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$DateOfBirthSettingsStateImplCopyWith<_$DateOfBirthSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
