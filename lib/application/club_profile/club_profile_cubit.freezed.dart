// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClubProfileState {
  GlobalKey<State<StatefulWidget>> get key =>
      throw _privateConstructorUsedError;
  double get viewPortHeight => throw _privateConstructorUsedError;
  int get currentImageIndex => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  ScrollController get parentController => throw _privateConstructorUsedError;
  bool get isAtTop => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClubProfileStateCopyWith<ClubProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubProfileStateCopyWith<$Res> {
  factory $ClubProfileStateCopyWith(
          ClubProfileState value, $Res Function(ClubProfileState) then) =
      _$ClubProfileStateCopyWithImpl<$Res, ClubProfileState>;
  @useResult
  $Res call(
      {GlobalKey<State<StatefulWidget>> key,
      double viewPortHeight,
      int currentImageIndex,
      ScrollController scrollController,
      ScrollController parentController,
      bool isAtTop,
      List<String> images});
}

/// @nodoc
class _$ClubProfileStateCopyWithImpl<$Res, $Val extends ClubProfileState>
    implements $ClubProfileStateCopyWith<$Res> {
  _$ClubProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? viewPortHeight = null,
    Object? currentImageIndex = null,
    Object? scrollController = null,
    Object? parentController = null,
    Object? isAtTop = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      viewPortHeight: null == viewPortHeight
          ? _value.viewPortHeight
          : viewPortHeight // ignore: cast_nullable_to_non_nullable
              as double,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      parentController: null == parentController
          ? _value.parentController
          : parentController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isAtTop: null == isAtTop
          ? _value.isAtTop
          : isAtTop // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubProfileStateImplCopyWith<$Res>
    implements $ClubProfileStateCopyWith<$Res> {
  factory _$$ClubProfileStateImplCopyWith(_$ClubProfileStateImpl value,
          $Res Function(_$ClubProfileStateImpl) then) =
      __$$ClubProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GlobalKey<State<StatefulWidget>> key,
      double viewPortHeight,
      int currentImageIndex,
      ScrollController scrollController,
      ScrollController parentController,
      bool isAtTop,
      List<String> images});
}

/// @nodoc
class __$$ClubProfileStateImplCopyWithImpl<$Res>
    extends _$ClubProfileStateCopyWithImpl<$Res, _$ClubProfileStateImpl>
    implements _$$ClubProfileStateImplCopyWith<$Res> {
  __$$ClubProfileStateImplCopyWithImpl(_$ClubProfileStateImpl _value,
      $Res Function(_$ClubProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? viewPortHeight = null,
    Object? currentImageIndex = null,
    Object? scrollController = null,
    Object? parentController = null,
    Object? isAtTop = null,
    Object? images = null,
  }) {
    return _then(_$ClubProfileStateImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      viewPortHeight: null == viewPortHeight
          ? _value.viewPortHeight
          : viewPortHeight // ignore: cast_nullable_to_non_nullable
              as double,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      parentController: null == parentController
          ? _value.parentController
          : parentController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isAtTop: null == isAtTop
          ? _value.isAtTop
          : isAtTop // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ClubProfileStateImpl implements _ClubProfileState {
  const _$ClubProfileStateImpl(
      {required this.key,
      required this.viewPortHeight,
      required this.currentImageIndex,
      required this.scrollController,
      required this.parentController,
      required this.isAtTop,
      required final List<String> images})
      : _images = images;

  @override
  final GlobalKey<State<StatefulWidget>> key;
  @override
  final double viewPortHeight;
  @override
  final int currentImageIndex;
  @override
  final ScrollController scrollController;
  @override
  final ScrollController parentController;
  @override
  final bool isAtTop;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ClubProfileState(key: $key, viewPortHeight: $viewPortHeight, currentImageIndex: $currentImageIndex, scrollController: $scrollController, parentController: $parentController, isAtTop: $isAtTop, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubProfileStateImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.viewPortHeight, viewPortHeight) ||
                other.viewPortHeight == viewPortHeight) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.parentController, parentController) ||
                other.parentController == parentController) &&
            (identical(other.isAtTop, isAtTop) || other.isAtTop == isAtTop) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      viewPortHeight,
      currentImageIndex,
      scrollController,
      parentController,
      isAtTop,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubProfileStateImplCopyWith<_$ClubProfileStateImpl> get copyWith =>
      __$$ClubProfileStateImplCopyWithImpl<_$ClubProfileStateImpl>(
          this, _$identity);
}

abstract class _ClubProfileState implements ClubProfileState {
  const factory _ClubProfileState(
      {required final GlobalKey<State<StatefulWidget>> key,
      required final double viewPortHeight,
      required final int currentImageIndex,
      required final ScrollController scrollController,
      required final ScrollController parentController,
      required final bool isAtTop,
      required final List<String> images}) = _$ClubProfileStateImpl;

  @override
  GlobalKey<State<StatefulWidget>> get key;
  @override
  double get viewPortHeight;
  @override
  int get currentImageIndex;
  @override
  ScrollController get scrollController;
  @override
  ScrollController get parentController;
  @override
  bool get isAtTop;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$ClubProfileStateImplCopyWith<_$ClubProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
