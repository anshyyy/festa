// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) {
  return _NotificationDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'actionTaken', defaultValue: '')
  String get actionTaken => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  NotificationContentDto get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDtoCopyWith<NotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDtoCopyWith<$Res> {
  factory $NotificationDtoCopyWith(
          NotificationDto value, $Res Function(NotificationDto) then) =
      _$NotificationDtoCopyWithImpl<$Res, NotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'actionTaken', defaultValue: '') String actionTaken,
      @JsonKey(name: 'status', defaultValue: '') String status,
      NotificationContentDto content});

  $NotificationContentDtoCopyWith<$Res> get content;
}

/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res, $Val extends NotificationDto>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionTaken = null,
    Object? status = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionTaken: null == actionTaken
          ? _value.actionTaken
          : actionTaken // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NotificationContentDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationContentDtoCopyWith<$Res> get content {
    return $NotificationContentDtoCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationDtoImplCopyWith<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  factory _$$NotificationDtoImplCopyWith(_$NotificationDtoImpl value,
          $Res Function(_$NotificationDtoImpl) then) =
      __$$NotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'actionTaken', defaultValue: '') String actionTaken,
      @JsonKey(name: 'status', defaultValue: '') String status,
      NotificationContentDto content});

  @override
  $NotificationContentDtoCopyWith<$Res> get content;
}

/// @nodoc
class __$$NotificationDtoImplCopyWithImpl<$Res>
    extends _$NotificationDtoCopyWithImpl<$Res, _$NotificationDtoImpl>
    implements _$$NotificationDtoImplCopyWith<$Res> {
  __$$NotificationDtoImplCopyWithImpl(
      _$NotificationDtoImpl _value, $Res Function(_$NotificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionTaken = null,
    Object? status = null,
    Object? content = null,
  }) {
    return _then(_$NotificationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionTaken: null == actionTaken
          ? _value.actionTaken
          : actionTaken // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NotificationContentDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDtoImpl implements _NotificationDto {
  const _$NotificationDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'actionTaken', defaultValue: '') required this.actionTaken,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      required this.content});

  factory _$NotificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'actionTaken', defaultValue: '')
  final String actionTaken;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  final NotificationContentDto content;

  @override
  String toString() {
    return 'NotificationDto(id: $id, actionTaken: $actionTaken, status: $status, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionTaken, actionTaken) ||
                other.actionTaken == actionTaken) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, actionTaken, status, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDtoImplCopyWith<_$NotificationDtoImpl> get copyWith =>
      __$$NotificationDtoImplCopyWithImpl<_$NotificationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _NotificationDto implements NotificationDto {
  const factory _NotificationDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'actionTaken', defaultValue: '')
      required final String actionTaken,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      required final NotificationContentDto content}) = _$NotificationDtoImpl;

  factory _NotificationDto.fromJson(Map<String, dynamic> json) =
      _$NotificationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'actionTaken', defaultValue: '')
  String get actionTaken;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  NotificationContentDto get content;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDtoImplCopyWith<_$NotificationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
