// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubEventDto _$PubEventDtoFromJson(Map<String, dynamic> json) {
  return _PubEventDto.fromJson(json);
}

/// @nodoc
mixin _$PubEventDto {
  @JsonKey(name: 'fullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  DateTime get startDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubEventDtoCopyWith<PubEventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubEventDtoCopyWith<$Res> {
  factory $PubEventDtoCopyWith(
          PubEventDto value, $Res Function(PubEventDto) then) =
      _$PubEventDtoCopyWithImpl<$Res, PubEventDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl,
      @JsonKey(name: 'startDate') DateTime startDate});
}

/// @nodoc
class _$PubEventDtoCopyWithImpl<$Res, $Val extends PubEventDto>
    implements $PubEventDtoCopyWith<$Res> {
  _$PubEventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? coverImageUrl = null,
    Object? startDate = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubEventDtoImplCopyWith<$Res>
    implements $PubEventDtoCopyWith<$Res> {
  factory _$$PubEventDtoImplCopyWith(
          _$PubEventDtoImpl value, $Res Function(_$PubEventDtoImpl) then) =
      __$$PubEventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl,
      @JsonKey(name: 'startDate') DateTime startDate});
}

/// @nodoc
class __$$PubEventDtoImplCopyWithImpl<$Res>
    extends _$PubEventDtoCopyWithImpl<$Res, _$PubEventDtoImpl>
    implements _$$PubEventDtoImplCopyWith<$Res> {
  __$$PubEventDtoImplCopyWithImpl(
      _$PubEventDtoImpl _value, $Res Function(_$PubEventDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? coverImageUrl = null,
    Object? startDate = null,
  }) {
    return _then(_$PubEventDtoImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubEventDtoImpl implements _PubEventDto {
  const _$PubEventDtoImpl(
      {@JsonKey(name: 'fullName') required this.fullName,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required this.coverImageUrl,
      @JsonKey(name: 'startDate') required this.startDate});

  factory _$PubEventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubEventDtoImplFromJson(json);

  @override
  @JsonKey(name: 'fullName')
  final String fullName;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  final String coverImageUrl;
  @override
  @JsonKey(name: 'startDate')
  final DateTime startDate;

  @override
  String toString() {
    return 'PubEventDto(fullName: $fullName, coverImageUrl: $coverImageUrl, startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubEventDtoImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, coverImageUrl, startDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubEventDtoImplCopyWith<_$PubEventDtoImpl> get copyWith =>
      __$$PubEventDtoImplCopyWithImpl<_$PubEventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubEventDtoImplToJson(
      this,
    );
  }
}

abstract class _PubEventDto implements PubEventDto {
  const factory _PubEventDto(
          {@JsonKey(name: 'fullName') required final String fullName,
          @JsonKey(name: 'coverImageUrl', defaultValue: '')
          required final String coverImageUrl,
          @JsonKey(name: 'startDate') required final DateTime startDate}) =
      _$PubEventDtoImpl;

  factory _PubEventDto.fromJson(Map<String, dynamic> json) =
      _$PubEventDtoImpl.fromJson;

  @override
  @JsonKey(name: 'fullName')
  String get fullName;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl;
  @override
  @JsonKey(name: 'startDate')
  DateTime get startDate;
  @override
  @JsonKey(ignore: true)
  _$$PubEventDtoImplCopyWith<_$PubEventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
