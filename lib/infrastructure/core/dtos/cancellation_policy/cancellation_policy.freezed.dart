// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancellation_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancellationPolicy _$CancellationPolicyFromJson(Map<String, dynamic> json) {
  return _CancellationPolicy.fromJson(json);
}

/// @nodoc
mixin _$CancellationPolicy {
  String get intro => throw _privateConstructorUsedError;
  List<PolicyDetail> get policyDetails => throw _privateConstructorUsedError;
  String get acknowledgment => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this CancellationPolicy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancellationPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancellationPolicyCopyWith<CancellationPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancellationPolicyCopyWith<$Res> {
  factory $CancellationPolicyCopyWith(
          CancellationPolicy value, $Res Function(CancellationPolicy) then) =
      _$CancellationPolicyCopyWithImpl<$Res, CancellationPolicy>;
  @useResult
  $Res call(
      {String intro,
      List<PolicyDetail> policyDetails,
      String acknowledgment,
      String note});
}

/// @nodoc
class _$CancellationPolicyCopyWithImpl<$Res, $Val extends CancellationPolicy>
    implements $CancellationPolicyCopyWith<$Res> {
  _$CancellationPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancellationPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intro = null,
    Object? policyDetails = null,
    Object? acknowledgment = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      policyDetails: null == policyDetails
          ? _value.policyDetails
          : policyDetails // ignore: cast_nullable_to_non_nullable
              as List<PolicyDetail>,
      acknowledgment: null == acknowledgment
          ? _value.acknowledgment
          : acknowledgment // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancellationPolicyImplCopyWith<$Res>
    implements $CancellationPolicyCopyWith<$Res> {
  factory _$$CancellationPolicyImplCopyWith(_$CancellationPolicyImpl value,
          $Res Function(_$CancellationPolicyImpl) then) =
      __$$CancellationPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String intro,
      List<PolicyDetail> policyDetails,
      String acknowledgment,
      String note});
}

/// @nodoc
class __$$CancellationPolicyImplCopyWithImpl<$Res>
    extends _$CancellationPolicyCopyWithImpl<$Res, _$CancellationPolicyImpl>
    implements _$$CancellationPolicyImplCopyWith<$Res> {
  __$$CancellationPolicyImplCopyWithImpl(_$CancellationPolicyImpl _value,
      $Res Function(_$CancellationPolicyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancellationPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intro = null,
    Object? policyDetails = null,
    Object? acknowledgment = null,
    Object? note = null,
  }) {
    return _then(_$CancellationPolicyImpl(
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      policyDetails: null == policyDetails
          ? _value._policyDetails
          : policyDetails // ignore: cast_nullable_to_non_nullable
              as List<PolicyDetail>,
      acknowledgment: null == acknowledgment
          ? _value.acknowledgment
          : acknowledgment // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancellationPolicyImpl implements _CancellationPolicy {
  const _$CancellationPolicyImpl(
      {required this.intro,
      required final List<PolicyDetail> policyDetails,
      required this.acknowledgment,
      required this.note})
      : _policyDetails = policyDetails;

  factory _$CancellationPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancellationPolicyImplFromJson(json);

  @override
  final String intro;
  final List<PolicyDetail> _policyDetails;
  @override
  List<PolicyDetail> get policyDetails {
    if (_policyDetails is EqualUnmodifiableListView) return _policyDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_policyDetails);
  }

  @override
  final String acknowledgment;
  @override
  final String note;

  @override
  String toString() {
    return 'CancellationPolicy(intro: $intro, policyDetails: $policyDetails, acknowledgment: $acknowledgment, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancellationPolicyImpl &&
            (identical(other.intro, intro) || other.intro == intro) &&
            const DeepCollectionEquality()
                .equals(other._policyDetails, _policyDetails) &&
            (identical(other.acknowledgment, acknowledgment) ||
                other.acknowledgment == acknowledgment) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      intro,
      const DeepCollectionEquality().hash(_policyDetails),
      acknowledgment,
      note);

  /// Create a copy of CancellationPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancellationPolicyImplCopyWith<_$CancellationPolicyImpl> get copyWith =>
      __$$CancellationPolicyImplCopyWithImpl<_$CancellationPolicyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancellationPolicyImplToJson(
      this,
    );
  }
}

abstract class _CancellationPolicy implements CancellationPolicy {
  const factory _CancellationPolicy(
      {required final String intro,
      required final List<PolicyDetail> policyDetails,
      required final String acknowledgment,
      required final String note}) = _$CancellationPolicyImpl;

  factory _CancellationPolicy.fromJson(Map<String, dynamic> json) =
      _$CancellationPolicyImpl.fromJson;

  @override
  String get intro;
  @override
  List<PolicyDetail> get policyDetails;
  @override
  String get acknowledgment;
  @override
  String get note;

  /// Create a copy of CancellationPolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancellationPolicyImplCopyWith<_$CancellationPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PolicyDetail _$PolicyDetailFromJson(Map<String, dynamic> json) {
  return _PolicyDetail.fromJson(json);
}

/// @nodoc
mixin _$PolicyDetail {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this PolicyDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PolicyDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PolicyDetailCopyWith<PolicyDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyDetailCopyWith<$Res> {
  factory $PolicyDetailCopyWith(
          PolicyDetail value, $Res Function(PolicyDetail) then) =
      _$PolicyDetailCopyWithImpl<$Res, PolicyDetail>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$PolicyDetailCopyWithImpl<$Res, $Val extends PolicyDetail>
    implements $PolicyDetailCopyWith<$Res> {
  _$PolicyDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PolicyDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PolicyDetailImplCopyWith<$Res>
    implements $PolicyDetailCopyWith<$Res> {
  factory _$$PolicyDetailImplCopyWith(
          _$PolicyDetailImpl value, $Res Function(_$PolicyDetailImpl) then) =
      __$$PolicyDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$PolicyDetailImplCopyWithImpl<$Res>
    extends _$PolicyDetailCopyWithImpl<$Res, _$PolicyDetailImpl>
    implements _$$PolicyDetailImplCopyWith<$Res> {
  __$$PolicyDetailImplCopyWithImpl(
      _$PolicyDetailImpl _value, $Res Function(_$PolicyDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PolicyDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$PolicyDetailImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PolicyDetailImpl implements _PolicyDetail {
  const _$PolicyDetailImpl({required this.title, required this.description});

  factory _$PolicyDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PolicyDetailImplFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'PolicyDetail(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PolicyDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  /// Create a copy of PolicyDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PolicyDetailImplCopyWith<_$PolicyDetailImpl> get copyWith =>
      __$$PolicyDetailImplCopyWithImpl<_$PolicyDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PolicyDetailImplToJson(
      this,
    );
  }
}

abstract class _PolicyDetail implements PolicyDetail {
  const factory _PolicyDetail(
      {required final String title,
      required final String description}) = _$PolicyDetailImpl;

  factory _PolicyDetail.fromJson(Map<String, dynamic> json) =
      _$PolicyDetailImpl.fromJson;

  @override
  String get title;
  @override
  String get description;

  /// Create a copy of PolicyDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PolicyDetailImplCopyWith<_$PolicyDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
