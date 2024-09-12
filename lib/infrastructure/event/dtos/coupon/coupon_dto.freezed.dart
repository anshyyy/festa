// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponDTO _$CouponDTOFromJson(Map<String, dynamic> json) {
  return _CouponDTO.fromJson(json);
}

/// @nodoc
mixin _$CouponDTO {
  @JsonKey(name: 'message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'couponId', defaultValue: 0)
  int get couponId => throw _privateConstructorUsedError;
  @JsonKey(name: 'value', defaultValue: 0)
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'redeemedById', defaultValue: 0)
  int get redeemedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventId', defaultValue: 0)
  int get eventId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponDTOCopyWith<CouponDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDTOCopyWith<$Res> {
  factory $CouponDTOCopyWith(CouponDTO value, $Res Function(CouponDTO) then) =
      _$CouponDTOCopyWithImpl<$Res, CouponDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message', defaultValue: '') String message,
      @JsonKey(name: 'couponId', defaultValue: 0) int couponId,
      @JsonKey(name: 'value', defaultValue: 0) int value,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'redeemedById', defaultValue: 0) int redeemedById,
      @JsonKey(name: 'eventId', defaultValue: 0) int eventId});
}

/// @nodoc
class _$CouponDTOCopyWithImpl<$Res, $Val extends CouponDTO>
    implements $CouponDTOCopyWith<$Res> {
  _$CouponDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? couponId = null,
    Object? value = null,
    Object? status = null,
    Object? redeemedById = null,
    Object? eventId = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedById: null == redeemedById
          ? _value.redeemedById
          : redeemedById // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponDTOImplCopyWith<$Res>
    implements $CouponDTOCopyWith<$Res> {
  factory _$$CouponDTOImplCopyWith(
          _$CouponDTOImpl value, $Res Function(_$CouponDTOImpl) then) =
      __$$CouponDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message', defaultValue: '') String message,
      @JsonKey(name: 'couponId', defaultValue: 0) int couponId,
      @JsonKey(name: 'value', defaultValue: 0) int value,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'redeemedById', defaultValue: 0) int redeemedById,
      @JsonKey(name: 'eventId', defaultValue: 0) int eventId});
}

/// @nodoc
class __$$CouponDTOImplCopyWithImpl<$Res>
    extends _$CouponDTOCopyWithImpl<$Res, _$CouponDTOImpl>
    implements _$$CouponDTOImplCopyWith<$Res> {
  __$$CouponDTOImplCopyWithImpl(
      _$CouponDTOImpl _value, $Res Function(_$CouponDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? couponId = null,
    Object? value = null,
    Object? status = null,
    Object? redeemedById = null,
    Object? eventId = null,
  }) {
    return _then(_$CouponDTOImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedById: null == redeemedById
          ? _value.redeemedById
          : redeemedById // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponDTOImpl implements _CouponDTO {
  const _$CouponDTOImpl(
      {@JsonKey(name: 'message', defaultValue: '') required this.message,
      @JsonKey(name: 'couponId', defaultValue: 0) required this.couponId,
      @JsonKey(name: 'value', defaultValue: 0) required this.value,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'redeemedById', defaultValue: 0)
      required this.redeemedById,
      @JsonKey(name: 'eventId', defaultValue: 0) required this.eventId});

  factory _$CouponDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponDTOImplFromJson(json);

  @override
  @JsonKey(name: 'message', defaultValue: '')
  final String message;
  @override
  @JsonKey(name: 'couponId', defaultValue: 0)
  final int couponId;
  @override
  @JsonKey(name: 'value', defaultValue: 0)
  final int value;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'redeemedById', defaultValue: 0)
  final int redeemedById;
  @override
  @JsonKey(name: 'eventId', defaultValue: 0)
  final int eventId;

  @override
  String toString() {
    return 'CouponDTO(message: $message, couponId: $couponId, value: $value, status: $status, redeemedById: $redeemedById, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponDTOImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.redeemedById, redeemedById) ||
                other.redeemedById == redeemedById) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, couponId, value, status, redeemedById, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponDTOImplCopyWith<_$CouponDTOImpl> get copyWith =>
      __$$CouponDTOImplCopyWithImpl<_$CouponDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponDTOImplToJson(
      this,
    );
  }
}

abstract class _CouponDTO implements CouponDTO {
  const factory _CouponDTO(
      {@JsonKey(name: 'message', defaultValue: '')
      required final String message,
      @JsonKey(name: 'couponId', defaultValue: 0) required final int couponId,
      @JsonKey(name: 'value', defaultValue: 0) required final int value,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'redeemedById', defaultValue: 0)
      required final int redeemedById,
      @JsonKey(name: 'eventId', defaultValue: 0)
      required final int eventId}) = _$CouponDTOImpl;

  factory _CouponDTO.fromJson(Map<String, dynamic> json) =
      _$CouponDTOImpl.fromJson;

  @override
  @JsonKey(name: 'message', defaultValue: '')
  String get message;
  @override
  @JsonKey(name: 'couponId', defaultValue: 0)
  int get couponId;
  @override
  @JsonKey(name: 'value', defaultValue: 0)
  int get value;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'redeemedById', defaultValue: 0)
  int get redeemedById;
  @override
  @JsonKey(name: 'eventId', defaultValue: 0)
  int get eventId;
  @override
  @JsonKey(ignore: true)
  _$$CouponDTOImplCopyWith<_$CouponDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
