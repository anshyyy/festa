// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) {
  return _TicketDto.fromJson(json);
}

/// @nodoc
mixin _$TicketDto {
  @JsonKey(name: "ENTRY", defaultValue: [])
  List<EventTicketDto> get entryTickets => throw _privateConstructorUsedError;
  @JsonKey(name: "ENTRY_COVER", defaultValue: [])
  List<EventTicketDto> get entryCoverTickets =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "COVER", defaultValue: [])
  List<EventTicketDto> get coverTickets => throw _privateConstructorUsedError;

  /// Serializes this TicketDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDtoCopyWith<TicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDtoCopyWith<$Res> {
  factory $TicketDtoCopyWith(TicketDto value, $Res Function(TicketDto) then) =
      _$TicketDtoCopyWithImpl<$Res, TicketDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "ENTRY", defaultValue: [])
      List<EventTicketDto> entryTickets,
      @JsonKey(name: "ENTRY_COVER", defaultValue: [])
      List<EventTicketDto> entryCoverTickets,
      @JsonKey(name: "COVER", defaultValue: [])
      List<EventTicketDto> coverTickets});
}

/// @nodoc
class _$TicketDtoCopyWithImpl<$Res, $Val extends TicketDto>
    implements $TicketDtoCopyWith<$Res> {
  _$TicketDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryTickets = null,
    Object? entryCoverTickets = null,
    Object? coverTickets = null,
  }) {
    return _then(_value.copyWith(
      entryTickets: null == entryTickets
          ? _value.entryTickets
          : entryTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
      entryCoverTickets: null == entryCoverTickets
          ? _value.entryCoverTickets
          : entryCoverTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
      coverTickets: null == coverTickets
          ? _value.coverTickets
          : coverTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketDtoImplCopyWith<$Res>
    implements $TicketDtoCopyWith<$Res> {
  factory _$$TicketDtoImplCopyWith(
          _$TicketDtoImpl value, $Res Function(_$TicketDtoImpl) then) =
      __$$TicketDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ENTRY", defaultValue: [])
      List<EventTicketDto> entryTickets,
      @JsonKey(name: "ENTRY_COVER", defaultValue: [])
      List<EventTicketDto> entryCoverTickets,
      @JsonKey(name: "COVER", defaultValue: [])
      List<EventTicketDto> coverTickets});
}

/// @nodoc
class __$$TicketDtoImplCopyWithImpl<$Res>
    extends _$TicketDtoCopyWithImpl<$Res, _$TicketDtoImpl>
    implements _$$TicketDtoImplCopyWith<$Res> {
  __$$TicketDtoImplCopyWithImpl(
      _$TicketDtoImpl _value, $Res Function(_$TicketDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryTickets = null,
    Object? entryCoverTickets = null,
    Object? coverTickets = null,
  }) {
    return _then(_$TicketDtoImpl(
      null == entryTickets
          ? _value._entryTickets
          : entryTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
      null == entryCoverTickets
          ? _value._entryCoverTickets
          : entryCoverTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
      null == coverTickets
          ? _value._coverTickets
          : coverTickets // ignore: cast_nullable_to_non_nullable
              as List<EventTicketDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketDtoImpl implements _TicketDto {
  _$TicketDtoImpl(
      @JsonKey(name: "ENTRY", defaultValue: [])
      final List<EventTicketDto> entryTickets,
      @JsonKey(name: "ENTRY_COVER", defaultValue: [])
      final List<EventTicketDto> entryCoverTickets,
      @JsonKey(name: "COVER", defaultValue: [])
      final List<EventTicketDto> coverTickets)
      : _entryTickets = entryTickets,
        _entryCoverTickets = entryCoverTickets,
        _coverTickets = coverTickets;

  factory _$TicketDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketDtoImplFromJson(json);

  final List<EventTicketDto> _entryTickets;
  @override
  @JsonKey(name: "ENTRY", defaultValue: [])
  List<EventTicketDto> get entryTickets {
    if (_entryTickets is EqualUnmodifiableListView) return _entryTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entryTickets);
  }

  final List<EventTicketDto> _entryCoverTickets;
  @override
  @JsonKey(name: "ENTRY_COVER", defaultValue: [])
  List<EventTicketDto> get entryCoverTickets {
    if (_entryCoverTickets is EqualUnmodifiableListView)
      return _entryCoverTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entryCoverTickets);
  }

  final List<EventTicketDto> _coverTickets;
  @override
  @JsonKey(name: "COVER", defaultValue: [])
  List<EventTicketDto> get coverTickets {
    if (_coverTickets is EqualUnmodifiableListView) return _coverTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coverTickets);
  }

  @override
  String toString() {
    return 'TicketDto(entryTickets: $entryTickets, entryCoverTickets: $entryCoverTickets, coverTickets: $coverTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._entryTickets, _entryTickets) &&
            const DeepCollectionEquality()
                .equals(other._entryCoverTickets, _entryCoverTickets) &&
            const DeepCollectionEquality()
                .equals(other._coverTickets, _coverTickets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entryTickets),
      const DeepCollectionEquality().hash(_entryCoverTickets),
      const DeepCollectionEquality().hash(_coverTickets));

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDtoImplCopyWith<_$TicketDtoImpl> get copyWith =>
      __$$TicketDtoImplCopyWithImpl<_$TicketDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketDtoImplToJson(
      this,
    );
  }
}

abstract class _TicketDto implements TicketDto {
  factory _TicketDto(
      @JsonKey(name: "ENTRY", defaultValue: [])
      final List<EventTicketDto> entryTickets,
      @JsonKey(name: "ENTRY_COVER", defaultValue: [])
      final List<EventTicketDto> entryCoverTickets,
      @JsonKey(name: "COVER", defaultValue: [])
      final List<EventTicketDto> coverTickets) = _$TicketDtoImpl;

  factory _TicketDto.fromJson(Map<String, dynamic> json) =
      _$TicketDtoImpl.fromJson;

  @override
  @JsonKey(name: "ENTRY", defaultValue: [])
  List<EventTicketDto> get entryTickets;
  @override
  @JsonKey(name: "ENTRY_COVER", defaultValue: [])
  List<EventTicketDto> get entryCoverTickets;
  @override
  @JsonKey(name: "COVER", defaultValue: [])
  List<EventTicketDto> get coverTickets;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDtoImplCopyWith<_$TicketDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
