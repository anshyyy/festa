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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get bioSaveEnabled => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  UserRepository get userRepository => throw _privateConstructorUsedError;
  CoreRepository get coreRepository => throw _privateConstructorUsedError;
  custom_carousel.CarouselSliderController get carouselController =>
      throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  bool get showBottomSheet => throw _privateConstructorUsedError;
  List<Widget> get highlightWidgets => throw _privateConstructorUsedError;
  TextEditingController get bioTextController =>
      throw _privateConstructorUsedError;
  TextEditingController get nameEditingController =>
      throw _privateConstructorUsedError;
  UserDto? get user => throw _privateConstructorUsedError;
  bool get isSaveEnabled => throw _privateConstructorUsedError;
  List<String> get lsOFSex => throw _privateConstructorUsedError;
  List<String> get lsOFSexValue => throw _privateConstructorUsedError;
  String? get userGender => throw _privateConstructorUsedError;
  String? get gendertToRender => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      bool bioSaveEnabled,
      int userId,
      UserRepository userRepository,
      CoreRepository coreRepository,
      custom_carousel.CarouselSliderController carouselController,
      String? coverImageUrl,
      String? profileImageUrl,
      bool showBottomSheet,
      List<Widget> highlightWidgets,
      TextEditingController bioTextController,
      TextEditingController nameEditingController,
      UserDto? user,
      bool isSaveEnabled,
      List<String> lsOFSex,
      List<String> lsOFSexValue,
      String? userGender,
      String? gendertToRender});

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

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? bioSaveEnabled = null,
    Object? userId = null,
    Object? userRepository = null,
    Object? coreRepository = null,
    Object? carouselController = null,
    Object? coverImageUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? showBottomSheet = null,
    Object? highlightWidgets = null,
    Object? bioTextController = null,
    Object? nameEditingController = null,
    Object? user = freezed,
    Object? isSaveEnabled = null,
    Object? lsOFSex = null,
    Object? lsOFSexValue = null,
    Object? userGender = freezed,
    Object? gendertToRender = freezed,
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
      bioSaveEnabled: null == bioSaveEnabled
          ? _value.bioSaveEnabled
          : bioSaveEnabled // ignore: cast_nullable_to_non_nullable
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
      carouselController: null == carouselController
          ? _value.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as custom_carousel.CarouselSliderController,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      showBottomSheet: null == showBottomSheet
          ? _value.showBottomSheet
          : showBottomSheet // ignore: cast_nullable_to_non_nullable
              as bool,
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
      lsOFSex: null == lsOFSex
          ? _value.lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lsOFSexValue: null == lsOFSexValue
          ? _value.lsOFSexValue
          : lsOFSexValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userGender: freezed == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String?,
      gendertToRender: freezed == gendertToRender
          ? _value.gendertToRender
          : gendertToRender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
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
      bool bioSaveEnabled,
      int userId,
      UserRepository userRepository,
      CoreRepository coreRepository,
      custom_carousel.CarouselSliderController carouselController,
      String? coverImageUrl,
      String? profileImageUrl,
      bool showBottomSheet,
      List<Widget> highlightWidgets,
      TextEditingController bioTextController,
      TextEditingController nameEditingController,
      UserDto? user,
      bool isSaveEnabled,
      List<String> lsOFSex,
      List<String> lsOFSexValue,
      String? userGender,
      String? gendertToRender});

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

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? bioSaveEnabled = null,
    Object? userId = null,
    Object? userRepository = null,
    Object? coreRepository = null,
    Object? carouselController = null,
    Object? coverImageUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? showBottomSheet = null,
    Object? highlightWidgets = null,
    Object? bioTextController = null,
    Object? nameEditingController = null,
    Object? user = freezed,
    Object? isSaveEnabled = null,
    Object? lsOFSex = null,
    Object? lsOFSexValue = null,
    Object? userGender = freezed,
    Object? gendertToRender = freezed,
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
      bioSaveEnabled: null == bioSaveEnabled
          ? _value.bioSaveEnabled
          : bioSaveEnabled // ignore: cast_nullable_to_non_nullable
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
      carouselController: null == carouselController
          ? _value.carouselController
          : carouselController // ignore: cast_nullable_to_non_nullable
              as custom_carousel.CarouselSliderController,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      showBottomSheet: null == showBottomSheet
          ? _value.showBottomSheet
          : showBottomSheet // ignore: cast_nullable_to_non_nullable
              as bool,
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
      lsOFSex: null == lsOFSex
          ? _value._lsOFSex
          : lsOFSex // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lsOFSexValue: null == lsOFSexValue
          ? _value._lsOFSexValue
          : lsOFSexValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userGender: freezed == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String?,
      gendertToRender: freezed == gendertToRender
          ? _value.gendertToRender
          : gendertToRender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditProfileStateImpl implements _EditProfileState {
  const _$EditProfileStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.isFailure,
      required this.bioSaveEnabled,
      required this.userId,
      required this.userRepository,
      required this.coreRepository,
      required this.carouselController,
      this.coverImageUrl,
      this.profileImageUrl,
      required this.showBottomSheet,
      required final List<Widget> highlightWidgets,
      required this.bioTextController,
      required this.nameEditingController,
      this.user,
      required this.isSaveEnabled,
      required final List<String> lsOFSex,
      required final List<String> lsOFSexValue,
      required this.userGender,
      required this.gendertToRender})
      : _highlightWidgets = highlightWidgets,
        _lsOFSex = lsOFSex,
        _lsOFSexValue = lsOFSexValue;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @override
  final bool bioSaveEnabled;
  @override
  final int userId;
  @override
  final UserRepository userRepository;
  @override
  final CoreRepository coreRepository;
  @override
  final custom_carousel.CarouselSliderController carouselController;
  @override
  final String? coverImageUrl;
  @override
  final String? profileImageUrl;
  @override
  final bool showBottomSheet;
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
  final List<String> _lsOFSex;
  @override
  List<String> get lsOFSex {
    if (_lsOFSex is EqualUnmodifiableListView) return _lsOFSex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOFSex);
  }

  final List<String> _lsOFSexValue;
  @override
  List<String> get lsOFSexValue {
    if (_lsOFSexValue is EqualUnmodifiableListView) return _lsOFSexValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsOFSexValue);
  }

  @override
  final String? userGender;
  @override
  final String? gendertToRender;

  @override
  String toString() {
    return 'EditProfileState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, bioSaveEnabled: $bioSaveEnabled, userId: $userId, userRepository: $userRepository, coreRepository: $coreRepository, carouselController: $carouselController, coverImageUrl: $coverImageUrl, profileImageUrl: $profileImageUrl, showBottomSheet: $showBottomSheet, highlightWidgets: $highlightWidgets, bioTextController: $bioTextController, nameEditingController: $nameEditingController, user: $user, isSaveEnabled: $isSaveEnabled, lsOFSex: $lsOFSex, lsOFSexValue: $lsOFSexValue, userGender: $userGender, gendertToRender: $gendertToRender)';
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
            (identical(other.bioSaveEnabled, bioSaveEnabled) ||
                other.bioSaveEnabled == bioSaveEnabled) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userRepository, userRepository) ||
                other.userRepository == userRepository) &&
            (identical(other.coreRepository, coreRepository) ||
                other.coreRepository == coreRepository) &&
            (identical(other.carouselController, carouselController) ||
                other.carouselController == carouselController) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.showBottomSheet, showBottomSheet) ||
                other.showBottomSheet == showBottomSheet) &&
            const DeepCollectionEquality()
                .equals(other._highlightWidgets, _highlightWidgets) &&
            (identical(other.bioTextController, bioTextController) ||
                other.bioTextController == bioTextController) &&
            (identical(other.nameEditingController, nameEditingController) ||
                other.nameEditingController == nameEditingController) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isSaveEnabled, isSaveEnabled) ||
                other.isSaveEnabled == isSaveEnabled) &&
            const DeepCollectionEquality().equals(other._lsOFSex, _lsOFSex) &&
            const DeepCollectionEquality()
                .equals(other._lsOFSexValue, _lsOFSexValue) &&
            (identical(other.userGender, userGender) ||
                other.userGender == userGender) &&
            (identical(other.gendertToRender, gendertToRender) ||
                other.gendertToRender == gendertToRender));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isSuccess,
        isFailure,
        bioSaveEnabled,
        userId,
        userRepository,
        coreRepository,
        carouselController,
        coverImageUrl,
        profileImageUrl,
        showBottomSheet,
        const DeepCollectionEquality().hash(_highlightWidgets),
        bioTextController,
        nameEditingController,
        user,
        isSaveEnabled,
        const DeepCollectionEquality().hash(_lsOFSex),
        const DeepCollectionEquality().hash(_lsOFSexValue),
        userGender,
        gendertToRender
      ]);

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final bool bioSaveEnabled,
      required final int userId,
      required final UserRepository userRepository,
      required final CoreRepository coreRepository,
      required final custom_carousel.CarouselSliderController
          carouselController,
      final String? coverImageUrl,
      final String? profileImageUrl,
      required final bool showBottomSheet,
      required final List<Widget> highlightWidgets,
      required final TextEditingController bioTextController,
      required final TextEditingController nameEditingController,
      final UserDto? user,
      required final bool isSaveEnabled,
      required final List<String> lsOFSex,
      required final List<String> lsOFSexValue,
      required final String? userGender,
      required final String? gendertToRender}) = _$EditProfileStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  bool get bioSaveEnabled;
  @override
  int get userId;
  @override
  UserRepository get userRepository;
  @override
  CoreRepository get coreRepository;
  @override
  custom_carousel.CarouselSliderController get carouselController;
  @override
  String? get coverImageUrl;
  @override
  String? get profileImageUrl;
  @override
  bool get showBottomSheet;
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
  List<String> get lsOFSex;
  @override
  List<String> get lsOFSexValue;
  @override
  String? get userGender;
  @override
  String? get gendertToRender;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
