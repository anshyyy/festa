// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketState {
  bool get showTicketDetails => throw _privateConstructorUsedError;
  bool get showTicketHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketStateCopyWith<TicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
          TicketState value, $Res Function(TicketState) then) =
      _$TicketStateCopyWithImpl<$Res, TicketState>;
  @useResult
  $Res call({bool showTicketDetails, bool showTicketHistory});
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
  }) {
    return _then(_value.copyWith(
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketStateImplCopyWith<$Res>
    implements $TicketStateCopyWith<$Res> {
  factory _$$TicketStateImplCopyWith(
          _$TicketStateImpl value, $Res Function(_$TicketStateImpl) then) =
      __$$TicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showTicketDetails, bool showTicketHistory});
}

/// @nodoc
class __$$TicketStateImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateImpl>
    implements _$$TicketStateImplCopyWith<$Res> {
  __$$TicketStateImplCopyWithImpl(
      _$TicketStateImpl _value, $Res Function(_$TicketStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
  }) {
    return _then(_$TicketStateImpl(
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl(
      {required this.showTicketDetails, required this.showTicketHistory});

  @override
  final bool showTicketDetails;
  @override
  final bool showTicketHistory;

  @override
  String toString() {
    return 'TicketState(showTicketDetails: $showTicketDetails, showTicketHistory: $showTicketHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            (identical(other.showTicketDetails, showTicketDetails) ||
                other.showTicketDetails == showTicketDetails) &&
            (identical(other.showTicketHistory, showTicketHistory) ||
                other.showTicketHistory == showTicketHistory));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showTicketDetails, showTicketHistory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState(
      {required final bool showTicketDetails,
      required final bool showTicketHistory}) = _$TicketStateImpl;

  @override
  bool get showTicketDetails;
  @override
  bool get showTicketHistory;
  @override
  @JsonKey(ignore: true)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
