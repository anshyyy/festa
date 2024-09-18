// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  CoreRepository get coreRepository => throw _privateConstructorUsedError;
  CarouselController get caraouselController =>
      throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  List<Widget> get highlightWidgets => throw _privateConstructorUsedError;
  TextEditingController get bioTextController =>
      throw _privateConstructorUsedError;
  TextEditingController get nameEditingController =>
      throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  bool get isSaveEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      int userId,
      UserRepository userRepository,
      CoreRepository coreRepository,
      CarouselController caraouselController,
      String? coverImageUrl,
      String? profileImageUrl,
      List<Widget> highlightWidgets,
      TextEditingController bioTextController,
      TextEditingController nameEditingController,
      UserDto? user,
      bool isSaveEnabled});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? userId = null,
    Object? userRepository = null,
    Object? coreRepository = null,
    Object? caraouselController = null,
    Object? coverImageUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? highlightWidgets = null,
    Object? bioTextController = null,
    Object? nameEditingController = null,
    Object? user = freezed,
    Object? isSaveEnabled = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
      caraouselController: null == caraouselController
          ? _value.caraouselController
          : caraouselController // ignore: cast_nullable_to_non_nullable
              as CarouselController,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightWidgets: null == highlightWidgets
          ? _value.highlightWidgets
          : highlightWidgets // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      bioTextController: null == bioTextController
          ? _value.bioTextController
          : bioTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      nameEditingController: null == nameEditingController
          ? _value.nameEditingController
          : nameEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isSaveEnabled: null == isSaveEnabled
          ? _value.isSaveEnabled
          : isSaveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileStateImplCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$EditProfileStateImplCopyWith(_$EditProfileStateImpl value,
          $Res Function(_$EditProfileStateImpl) then) =
      __$$EditProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isFailure,
      int userId,
      UserRepository userRepository,
      CoreRepository coreRepository,
      CarouselController caraouselController,
      String? coverImageUrl,
      String? profileImageUrl,
      List<Widget> highlightWidgets,
      TextEditingController bioTextController,
      TextEditingController nameEditingController,
      UserDto? user,
      bool isSaveEnabled});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$EditProfileStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$EditProfileStateImpl>
    implements _$$EditProfileStateImplCopyWith<$Res> {
  __$$EditProfileStateImplCopyWithImpl(_$EditProfileStateImpl _value,
      $Res Function(_$EditProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? userId = null,
    Object? userRepository = null,
    Object? coreRepository = null,
    Object? caraouselController = null,
    Object? coverImageUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? highlightWidgets = null,
    Object? bioTextController = null,
    Object? nameEditingController = null,
    Object? user = freezed,
    Object? isSaveEnabled = null,
  }) {
    return _then(_$EditProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userRepository: null == userRepository
          ? _value.userRepository
          : userRepository // ignore: cast_nullable_to_non_nullable
              as UserRepository,
      coreRepository: null == coreRepository
          ? _value.coreRepository
          : coreRepository // ignore: cast_nullable_to_non_nullable
              as CoreRepository,
      caraouselController: null == caraouselController
          ? _value.caraouselController
          : caraouselController // ignore: cast_nullable_to_non_nullable
              as CarouselController,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightWidgets: null == highlightWidgets
          ? _value._highlightWidgets
          : highlightWidgets // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      bioTextController: null == bioTextController
          ? _value.bioTextController
          : bioTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      nameEditingController: null == nameEditingController
          ? _value.nameEditingController
          : nameEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isSaveEnabled: null == isSaveEnabled
          ? _value.isSaveEnabled
          : isSaveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditProfileStateImpl implements _EditProfileState {
  const _$EditProfileStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.userId,
      required this.userRepository,
      required this.coreRepository,
      required this.caraouselController,
      this.coverImageUrl,
      this.profileImageUrl,
      required final List<Widget> highlightWidgets,
      required this.bioTextController,
      required this.nameEditingController,
      this.user,
      required this.isSaveEnabled})
      : _highlightWidgets = highlightWidgets;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final int userId;
  @override
  final UserRepository userRepository;
  @override
  final CoreRepository coreRepository;
  @override
  final CarouselController caraouselController;
  @override
  final String? coverImageUrl;
  @override
  final String? profileImageUrl;
  final List<Widget> _highlightWidgets;
  @override
  List<Widget> get highlightWidgets {
    if (_highlightWidgets is EqualUnmodifiableListView)
      return _highlightWidgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightWidgets);
  }

  @override
  final TextEditingController bioTextController;
  @override
  final TextEditingController nameEditingController;
  @override
  final UserDto? user;
  @override
  final bool isSaveEnabled;

  @override
  String toString() {
    return 'EditProfileState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, userId: $userId, userRepository: $userRepository, coreRepository: $coreRepository, caraouselController: $caraouselController, coverImageUrl: $coverImageUrl, profileImageUrl: $profileImageUrl, highlightWidgets: $highlightWidgets, bioTextController: $bioTextController, nameEditingController: $nameEditingController, user: $user, isSaveEnabled: $isSaveEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.coreRepository, coreRepository) ||
                other.coreRepository == coreRepository) &&
            (identical(other.caraouselController, caraouselController) ||
                other.caraouselController == caraouselController) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._highlightWidgets, _highlightWidgets) &&
            (identical(other.bioTextController, bioTextController) ||
                other.bioTextController == bioTextController) &&
            (identical(other.nameEditingController, nameEditingController) ||
                other.nameEditingController == nameEditingController) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isSaveEnabled, isSaveEnabled) ||
                other.isSaveEnabled == isSaveEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      userId,
      userRepository,
      coreRepository,
      caraouselController,
      coverImageUrl,
      profileImageUrl,
      const DeepCollectionEquality().hash(_highlightWidgets),
      bioTextController,
      nameEditingController,
      user,
      isSaveEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      __$$EditProfileStateImplCopyWithImpl<_$EditProfileStateImpl>(
          this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final bool isFailure,
      required final int userId,
      required final UserRepository userRepository,
      required final CoreRepository coreRepository,
      required final CarouselController caraouselController,
      final String? coverImageUrl,
      final String? profileImageUrl,
      required final List<Widget> highlightWidgets,
      required final TextEditingController bioTextController,
      required final TextEditingController nameEditingController,
      final UserDto? user,
      required final bool isSaveEnabled}) = _$EditProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  int get userId;
  @override
  UserRepository get userRepository;
  @override
  CoreRepository get coreRepository;
  @override
  CarouselController get caraouselController;
  @override
  String? get coverImageUrl;
  @override
  String? get profileImageUrl;
  @override
  List<Widget> get highlightWidgets;
  @override
  TextEditingController get bioTextController;
  @override
  TextEditingController get nameEditingController;
  @override
  UserDto? get user;
  @override
  bool get isSaveEnabled;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
