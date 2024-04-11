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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get showTicketDetails => throw _privateConstructorUsedError;
  bool get showTicketHistory => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  UserTicketsDto? get userTickets => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  WidgetsToImageController get widgetsToImageController =>
      throw _privateConstructorUsedError;
  bool get isShareEnabled => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      bool showTicketDetails,
      bool showTicketHistory,
      UserRepository userRepository,
      UserTicketsDto? userTickets,
      int currentPage,
      WidgetsToImageController widgetsToImageController,
      bool isShareEnabled});

  $UserTicketsDtoCopyWith<$Res>? get userTickets;
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
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
    Object? userRepository = null,
    Object? userTickets = freezed,
    Object? currentPage = null,
    Object? widgetsToImageController = null,
    Object? isShareEnabled = null,
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      userTickets: freezed == userTickets
          ? _value.userTickets
          : userTickets // ignore: cast_nullable_to_non_nullable
              as UserTicketsDto?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      widgetsToImageController: null == widgetsToImageController
          ? _value.widgetsToImageController
          : widgetsToImageController // ignore: cast_nullable_to_non_nullable
              as WidgetsToImageController,
      isShareEnabled: null == isShareEnabled
          ? _value.isShareEnabled
          : isShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTicketsDtoCopyWith<$Res>? get userTickets {
    if (_value.userTickets == null) {
      return null;
    }

    return $UserTicketsDtoCopyWith<$Res>(_value.userTickets!, (value) {
      return _then(_value.copyWith(userTickets: value) as $Val);
    });
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
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      bool noUse,
      bool showTicketDetails,
      bool showTicketHistory,
      UserRepository userRepository,
      UserTicketsDto? userTickets,
      int currentPage,
      WidgetsToImageController widgetsToImageController,
      bool isShareEnabled});

  @override
  $UserTicketsDtoCopyWith<$Res>? get userTickets;
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
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? noUse = null,
    Object? showTicketDetails = null,
    Object? showTicketHistory = null,
    Object? userRepository = null,
    Object? userTickets = freezed,
    Object? currentPage = null,
    Object? widgetsToImageController = null,
    Object? isShareEnabled = null,
  }) {
    return _then(_$TicketStateImpl(
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
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketDetails: null == showTicketDetails
          ? _value.showTicketDetails
          : showTicketDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      showTicketHistory: null == showTicketHistory
          ? _value.showTicketHistory
          : showTicketHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      userTickets: freezed == userTickets
          ? _value.userTickets
          : userTickets // ignore: cast_nullable_to_non_nullable
              as UserTicketsDto?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      widgetsToImageController: null == widgetsToImageController
          ? _value.widgetsToImageController
          : widgetsToImageController // ignore: cast_nullable_to_non_nullable
              as WidgetsToImageController,
      isShareEnabled: null == isShareEnabled
          ? _value.isShareEnabled
          : isShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.noUse,
      required this.showTicketDetails,
      required this.showTicketHistory,
      required this.userRepository,
      this.userTickets,
      required this.currentPage,
      required this.widgetsToImageController,
      required this.isShareEnabled});

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool noUse;
  @override
  final bool showTicketDetails;
  @override
  final bool showTicketHistory;
  @override
  final UserRepository userRepository;
  @override
  final UserTicketsDto? userTickets;
  @override
  final int currentPage;
  @override
  final WidgetsToImageController widgetsToImageController;
  @override
  final bool isShareEnabled;

  @override
  String toString() {
    return 'TicketState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, noUse: $noUse, showTicketDetails: $showTicketDetails, showTicketHistory: $showTicketHistory, userRepository: $userRepository, userTickets: $userTickets, currentPage: $currentPage, widgetsToImageController: $widgetsToImageController, isShareEnabled: $isShareEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.showTicketDetails, showTicketDetails) ||
                other.showTicketDetails == showTicketDetails) &&
            (identical(other.showTicketHistory, showTicketHistory) ||
                other.showTicketHistory == showTicketHistory) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.userTickets, userTickets) ||
                other.userTickets == userTickets) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(
                    other.widgetsToImageController, widgetsToImageController) ||
                other.widgetsToImageController == widgetsToImageController) &&
            (identical(other.isShareEnabled, isShareEnabled) ||
                other.isShareEnabled == isShareEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      noUse,
      showTicketDetails,
      showTicketHistory,
      userRepository,
      userTickets,
      currentPage,
      widgetsToImageController,
      isShareEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final bool noUse,
      required final bool showTicketDetails,
      required final bool showTicketHistory,
      required final UserRepository userRepository,
      final UserTicketsDto? userTickets,
      required final int currentPage,
      required final WidgetsToImageController widgetsToImageController,
      required final bool isShareEnabled}) = _$TicketStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get noUse;
  @override
  bool get showTicketDetails;
  @override
  bool get showTicketHistory;
  @override
  UserRepository get userRepository;
  @override
  UserTicketsDto? get userTickets;
  @override
  int get currentPage;
  @override
  WidgetsToImageController get widgetsToImageController;
  @override
  bool get isShareEnabled;
  @override
  @JsonKey(ignore: true)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
