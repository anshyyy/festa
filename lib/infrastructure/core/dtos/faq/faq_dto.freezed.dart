// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQDto _$FAQDtoFromJson(Map<String, dynamic> json) {
  return _FAQDto.fromJson(json);
}

/// @nodoc
mixin _$FAQDto {
  @JsonKey(name: 'answer', defaultValue: '')
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'question', defaultValue: '')
  String get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQDtoCopyWith<FAQDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQDtoCopyWith<$Res> {
  factory $FAQDtoCopyWith(FAQDto value, $Res Function(FAQDto) then) =
      _$FAQDtoCopyWithImpl<$Res, FAQDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'answer', defaultValue: '') String answer,
      @JsonKey(name: 'question', defaultValue: '') String question});
}

/// @nodoc
class _$FAQDtoCopyWithImpl<$Res, $Val extends FAQDto>
    implements $FAQDtoCopyWith<$Res> {
  _$FAQDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQDtoImplCopyWith<$Res> implements $FAQDtoCopyWith<$Res> {
  factory _$$FAQDtoImplCopyWith(
          _$FAQDtoImpl value, $Res Function(_$FAQDtoImpl) then) =
      __$$FAQDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'answer', defaultValue: '') String answer,
      @JsonKey(name: 'question', defaultValue: '') String question});
}

/// @nodoc
class __$$FAQDtoImplCopyWithImpl<$Res>
    extends _$FAQDtoCopyWithImpl<$Res, _$FAQDtoImpl>
    implements _$$FAQDtoImplCopyWith<$Res> {
  __$$FAQDtoImplCopyWithImpl(
      _$FAQDtoImpl _value, $Res Function(_$FAQDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? question = null,
  }) {
    return _then(_$FAQDtoImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FAQDtoImpl implements _FAQDto {
  const _$FAQDtoImpl(
      {@JsonKey(name: 'answer', defaultValue: '') required this.answer,
      @JsonKey(name: 'question', defaultValue: '') required this.question});

  factory _$FAQDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FAQDtoImplFromJson(json);

  @override
  @JsonKey(name: 'answer', defaultValue: '')
  final String answer;
  @override
  @JsonKey(name: 'question', defaultValue: '')
  final String question;

  @override
  String toString() {
    return 'FAQDto(answer: $answer, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQDtoImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answer, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQDtoImplCopyWith<_$FAQDtoImpl> get copyWith =>
      __$$FAQDtoImplCopyWithImpl<_$FAQDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FAQDtoImplToJson(
      this,
    );
  }
}

abstract class _FAQDto implements FAQDto {
  const factory _FAQDto(
      {@JsonKey(name: 'answer', defaultValue: '') required final String answer,
      @JsonKey(name: 'question', defaultValue: '')
      required final String question}) = _$FAQDtoImpl;

  factory _FAQDto.fromJson(Map<String, dynamic> json) = _$FAQDtoImpl.fromJson;

  @override
  @JsonKey(name: 'answer', defaultValue: '')
  String get answer;
  @override
  @JsonKey(name: 'question', defaultValue: '')
  String get question;
  @override
  @JsonKey(ignore: true)
  _$$FAQDtoImplCopyWith<_$FAQDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
