// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover_balance_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoverBalanceHistoryDto _$CoverBalanceHistoryDtoFromJson(
    Map<String, dynamic> json) {
  return _CoverBalanceHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$CoverBalanceHistoryDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
  String get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionDirection')
  String get transactionDirection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoverBalanceHistoryDtoCopyWith<CoverBalanceHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverBalanceHistoryDtoCopyWith<$Res> {
  factory $CoverBalanceHistoryDtoCopyWith(CoverBalanceHistoryDto value,
          $Res Function(CoverBalanceHistoryDto) then) =
      _$CoverBalanceHistoryDtoCopyWithImpl<$Res, CoverBalanceHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
      String transactionType,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      @JsonKey(name: 'transactionDirection') String transactionDirection});
}

/// @nodoc
class _$CoverBalanceHistoryDtoCopyWithImpl<$Res,
        $Val extends CoverBalanceHistoryDto>
    implements $CoverBalanceHistoryDtoCopyWith<$Res> {
  _$CoverBalanceHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? transactionType = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? transactionDirection = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDirection: null == transactionDirection
          ? _value.transactionDirection
          : transactionDirection // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoverBalanceHistoryDtoImplCopyWith<$Res>
    implements $CoverBalanceHistoryDtoCopyWith<$Res> {
  factory _$$CoverBalanceHistoryDtoImplCopyWith(
          _$CoverBalanceHistoryDtoImpl value,
          $Res Function(_$CoverBalanceHistoryDtoImpl) then) =
      __$$CoverBalanceHistoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
      String transactionType,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      @JsonKey(name: 'transactionDirection') String transactionDirection});
}

/// @nodoc
class __$$CoverBalanceHistoryDtoImplCopyWithImpl<$Res>
    extends _$CoverBalanceHistoryDtoCopyWithImpl<$Res,
        _$CoverBalanceHistoryDtoImpl>
    implements _$$CoverBalanceHistoryDtoImplCopyWith<$Res> {
  __$$CoverBalanceHistoryDtoImplCopyWithImpl(
      _$CoverBalanceHistoryDtoImpl _value,
      $Res Function(_$CoverBalanceHistoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? transactionType = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? transactionDirection = null,
  }) {
    return _then(_$CoverBalanceHistoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDirection: null == transactionDirection
          ? _value.transactionDirection
          : transactionDirection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverBalanceHistoryDtoImpl implements _CoverBalanceHistoryDto {
  const _$CoverBalanceHistoryDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
      required this.transactionType,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      @JsonKey(name: 'transactionDirection')
      required this.transactionDirection});

  factory _$CoverBalanceHistoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoverBalanceHistoryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
  final String transactionType;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'transactionDirection')
  final String transactionDirection;

  @override
  String toString() {
    return 'CoverBalanceHistoryDto(id: $id, amount: $amount, transactionType: $transactionType, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, transactionDirection: $transactionDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverBalanceHistoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.transactionDirection, transactionDirection) ||
                other.transactionDirection == transactionDirection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, transactionType,
      notes, createdAt, updatedAt, transactionDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverBalanceHistoryDtoImplCopyWith<_$CoverBalanceHistoryDtoImpl>
      get copyWith => __$$CoverBalanceHistoryDtoImplCopyWithImpl<
          _$CoverBalanceHistoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverBalanceHistoryDtoImplToJson(
      this,
    );
  }
}

abstract class _CoverBalanceHistoryDto implements CoverBalanceHistoryDto {
  const factory _CoverBalanceHistoryDto(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'amount') required final String amount,
          @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
          required final String transactionType,
          @JsonKey(name: 'notes') final String? notes,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
          @JsonKey(name: 'transactionDirection')
          required final String transactionDirection}) =
      _$CoverBalanceHistoryDtoImpl;

  factory _CoverBalanceHistoryDto.fromJson(Map<String, dynamic> json) =
      _$CoverBalanceHistoryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'transactionType', defaultValue: 'admin_recharge')
  String get transactionType;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'transactionDirection')
  String get transactionDirection;
  @override
  @JsonKey(ignore: true)
  _$$CoverBalanceHistoryDtoImplCopyWith<_$CoverBalanceHistoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
