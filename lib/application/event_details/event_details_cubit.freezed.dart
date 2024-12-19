// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  String get apiBaseUrl => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;
  EventDto? get event => throw _privateConstructorUsedError;
  List<AssetDto> get pubassetsForTheEvent => throw _privateConstructorUsedError;
  String get eventDistance => throw _privateConstructorUsedError;
  bool get lsdExpanded => throw _privateConstructorUsedError;
  bool get ambExpanded => throw _privateConstructorUsedError;
  bool get fnbExpanded => throw _privateConstructorUsedError;
  bool get faqExpanded => throw _privateConstructorUsedError;
  bool get isEventLiked => throw _privateConstructorUsedError;
  bool get isOpenMapModal => throw _privateConstructorUsedError;
  List<AvailableMap> get mapsOptions =>
      throw _privateConstructorUsedError; //required List<>
  Coords? get eventLocation => throw _privateConstructorUsedError;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDetailsStateCopyWith<EventDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsStateCopyWith<$Res> {
  factory $EventDetailsStateCopyWith(
          EventDetailsState value, $Res Function(EventDetailsState) then) =
      _$EventDetailsStateCopyWithImpl<$Res, EventDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      String apiBaseUrl,
      EventRepository eventRepository,
      EventDto? event,
      List<AssetDto> pubassetsForTheEvent,
      String eventDistance,
      bool lsdExpanded,
      bool ambExpanded,
      bool fnbExpanded,
      bool faqExpanded,
      bool isEventLiked,
      bool isOpenMapModal,
      List<AvailableMap> mapsOptions,
      Coords? eventLocation});

  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventDetailsStateCopyWithImpl<$Res, $Val extends EventDetailsState>
    implements $EventDetailsStateCopyWith<$Res> {
  _$EventDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? pubassetsForTheEvent = null,
    Object? eventDistance = null,
    Object? lsdExpanded = null,
    Object? ambExpanded = null,
    Object? fnbExpanded = null,
    Object? faqExpanded = null,
    Object? isEventLiked = null,
    Object? isOpenMapModal = null,
    Object? mapsOptions = null,
    Object? eventLocation = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      pubassetsForTheEvent: null == pubassetsForTheEvent
          ? _value.pubassetsForTheEvent
          : pubassetsForTheEvent // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      eventDistance: null == eventDistance
          ? _value.eventDistance
          : eventDistance // ignore: cast_nullable_to_non_nullable
              as String,
      lsdExpanded: null == lsdExpanded
          ? _value.lsdExpanded
          : lsdExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      ambExpanded: null == ambExpanded
          ? _value.ambExpanded
          : ambExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      fnbExpanded: null == fnbExpanded
          ? _value.fnbExpanded
          : fnbExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      faqExpanded: null == faqExpanded
          ? _value.faqExpanded
          : faqExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isEventLiked: null == isEventLiked
          ? _value.isEventLiked
          : isEventLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenMapModal: null == isOpenMapModal
          ? _value.isOpenMapModal
          : isOpenMapModal // ignore: cast_nullable_to_non_nullable
              as bool,
      mapsOptions: null == mapsOptions
          ? _value.mapsOptions
          : mapsOptions // ignore: cast_nullable_to_non_nullable
              as List<AvailableMap>,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as Coords?,
    ) as $Val);
  }

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventDtoCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventDtoCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDetailsStateImplCopyWith<$Res>
    implements $EventDetailsStateCopyWith<$Res> {
  factory _$$EventDetailsStateImplCopyWith(_$EventDetailsStateImpl value,
          $Res Function(_$EventDetailsStateImpl) then) =
      __$$EventDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      String apiBaseUrl,
      EventRepository eventRepository,
      EventDto? event,
      List<AssetDto> pubassetsForTheEvent,
      String eventDistance,
      bool lsdExpanded,
      bool ambExpanded,
      bool fnbExpanded,
      bool faqExpanded,
      bool isEventLiked,
      bool isOpenMapModal,
      List<AvailableMap> mapsOptions,
      Coords? eventLocation});

  @override
  $EventDtoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$EventDetailsStateImplCopyWithImpl<$Res>
    extends _$EventDetailsStateCopyWithImpl<$Res, _$EventDetailsStateImpl>
    implements _$$EventDetailsStateImplCopyWith<$Res> {
  __$$EventDetailsStateImplCopyWithImpl(_$EventDetailsStateImpl _value,
      $Res Function(_$EventDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
    Object? event = freezed,
    Object? pubassetsForTheEvent = null,
    Object? eventDistance = null,
    Object? lsdExpanded = null,
    Object? ambExpanded = null,
    Object? fnbExpanded = null,
    Object? faqExpanded = null,
    Object? isEventLiked = null,
    Object? isOpenMapModal = null,
    Object? mapsOptions = null,
    Object? eventLocation = freezed,
  }) {
    return _then(_$EventDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventDto?,
      pubassetsForTheEvent: null == pubassetsForTheEvent
          ? _value._pubassetsForTheEvent
          : pubassetsForTheEvent // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      eventDistance: null == eventDistance
          ? _value.eventDistance
          : eventDistance // ignore: cast_nullable_to_non_nullable
              as String,
      lsdExpanded: null == lsdExpanded
          ? _value.lsdExpanded
          : lsdExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      ambExpanded: null == ambExpanded
          ? _value.ambExpanded
          : ambExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      fnbExpanded: null == fnbExpanded
          ? _value.fnbExpanded
          : fnbExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      faqExpanded: null == faqExpanded
          ? _value.faqExpanded
          : faqExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isEventLiked: null == isEventLiked
          ? _value.isEventLiked
          : isEventLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenMapModal: null == isOpenMapModal
          ? _value.isOpenMapModal
          : isOpenMapModal // ignore: cast_nullable_to_non_nullable
              as bool,
      mapsOptions: null == mapsOptions
          ? _value._mapsOptions
          : mapsOptions // ignore: cast_nullable_to_non_nullable
              as List<AvailableMap>,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as Coords?,
    ));
  }
}

