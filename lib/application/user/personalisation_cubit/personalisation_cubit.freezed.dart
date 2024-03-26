// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalisation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalisationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  List<PersonalizationMenuDto> get personalizationList =>
      throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalisationStateCopyWith<PersonalisationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalisationStateCopyWith<$Res> {
  factory $PersonalisationStateCopyWith(PersonalisationState value,
          $Res Function(PersonalisationState) then) =
      _$PersonalisationStateCopyWithImpl<$Res, PersonalisationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      List<PersonalizationMenuDto> personalizationList,
      UserRepository userRepository});
}

/// @nodoc
class _$PersonalisationStateCopyWithImpl<$Res,
        $Val extends PersonalisationState>
    implements $PersonalisationStateCopyWith<$Res> {
  _$PersonalisationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? personalizationList = null,
    Object? userRepository = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      personalizationList: null == personalizationList
          ? _value.personalizationList
          : personalizationList // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationMenuDto>,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalisationStateImplCopyWith<$Res>
    implements $PersonalisationStateCopyWith<$Res> {
  factory _$$PersonalisationStateImplCopyWith(_$PersonalisationStateImpl value,
          $Res Function(_$PersonalisationStateImpl) then) =
      __$$PersonalisationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      List<PersonalizationMenuDto> personalizationList,
      UserRepository userRepository});
}

/// @nodoc
class __$$PersonalisationStateImplCopyWithImpl<$Res>
    extends _$PersonalisationStateCopyWithImpl<$Res, _$PersonalisationStateImpl>
    implements _$$PersonalisationStateImplCopyWith<$Res> {
  __$$PersonalisationStateImplCopyWithImpl(_$PersonalisationStateImpl _value,
      $Res Function(_$PersonalisationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? personalizationList = null,
    Object? userRepository = null,
  }) {
    return _then(_$PersonalisationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      personalizationList: null == personalizationList
          ? _value._personalizationList
          : personalizationList // ignore: cast_nullable_to_non_nullable
              as List<PersonalizationMenuDto>,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
    ));
  }
}

/// @nodoc

class _$PersonalisationStateImpl implements _PersonalisationState {
  const _$PersonalisationStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      required final List<PersonalizationMenuDto> personalizationList,
      required this.userRepository})
      : _personalizationList = personalizationList;

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  final List<PersonalizationMenuDto> _personalizationList;
  @override
  List<PersonalizationMenuDto> get personalizationList {
    if (_personalizationList is EqualUnmodifiableListView)
      return _personalizationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalizationList);
  }

  @override
  final UserRepository userRepository;

  @override
  String toString() {
    return 'PersonalisationState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, personalizationList: $personalizationList, userRepository: $userRepository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalisationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            const DeepCollectionEquality()
                .equals(other._personalizationList, _personalizationList) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccessful,
      isFailed,
      noUse,
      const DeepCollectionEquality().hash(_personalizationList),
      userRepository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalisationStateImplCopyWith<_$PersonalisationStateImpl>
      get copyWith =>
          __$$PersonalisationStateImplCopyWithImpl<_$PersonalisationStateImpl>(
              this, _$identity);
}

abstract class _PersonalisationState implements PersonalisationState {
  const factory _PersonalisationState(
          {required final bool isLoading,
          required final bool isSuccessful,
          required final bool isFailed,
          required final bool noUse,
          required final List<PersonalizationMenuDto> personalizationList,
          required final UserRepository userRepository}) =
      _$PersonalisationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  List<PersonalizationMenuDto> get personalizationList;
  @override
  UserRepository get userRepository;
  @override
  @JsonKey(ignore: true)
  _$$PersonalisationStateImplCopyWith<_$PersonalisationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
