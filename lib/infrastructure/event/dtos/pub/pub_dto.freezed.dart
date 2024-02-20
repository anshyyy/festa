// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pub_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubDto _$PubDtoFromJson(Map<String, dynamic> json) {
  return _PubDto.fromJson(json);
}

/// @nodoc
mixin _$PubDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName', defaultValue: '')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubDtoCopyWith<PubDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubDtoCopyWith<$Res> {
  factory $PubDtoCopyWith(PubDto value, $Res Function(PubDto) then) =
      _$PubDtoCopyWithImpl<$Res, PubDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'userName', defaultValue: '') String userName,
      @JsonKey(name: 'averageRating', defaultValue: 0.0) double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl});
}

/// @nodoc
class _$PubDtoCopyWithImpl<$Res, $Val extends PubDto>
    implements $PubDtoCopyWith<$Res> {
  _$PubDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? userName = null,
    Object? averageRating = null,
    Object? coverImageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PubDtoImplCopyWith<$Res> implements $PubDtoCopyWith<$Res> {
  factory _$$PubDtoImplCopyWith(
          _$PubDtoImpl value, $Res Function(_$PubDtoImpl) then) =
      __$$PubDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'fullName', defaultValue: '') String fullName,
      @JsonKey(name: 'userName', defaultValue: '') String userName,
      @JsonKey(name: 'averageRating', defaultValue: 0.0) double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '') String coverImageUrl});
}

/// @nodoc
class __$$PubDtoImplCopyWithImpl<$Res>
    extends _$PubDtoCopyWithImpl<$Res, _$PubDtoImpl>
    implements _$$PubDtoImplCopyWith<$Res> {
  __$$PubDtoImplCopyWithImpl(
      _$PubDtoImpl _value, $Res Function(_$PubDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? userName = null,
    Object? averageRating = null,
    Object? coverImageUrl = null,
  }) {
    return _then(_$PubDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PubDtoImpl implements _PubDto {
  const _$PubDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'fullName', defaultValue: '') required this.fullName,
      @JsonKey(name: 'userName', defaultValue: '') required this.userName,
      @JsonKey(name: 'averageRating', defaultValue: 0.0)
      required this.averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required this.coverImageUrl});

  factory _$PubDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PubDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  final String fullName;
  @override
  @JsonKey(name: 'userName', defaultValue: '')
  final String userName;
  @override
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  final double averageRating;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  final String coverImageUrl;

  @override
  String toString() {
    return 'PubDto(id: $id, fullName: $fullName, userName: $userName, averageRating: $averageRating, coverImageUrl: $coverImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PubDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, userName, averageRating, coverImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PubDtoImplCopyWith<_$PubDtoImpl> get copyWith =>
      __$$PubDtoImplCopyWithImpl<_$PubDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PubDtoImplToJson(
      this,
    );
  }
}

abstract class _PubDto implements PubDto {
  const factory _PubDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'fullName', defaultValue: '')
      required final String fullName,
      @JsonKey(name: 'userName', defaultValue: '')
      required final String userName,
      @JsonKey(name: 'averageRating', defaultValue: 0.0)
      required final double averageRating,
      @JsonKey(name: 'coverImageUrl', defaultValue: '')
      required final String coverImageUrl}) = _$PubDtoImpl;

  factory _PubDto.fromJson(Map<String, dynamic> json) = _$PubDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'fullName', defaultValue: '')
  String get fullName;
  @override
  @JsonKey(name: 'userName', defaultValue: '')
  String get userName;
  @override
  @JsonKey(name: 'averageRating', defaultValue: 0.0)
  double get averageRating;
  @override
  @JsonKey(name: 'coverImageUrl', defaultValue: '')
  String get coverImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$PubDtoImplCopyWith<_$PubDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