/// @nodoc

class _$EventDetailsStateImpl implements _EventDetailsState {
  const _$EventDetailsStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.apiBaseUrl,
      required this.eventRepository,
      required this.event,
      required final List<AssetDto> pubassetsForTheEvent,
      required this.eventDistance,
      required this.lsdExpanded,
      required this.ambExpanded,
      required this.fnbExpanded,
      required this.faqExpanded,
      required this.isEventLiked,
      required this.isOpenMapModal,
      required final List<AvailableMap> mapsOptions,
      this.eventLocation})
      : _pubassetsForTheEvent = pubassetsForTheEvent,
        _mapsOptions = mapsOptions;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final String apiBaseUrl;
  @override
  final EventRepository eventRepository;
  @override
  final EventDto? event;
  final List<AssetDto> _pubassetsForTheEvent;
  @override
  List<AssetDto> get pubassetsForTheEvent {
    if (_pubassetsForTheEvent is EqualUnmodifiableListView)
      return _pubassetsForTheEvent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pubassetsForTheEvent);
  }

  @override
  final String eventDistance;
  @override
  final bool lsdExpanded;
  @override
  final bool ambExpanded;
  @override
  final bool fnbExpanded;
  @override
  final bool faqExpanded;
  @override
  final bool isEventLiked;
  @override
  final bool isOpenMapModal;
  final List<AvailableMap> _mapsOptions;
  @override
  List<AvailableMap> get mapsOptions {
    if (_mapsOptions is EqualUnmodifiableListView) return _mapsOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapsOptions);
  }

//required List<>
  @override
  final Coords? eventLocation;

  @override
  String toString() {
    return 'EventDetailsState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, apiBaseUrl: $apiBaseUrl, eventRepository: $eventRepository, event: $event, pubassetsForTheEvent: $pubassetsForTheEvent, eventDistance: $eventDistance, lsdExpanded: $lsdExpanded, ambExpanded: $ambExpanded, fnbExpanded: $fnbExpanded, faqExpanded: $faqExpanded, isEventLiked: $isEventLiked, isOpenMapModal: $isOpenMapModal, mapsOptions: $mapsOptions, eventLocation: $eventLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository) &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality()
                .equals(other._pubassetsForTheEvent, _pubassetsForTheEvent) &&
            (identical(other.eventDistance, eventDistance) ||
                other.eventDistance == eventDistance) &&
            (identical(other.lsdExpanded, lsdExpanded) ||
                other.lsdExpanded == lsdExpanded) &&
            (identical(other.ambExpanded, ambExpanded) ||
                other.ambExpanded == ambExpanded) &&
            (identical(other.fnbExpanded, fnbExpanded) ||
                other.fnbExpanded == fnbExpanded) &&
            (identical(other.faqExpanded, faqExpanded) ||
                other.faqExpanded == faqExpanded) &&
            (identical(other.isEventLiked, isEventLiked) ||
                other.isEventLiked == isEventLiked) &&
            (identical(other.isOpenMapModal, isOpenMapModal) ||
                other.isOpenMapModal == isOpenMapModal) &&
            const DeepCollectionEquality()
                .equals(other._mapsOptions, _mapsOptions) &&
            (identical(other.eventLocation, eventLocation) ||
                other.eventLocation == eventLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      apiBaseUrl,
      eventRepository,
      event,
      const DeepCollectionEquality().hash(_pubassetsForTheEvent),
      eventDistance,
      lsdExpanded,
      ambExpanded,
      fnbExpanded,
      faqExpanded,
      isEventLiked,
      isOpenMapModal,
      const DeepCollectionEquality().hash(_mapsOptions),
      eventLocation);

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      __$$EventDetailsStateImplCopyWithImpl<_$EventDetailsStateImpl>(
          this, _$identity);
}

abstract class _EventDetailsState implements EventDetailsState {
  const factory _EventDetailsState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final String apiBaseUrl,
      required final EventRepository eventRepository,
      required final EventDto? event,
      required final List<AssetDto> pubassetsForTheEvent,
      required final String eventDistance,
      required final bool lsdExpanded,
      required final bool ambExpanded,
      required final bool fnbExpanded,
      required final bool faqExpanded,
      required final bool isEventLiked,
      required final bool isOpenMapModal,
      required final List<AvailableMap> mapsOptions,
      final Coords? eventLocation}) = _$EventDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  String get apiBaseUrl;
  @override
  EventRepository get eventRepository;
  @override
  EventDto? get event;
  @override
  List<AssetDto> get pubassetsForTheEvent;
  @override
  String get eventDistance;
  @override
  bool get lsdExpanded;
  @override
  bool get ambExpanded;
  @override
  bool get fnbExpanded;
  @override
  bool get faqExpanded;
  @override
  bool get isEventLiked;
  @override
  bool get isOpenMapModal;
  @override
  List<AvailableMap> get mapsOptions; //required List<>
  @override
  Coords? get eventLocation;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
