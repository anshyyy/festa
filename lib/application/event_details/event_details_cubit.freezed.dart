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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventDetailsState {
  String get apiBaseUrl => throw _privateConstructorUsedError;
  EventRepository get eventRepository => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDetailsStateCopyWith<EventDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsStateCopyWith<$Res> {
  factory $EventDetailsStateCopyWith(
          EventDetailsState value, $Res Function(EventDetailsState) then) =
      _$EventDetailsStateCopyWithImpl<$Res, EventDetailsState>;
  @useResult
  $Res call({String apiBaseUrl, EventRepository eventRepository});
}

/// @nodoc
class _$EventDetailsStateCopyWithImpl<$Res, $Val extends EventDetailsState>
    implements $EventDetailsStateCopyWith<$Res> {
  _$EventDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
  }) {
    return _then(_value.copyWith(
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
    ) as $Val);
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
  $Res call({String apiBaseUrl, EventRepository eventRepository});
}

/// @nodoc
class __$$EventDetailsStateImplCopyWithImpl<$Res>
    extends _$EventDetailsStateCopyWithImpl<$Res, _$EventDetailsStateImpl>
    implements _$$EventDetailsStateImplCopyWith<$Res> {
  __$$EventDetailsStateImplCopyWithImpl(_$EventDetailsStateImpl _value,
      $Res Function(_$EventDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiBaseUrl = null,
    Object? eventRepository = null,
  }) {
    return _then(_$EventDetailsStateImpl(
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventRepository: null == eventRepository
          ? _value.eventRepository
          : eventRepository // ignore: cast_nullable_to_non_nullable
              as EventRepository,
    ));
  }
}

/// @nodoc

class _$EventDetailsStateImpl implements _EventDetailsState {
  const _$EventDetailsStateImpl(
      {required this.apiBaseUrl, required this.eventRepository});

  @override
  final String apiBaseUrl;
  @override
  final EventRepository eventRepository;

  @override
  String toString() {
    return 'EventDetailsState(apiBaseUrl: $apiBaseUrl, eventRepository: $eventRepository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsStateImpl &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.eventRepository, eventRepository) ||
                other.eventRepository == eventRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiBaseUrl, eventRepository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      __$$EventDetailsStateImplCopyWithImpl<_$EventDetailsStateImpl>(
          this, _$identity);
}

abstract class _EventDetailsState implements EventDetailsState {
  const factory _EventDetailsState(
          {required final String apiBaseUrl,
          required final EventRepository eventRepository}) =
      _$EventDetailsStateImpl;

  @override
  String get apiBaseUrl;
  @override
  EventRepository get eventRepository;
  @override
  @JsonKey(ignore: true)
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
