// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  String get responseMsg => throw _privateConstructorUsedError;
  NotificationRepository get notificationRepository =>
      throw _privateConstructorUsedError;
  List<NotificationDto> get lsOfNotification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccessful,
      String responseMsg,
      NotificationRepository notificationRepository,
      List<NotificationDto> lsOfNotification});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? responseMsg = null,
    Object? notificationRepository = null,
    Object? lsOfNotification = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: null == responseMsg
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      notificationRepository: null == notificationRepository
          ? _value.notificationRepository
          : notificationRepository // ignore: cast_nullable_to_non_nullable
              as NotificationRepository,
      lsOfNotification: null == lsOfNotification
          ? _value.lsOfNotification
          : lsOfNotification // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccessful,
      String responseMsg,
      NotificationRepository notificationRepository,
      List<NotificationDto> lsOfNotification});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailed = null,
    Object? isSuccessful = null,
    Object? responseMsg = null,
    Object? notificationRepository = null,
    Object? lsOfNotification = null,
  }) {
    return _then(_$NotificationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: null == responseMsg
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      notificationRepository: null == notificationRepository
          ? _value.notificationRepository
          : notificationRepository // ignore: cast_nullable_to_non_nullable
              as NotificationRepository,
      lsOfNotification: null == lsOfNotification
          ? _value._lsOfNotification
          : lsOfNotification // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl implements _NotificationState {
  const _$NotificationStateImpl(
      {required this.isLoading,
      required this.isFailed,
      required this.isSuccessful,
      required this.responseMsg,
      required this.notificationRepository,
      required final List<NotificationDto> lsOfNotification})
      : _lsOfNotification = lsOfNotification;

  @override
  final bool isLoading;
  @override
  final bool isFailed;
  @override
  final bool isSuccessful;
  @override
  final String responseMsg;
  @override
  final NotificationRepository notificationRepository;
  final List<NotificationDto> _lsOfNotification;
  @override
  List<NotificationDto> get lsOfNotification {
    if (_lsOfNotification is EqualUnmodifiableListView)
      return _lsOfNotification;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOfNotification);
  }

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, isFailed: $isFailed, isSuccessful: $isSuccessful, responseMsg: $responseMsg, notificationRepository: $notificationRepository, lsOfNotification: $lsOfNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.responseMsg, responseMsg) ||
                other.responseMsg == responseMsg) &&
            (identical(other.notificationRepository, notificationRepository) ||
                other.notificationRepository == notificationRepository) &&
            const DeepCollectionEquality()
                .equals(other._lsOfNotification, _lsOfNotification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFailed,
      isSuccessful,
      responseMsg,
      notificationRepository,
      const DeepCollectionEquality().hash(_lsOfNotification));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
          {required final bool isLoading,
          required final bool isFailed,
          required final bool isSuccessful,
          required final String responseMsg,
          required final NotificationRepository notificationRepository,
          required final List<NotificationDto> lsOfNotification}) =
      _$NotificationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFailed;
  @override
  bool get isSuccessful;
  @override
  String get responseMsg;
  @override
  NotificationRepository get notificationRepository;
  @override
  List<NotificationDto> get lsOfNotification;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
