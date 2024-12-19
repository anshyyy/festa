// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tickets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTicketsDto _$UserTicketsDtoFromJson(Map<String, dynamic> json) {
  return _UserTicketsDto.fromJson(json);
}

/// @nodoc
mixin _$UserTicketsDto {
  @JsonKey(name: 'history')
  List<BookedTicketDetailsDto> get bookedTicketsHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'upcoming')
  List<BookedTicketDetailsDto> get upcomingTickets =>
      throw _privateConstructorUsedError;

  /// Serializes this UserTicketsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserTicketsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTicketsDtoCopyWith<UserTicketsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTicketsDtoCopyWith<$Res> {
  factory $UserTicketsDtoCopyWith(
          UserTicketsDto value, $Res Function(UserTicketsDto) then) =
      _$UserTicketsDtoCopyWithImpl<$Res, UserTicketsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'history')
      List<BookedTicketDetailsDto> bookedTicketsHistory,
      @JsonKey(name: 'upcoming') List<BookedTicketDetailsDto> upcomingTickets});
}

/// @nodoc
class _$UserTicketsDtoCopyWithImpl<$Res, $Val extends UserTicketsDto>
    implements $UserTicketsDtoCopyWith<$Res> {
  _$UserTicketsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTicketsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookedTicketsHistory = null,
    Object? upcomingTickets = null,
  }) {
    return _then(_value.copyWith(
      bookedTicketsHistory: null == bookedTicketsHistory
          ? _value.bookedTicketsHistory
          : bookedTicketsHistory // ignore: cast_nullable_to_non_nullable
              as List<BookedTicketDetailsDto>,
      upcomingTickets: null == upcomingTickets
          ? _value.upcomingTickets
          : upcomingTickets // ignore: cast_nullable_to_non_nullable
              as List<BookedTicketDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTicketsDtoImplCopyWith<$Res>
    implements $UserTicketsDtoCopyWith<$Res> {
  factory _$$UserTicketsDtoImplCopyWith(_$UserTicketsDtoImpl value,
          $Res Function(_$UserTicketsDtoImpl) then) =
      __$$UserTicketsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'history')
      List<BookedTicketDetailsDto> bookedTicketsHistory,
      @JsonKey(name: 'upcoming') List<BookedTicketDetailsDto> upcomingTickets});
}

/// @nodoc
class __$$UserTicketsDtoImplCopyWithImpl<$Res>
    extends _$UserTicketsDtoCopyWithImpl<$Res, _$UserTicketsDtoImpl>
    implements _$$UserTicketsDtoImplCopyWith<$Res> {
  __$$UserTicketsDtoImplCopyWithImpl(
      _$UserTicketsDtoImpl _value, $Res Function(_$UserTicketsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserTicketsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookedTicketsHistory = null,
    Object? upcomingTickets = null,
  }) {
    return _then(_$UserTicketsDtoImpl(
      bookedTicketsHistory: null == bookedTicketsHistory
          ? _value.bookedTicketsHistory
          : bookedTicketsHistory // ignore: cast_nullable_to_non_nullable
              as List<BookedTicketDetailsDto>,
      upcomingTickets: null == upcomingTickets
          ? _value.upcomingTickets
          : upcomingTickets // ignore: cast_nullable_to_non_nullable
              as List<BookedTicketDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTicketsDtoImpl implements _UserTicketsDto {
  const _$UserTicketsDtoImpl(
      {@JsonKey(name: 'history') required this.bookedTicketsHistory,
      @JsonKey(name: 'upcoming') required this.upcomingTickets});

  factory _$UserTicketsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTicketsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'history')
  final List<BookedTicketDetailsDto> bookedTicketsHistory;
  @override
  @JsonKey(name: 'upcoming')
  final List<BookedTicketDetailsDto> upcomingTickets;

  @override
  String toString() {
    return 'UserTicketsDto(bookedTicketsHistory: $bookedTicketsHistory, upcomingTickets: $upcomingTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTicketsDtoImpl &&
            const DeepCollectionEquality()
                .equals(other.bookedTicketsHistory, bookedTicketsHistory) &&
            const DeepCollectionEquality()
                .equals(other.upcomingTickets, upcomingTickets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bookedTicketsHistory),
      const DeepCollectionEquality().hash(upcomingTickets));

  /// Create a copy of UserTicketsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTicketsDtoImplCopyWith<_$UserTicketsDtoImpl> get copyWith =>
      __$$UserTicketsDtoImplCopyWithImpl<_$UserTicketsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTicketsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserTicketsDto implements UserTicketsDto {
  const factory _UserTicketsDto(
          {@JsonKey(name: 'history')
          required final List<BookedTicketDetailsDto> bookedTicketsHistory,
          @JsonKey(name: 'upcoming')
          required final List<BookedTicketDetailsDto> upcomingTickets}) =
      _$UserTicketsDtoImpl;

  factory _UserTicketsDto.fromJson(Map<String, dynamic> json) =
      _$UserTicketsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'history')
  List<BookedTicketDetailsDto> get bookedTicketsHistory;
  @override
  @JsonKey(name: 'upcoming')
  List<BookedTicketDetailsDto> get upcomingTickets;

  /// Create a copy of UserTicketsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTicketsDtoImplCopyWith<_$UserTicketsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
