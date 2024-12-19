// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationState {
  LocationRepository get locationRepository =>
      throw _privateConstructorUsedError;
  bool get showPermissionDialog => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isLocationSearchChanged => throw _privateConstructorUsedError;
  LocationDto get location => throw _privateConstructorUsedError;
  bool get showLocationDialog => throw _privateConstructorUsedError;
  List<SuggestionDto> get suggestions => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get locationSuggestions =>
      throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call(
      {LocationRepository locationRepository,
      bool showPermissionDialog,
      bool isSuccess,
      bool isLocationSearchChanged,
      LocationDto location,
      bool showLocationDialog,
      List<SuggestionDto> suggestions,
      List<Map<String, dynamic>> locationSuggestions,
      UserDto? user});

  $LocationDtoCopyWith<$Res> get location;
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationRepository = null,
    Object? showPermissionDialog = null,
    Object? isSuccess = null,
    Object? isLocationSearchChanged = null,
    Object? location = null,
    Object? showLocationDialog = null,
    Object? suggestions = null,
    Object? locationSuggestions = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      locationRepository: null == locationRepository
          ? _value.locationRepository
          : locationRepository // ignore: cast_nullable_to_non_nullable
              as LocationRepository,
      showPermissionDialog: null == showPermissionDialog
          ? _value.showPermissionDialog
          : showPermissionDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationSearchChanged: null == isLocationSearchChanged
          ? _value.isLocationSearchChanged
          : isLocationSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<SuggestionDto>,
      locationSuggestions: null == locationSuggestions
          ? _value.locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ) as $Val);
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res> get location {
    return $LocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
          _$LocationStateImpl value, $Res Function(_$LocationStateImpl) then) =
      __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationRepository locationRepository,
      bool showPermissionDialog,
      bool isSuccess,
      bool isLocationSearchChanged,
      LocationDto location,
      bool showLocationDialog,
      List<SuggestionDto> suggestions,
      List<Map<String, dynamic>> locationSuggestions,
      UserDto? user});

  @override
  $LocationDtoCopyWith<$Res> get location;
  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
      _$LocationStateImpl _value, $Res Function(_$LocationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationRepository = null,
    Object? showPermissionDialog = null,
    Object? isSuccess = null,
    Object? isLocationSearchChanged = null,
    Object? location = null,
    Object? showLocationDialog = null,
    Object? suggestions = null,
    Object? locationSuggestions = null,
    Object? user = freezed,
  }) {
    return _then(_$LocationStateImpl(
      locationRepository: null == locationRepository
          ? _value.locationRepository
          : locationRepository // ignore: cast_nullable_to_non_nullable
              as LocationRepository,
      showPermissionDialog: null == showPermissionDialog
          ? _value.showPermissionDialog
          : showPermissionDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationSearchChanged: null == isLocationSearchChanged
          ? _value.isLocationSearchChanged
          : isLocationSearchChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      showLocationDialog: null == showLocationDialog
          ? _value.showLocationDialog
          : showLocationDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<SuggestionDto>,
      locationSuggestions: null == locationSuggestions
          ? _value._locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc

class _$LocationStateImpl implements _LocationState {
  const _$LocationStateImpl(
      {required this.locationRepository,
      required this.showPermissionDialog,
      required this.isSuccess,
      required this.isLocationSearchChanged,
      required this.location,
      required this.showLocationDialog,
      required final List<SuggestionDto> suggestions,
      required final List<Map<String, dynamic>> locationSuggestions,
      this.user})
      : _suggestions = suggestions,
        _locationSuggestions = locationSuggestions;

  @override
  final LocationRepository locationRepository;
  @override
  final bool showPermissionDialog;
  @override
  final bool isSuccess;
  @override
  final bool isLocationSearchChanged;
  @override
  final LocationDto location;
  @override
  final bool showLocationDialog;
  final List<SuggestionDto> _suggestions;
  @override
  List<SuggestionDto> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  final List<Map<String, dynamic>> _locationSuggestions;
  @override
  List<Map<String, dynamic>> get locationSuggestions {
    if (_locationSuggestions is EqualUnmodifiableListView)
      return _locationSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationSuggestions);
  }

  @override
  final UserDto? user;

  @override
  String toString() {
    return 'LocationState(locationRepository: $locationRepository, showPermissionDialog: $showPermissionDialog, isSuccess: $isSuccess, isLocationSearchChanged: $isLocationSearchChanged, location: $location, showLocationDialog: $showLocationDialog, suggestions: $suggestions, locationSuggestions: $locationSuggestions, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.locationRepository, locationRepository) ||
                other.locationRepository == locationRepository) &&
            (identical(other.showPermissionDialog, showPermissionDialog) ||
                other.showPermissionDialog == showPermissionDialog) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(
                    other.isLocationSearchChanged, isLocationSearchChanged) ||
                other.isLocationSearchChanged == isLocationSearchChanged) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.showLocationDialog, showLocationDialog) ||
                other.showLocationDialog == showLocationDialog) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other._locationSuggestions, _locationSuggestions) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      locationRepository,
      showPermissionDialog,
      isSuccess,
      isLocationSearchChanged,
      location,
      showLocationDialog,
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(_locationSuggestions),
      user);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState implements LocationState {
  const factory _LocationState(
      {required final LocationRepository locationRepository,
      required final bool showPermissionDialog,
      required final bool isSuccess,
      required final bool isLocationSearchChanged,
      required final LocationDto location,
      required final bool showLocationDialog,
      required final List<SuggestionDto> suggestions,
      required final List<Map<String, dynamic>> locationSuggestions,
      final UserDto? user}) = _$LocationStateImpl;

  @override
  LocationRepository get locationRepository;
  @override
  bool get showPermissionDialog;
  @override
  bool get isSuccess;
  @override
  bool get isLocationSearchChanged;
  @override
  LocationDto get location;
  @override
  bool get showLocationDialog;
  @override
  List<SuggestionDto> get suggestions;
  @override
  List<Map<String, dynamic>> get locationSuggestions;
  @override
  UserDto? get user;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
