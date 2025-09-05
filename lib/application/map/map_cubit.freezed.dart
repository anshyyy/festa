// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  UserDto? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  LocationStorageService get locationStorageService =>
      throw _privateConstructorUsedError;
  TextEditingController get searchController =>
      throw _privateConstructorUsedError;
  MapController get mapController => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  List<EventCordinates> get events => throw _privateConstructorUsedError;
  LocationDto get savedLocation => throw _privateConstructorUsedError;
  List<Marker> get eventMarkers => throw _privateConstructorUsedError;
  LatLng? get selectedLocation => throw _privateConstructorUsedError;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {UserDto? user,
      bool isLoading,
      bool isSuccess,
      bool isFailed,
      LocationStorageService locationStorageService,
      TextEditingController searchController,
      MapController mapController,
      EventRepository eventRepository,
      List<EventCordinates> events,
      LocationDto savedLocation,
      List<Marker> eventMarkers,
      LatLng? selectedLocation});

  $UserDtoCopyWith<$Res>? get user;
  $LocationDtoCopyWith<$Res> get savedLocation;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailed = null,
    Object? locationStorageService = null,
    Object? searchController = null,
    Object? mapController = null,
    Object? eventRepository = null,
    Object? events = null,
    Object? savedLocation = null,
    Object? eventMarkers = null,
    Object? selectedLocation = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      locationStorageService: null == locationStorageService
          ? _value.locationStorageService
          : locationStorageService // ignore: cast_nullable_to_non_nullable
              as LocationStorageService,
      searchController: null == searchController
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      mapController: null == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as MapController,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventCordinates>,
      savedLocation: null == savedLocation
          ? _value.savedLocation
          : savedLocation // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      eventMarkers: null == eventMarkers
          ? _value.eventMarkers
          : eventMarkers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }

  /// Create a copy of MapState
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

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res> get savedLocation {
    return $LocationDtoCopyWith<$Res>(_value.savedLocation, (value) {
      return _then(_value.copyWith(savedLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserDto? user,
      bool isLoading,
      bool isSuccess,
      bool isFailed,
      LocationStorageService locationStorageService,
      TextEditingController searchController,
      MapController mapController,
      EventRepository eventRepository,
      List<EventCordinates> events,
      LocationDto savedLocation,
      List<Marker> eventMarkers,
      LatLng? selectedLocation});

  @override
  $UserDtoCopyWith<$Res>? get user;
  @override
  $LocationDtoCopyWith<$Res> get savedLocation;
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailed = null,
    Object? locationStorageService = null,
    Object? searchController = null,
    Object? mapController = null,
    Object? eventRepository = null,
    Object? events = null,
    Object? savedLocation = null,
    Object? eventMarkers = null,
    Object? selectedLocation = freezed,
  }) {
    return _then(_$MapStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      locationStorageService: null == locationStorageService
          ? _value.locationStorageService
          : locationStorageService // ignore: cast_nullable_to_non_nullable
              as LocationStorageService,
      searchController: null == searchController
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      mapController: null == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as MapController,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventCordinates>,
      savedLocation: null == savedLocation
          ? _value.savedLocation
          : savedLocation // ignore: cast_nullable_to_non_nullable
              as LocationDto,
      eventMarkers: null == eventMarkers
          ? _value._eventMarkers
          : eventMarkers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  const _$MapStateImpl(
      {this.user,
      required this.isLoading,
      required this.isSuccess,
      required this.isFailed,
      required this.locationStorageService,
      required this.searchController,
      required this.mapController,
      required this.eventRepository,
      required final List<EventCordinates> events,
      required this.savedLocation,
      required final List<Marker> eventMarkers,
      this.selectedLocation})
      : _events = events,
        _eventMarkers = eventMarkers;

  @override
  final UserDto? user;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailed;
  @override
  final LocationStorageService locationStorageService;
  @override
  final TextEditingController searchController;
  @override
  final MapController mapController;
  @override
  final EventRepository eventRepository;
  final List<EventCordinates> _events;
  @override
  List<EventCordinates> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final LocationDto savedLocation;
  final List<Marker> _eventMarkers;
  @override
  List<Marker> get eventMarkers {
    if (_eventMarkers is EqualUnmodifiableListView) return _eventMarkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventMarkers);
  }

  @override
  final LatLng? selectedLocation;

  @override
  String toString() {
    return 'MapState(user: $user, isLoading: $isLoading, isSuccess: $isSuccess, isFailed: $isFailed, locationStorageService: $locationStorageService, searchController: $searchController, mapController: $mapController, eventRepository: $eventRepository, events: $events, savedLocation: $savedLocation, eventMarkers: $eventMarkers, selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.locationStorageService, locationStorageService) ||
                other.locationStorageService == locationStorageService) &&
            (identical(other.searchController, searchController) ||
                other.searchController == searchController) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.savedLocation, savedLocation) ||
                other.savedLocation == savedLocation) &&
            const DeepCollectionEquality()
                .equals(other._eventMarkers, _eventMarkers) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      isLoading,
      isSuccess,
      isFailed,
      locationStorageService,
      searchController,
      mapController,
      eventRepository,
      const DeepCollectionEquality().hash(_events),
      savedLocation,
      const DeepCollectionEquality().hash(_eventMarkers),
      selectedLocation);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final UserDto? user,
      required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailed,
      required final LocationStorageService locationStorageService,
      required final TextEditingController searchController,
      required final MapController mapController,
      required final EventRepository eventRepository,
      required final List<EventCordinates> events,
      required final LocationDto savedLocation,
      required final List<Marker> eventMarkers,
      final LatLng? selectedLocation}) = _$MapStateImpl;

  @override
  UserDto? get user;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailed;
  @override
  LocationStorageService get locationStorageService;
  @override
  TextEditingController get searchController;
  @override
  MapController get mapController;
  @override
  EventRepository get eventRepository;
  @override
  List<EventCordinates> get events;
  @override
  LocationDto get savedLocation;
  @override
  List<Marker> get eventMarkers;
  @override
  LatLng? get selectedLocation;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
