// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockedUsers _$BlockedUsersFromJson(Map<String, dynamic> json) {
  return _BlockedUsers.fromJson(json);
}

/// @nodoc
mixin _$BlockedUsers {
  List<PubDto> get pubs => throw _privateConstructorUsedError;
  List<EventDto> get events => throw _privateConstructorUsedError;
  List<ArtistDto> get artists => throw _privateConstructorUsedError;
  List<UserDto> get users => throw _privateConstructorUsedError;

  /// Serializes this BlockedUsers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockedUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockedUsersCopyWith<BlockedUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUsersCopyWith<$Res> {
  factory $BlockedUsersCopyWith(
          BlockedUsers value, $Res Function(BlockedUsers) then) =
      _$BlockedUsersCopyWithImpl<$Res, BlockedUsers>;
  @useResult
  $Res call(
      {List<PubDto> pubs,
      List<EventDto> events,
      List<ArtistDto> artists,
      List<UserDto> users});
}

/// @nodoc
class _$BlockedUsersCopyWithImpl<$Res, $Val extends BlockedUsers>
    implements $BlockedUsersCopyWith<$Res> {
  _$BlockedUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockedUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pubs = null,
    Object? events = null,
    Object? artists = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      pubs: null == pubs
          ? _value.pubs
          : pubs // ignore: cast_nullable_to_non_nullable
              as List<PubDto>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockedUsersImplCopyWith<$Res>
    implements $BlockedUsersCopyWith<$Res> {
  factory _$$BlockedUsersImplCopyWith(
          _$BlockedUsersImpl value, $Res Function(_$BlockedUsersImpl) then) =
      __$$BlockedUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PubDto> pubs,
      List<EventDto> events,
      List<ArtistDto> artists,
      List<UserDto> users});
}

/// @nodoc
class __$$BlockedUsersImplCopyWithImpl<$Res>
    extends _$BlockedUsersCopyWithImpl<$Res, _$BlockedUsersImpl>
    implements _$$BlockedUsersImplCopyWith<$Res> {
  __$$BlockedUsersImplCopyWithImpl(
      _$BlockedUsersImpl _value, $Res Function(_$BlockedUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockedUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pubs = null,
    Object? events = null,
    Object? artists = null,
    Object? users = null,
  }) {
    return _then(_$BlockedUsersImpl(
      pubs: null == pubs
          ? _value._pubs
          : pubs // ignore: cast_nullable_to_non_nullable
              as List<PubDto>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockedUsersImpl implements _BlockedUsers {
  const _$BlockedUsersImpl(
      {required final List<PubDto> pubs,
      required final List<EventDto> events,
      required final List<ArtistDto> artists,
      required final List<UserDto> users})
      : _pubs = pubs,
        _events = events,
        _artists = artists,
        _users = users;

  factory _$BlockedUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockedUsersImplFromJson(json);

  final List<PubDto> _pubs;
  @override
  List<PubDto> get pubs {
    if (_pubs is EqualUnmodifiableListView) return _pubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pubs);
  }

  final List<EventDto> _events;
  @override
  List<EventDto> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<ArtistDto> _artists;
  @override
  List<ArtistDto> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<UserDto> _users;
  @override
  List<UserDto> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'BlockedUsers(pubs: $pubs, events: $events, artists: $artists, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedUsersImpl &&
            const DeepCollectionEquality().equals(other._pubs, _pubs) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pubs),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_users));

  /// Create a copy of BlockedUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedUsersImplCopyWith<_$BlockedUsersImpl> get copyWith =>
      __$$BlockedUsersImplCopyWithImpl<_$BlockedUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockedUsersImplToJson(
      this,
    );
  }
}

abstract class _BlockedUsers implements BlockedUsers {
  const factory _BlockedUsers(
      {required final List<PubDto> pubs,
      required final List<EventDto> events,
      required final List<ArtistDto> artists,
      required final List<UserDto> users}) = _$BlockedUsersImpl;

  factory _BlockedUsers.fromJson(Map<String, dynamic> json) =
      _$BlockedUsersImpl.fromJson;

  @override
  List<PubDto> get pubs;
  @override
  List<EventDto> get events;
  @override
  List<ArtistDto> get artists;
  @override
  List<UserDto> get users;

  /// Create a copy of BlockedUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockedUsersImplCopyWith<_$BlockedUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
