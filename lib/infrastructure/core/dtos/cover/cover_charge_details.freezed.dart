// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover_charge_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoverChargeDetails _$CoverChargeDetailsFromJson(Map<String, dynamic> json) {
  return _CoverChargeDetails.fromJson(json);
}

/// @nodoc
mixin _$CoverChargeDetails {
  int get id => throw _privateConstructorUsedError;
  String get razorpayId => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  dynamic get bookingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoverChargeDetailsCopyWith<CoverChargeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverChargeDetailsCopyWith<$Res> {
  factory $CoverChargeDetailsCopyWith(
          CoverChargeDetails value, $Res Function(CoverChargeDetails) then) =
      _$CoverChargeDetailsCopyWithImpl<$Res, CoverChargeDetails>;
  @useResult
  $Res call(
      {int id, String razorpayId, String transactionId, dynamic bookingId});
}

/// @nodoc
class _$CoverChargeDetailsCopyWithImpl<$Res, $Val extends CoverChargeDetails>
    implements $CoverChargeDetailsCopyWith<$Res> {
  _$CoverChargeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? razorpayId = null,
    Object? transactionId = null,
    Object? bookingId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      razorpayId: null == razorpayId
          ? _value.razorpayId
          : razorpayId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoverChargeDetailsImplCopyWith<$Res>
    implements $CoverChargeDetailsCopyWith<$Res> {
  factory _$$CoverChargeDetailsImplCopyWith(_$CoverChargeDetailsImpl value,
          $Res Function(_$CoverChargeDetailsImpl) then) =
      __$$CoverChargeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String razorpayId, String transactionId, dynamic bookingId});
}

/// @nodoc
class __$$CoverChargeDetailsImplCopyWithImpl<$Res>
    extends _$CoverChargeDetailsCopyWithImpl<$Res, _$CoverChargeDetailsImpl>
    implements _$$CoverChargeDetailsImplCopyWith<$Res> {
  __$$CoverChargeDetailsImplCopyWithImpl(_$CoverChargeDetailsImpl _value,
      $Res Function(_$CoverChargeDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? razorpayId = null,
    Object? transactionId = null,
    Object? bookingId = freezed,
  }) {
    return _then(_$CoverChargeDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      razorpayId: null == razorpayId
          ? _value.razorpayId
          : razorpayId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverChargeDetailsImpl implements _CoverChargeDetails {
  const _$CoverChargeDetailsImpl(
      {required this.id,
      required this.razorpayId,
      required this.transactionId,
      required this.bookingId});

  factory _$CoverChargeDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoverChargeDetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String razorpayId;
  @override
  final String transactionId;
  @override
  final dynamic bookingId;

  @override
  String toString() {
    return 'CoverChargeDetails(id: $id, razorpayId: $razorpayId, transactionId: $transactionId, bookingId: $bookingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverChargeDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.razorpayId, razorpayId) ||
                other.razorpayId == razorpayId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality().equals(other.bookingId, bookingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, razorpayId, transactionId,
      const DeepCollectionEquality().hash(bookingId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverChargeDetailsImplCopyWith<_$CoverChargeDetailsImpl> get copyWith =>
      __$$CoverChargeDetailsImplCopyWithImpl<_$CoverChargeDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverChargeDetailsImplToJson(
      this,
    );
  }
}

abstract class _CoverChargeDetails implements CoverChargeDetails {
  const factory _CoverChargeDetails(
      {required final int id,
      required final String razorpayId,
      required final String transactionId,
      required final dynamic bookingId}) = _$CoverChargeDetailsImpl;

  factory _CoverChargeDetails.fromJson(Map<String, dynamic> json) =
      _$CoverChargeDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get razorpayId;
  @override
  String get transactionId;
  @override
  dynamic get bookingId;
  @override
  @JsonKey(ignore: true)
  _$$CoverChargeDetailsImplCopyWith<_$CoverChargeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
