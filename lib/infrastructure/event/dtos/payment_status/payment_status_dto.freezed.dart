// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentStatusDto _$PaymentStatusDtoFromJson(Map<String, dynamic> json) {
  return _PaymentStatusDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentStatusDto {
  @JsonKey(name: 'isDone', defaultValue: false)
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason', defaultValue: '')
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentStatusDtoCopyWith<PaymentStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusDtoCopyWith<$Res> {
  factory $PaymentStatusDtoCopyWith(
          PaymentStatusDto value, $Res Function(PaymentStatusDto) then) =
      _$PaymentStatusDtoCopyWithImpl<$Res, PaymentStatusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isDone', defaultValue: false) bool isDone,
      @JsonKey(name: 'reason', defaultValue: '') String reason});
}

/// @nodoc
class _$PaymentStatusDtoCopyWithImpl<$Res, $Val extends PaymentStatusDto>
    implements $PaymentStatusDtoCopyWith<$Res> {
  _$PaymentStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDone = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentStatusDtoImplCopyWith<$Res>
    implements $PaymentStatusDtoCopyWith<$Res> {
  factory _$$PaymentStatusDtoImplCopyWith(_$PaymentStatusDtoImpl value,
          $Res Function(_$PaymentStatusDtoImpl) then) =
      __$$PaymentStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isDone', defaultValue: false) bool isDone,
      @JsonKey(name: 'reason', defaultValue: '') String reason});
}

/// @nodoc
class __$$PaymentStatusDtoImplCopyWithImpl<$Res>
    extends _$PaymentStatusDtoCopyWithImpl<$Res, _$PaymentStatusDtoImpl>
    implements _$$PaymentStatusDtoImplCopyWith<$Res> {
  __$$PaymentStatusDtoImplCopyWithImpl(_$PaymentStatusDtoImpl _value,
      $Res Function(_$PaymentStatusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDone = null,
    Object? reason = null,
  }) {
    return _then(_$PaymentStatusDtoImpl(
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentStatusDtoImpl implements _PaymentStatusDto {
  const _$PaymentStatusDtoImpl(
      {@JsonKey(name: 'isDone', defaultValue: false) required this.isDone,
      @JsonKey(name: 'reason', defaultValue: '') required this.reason});

  factory _$PaymentStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentStatusDtoImplFromJson(json);

  @override
  @JsonKey(name: 'isDone', defaultValue: false)
  final bool isDone;
  @override
  @JsonKey(name: 'reason', defaultValue: '')
  final String reason;

  @override
  String toString() {
    return 'PaymentStatusDto(isDone: $isDone, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStatusDtoImpl &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isDone, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStatusDtoImplCopyWith<_$PaymentStatusDtoImpl> get copyWith =>
      __$$PaymentStatusDtoImplCopyWithImpl<_$PaymentStatusDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentStatusDto implements PaymentStatusDto {
  const factory _PaymentStatusDto(
      {@JsonKey(name: 'isDone', defaultValue: false) required final bool isDone,
      @JsonKey(name: 'reason', defaultValue: '')
      required final String reason}) = _$PaymentStatusDtoImpl;

  factory _PaymentStatusDto.fromJson(Map<String, dynamic> json) =
      _$PaymentStatusDtoImpl.fromJson;

  @override
  @JsonKey(name: 'isDone', defaultValue: false)
  bool get isDone;
  @override
  @JsonKey(name: 'reason', defaultValue: '')
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStatusDtoImplCopyWith<_$PaymentStatusDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
