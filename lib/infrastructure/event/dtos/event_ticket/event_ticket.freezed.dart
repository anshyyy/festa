// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventTicketDto _$EventTicketDtoFromJson(Map<String, dynamic> json) {
  return _EventTicketDto.fromJson(json);
}

/// @nodoc
mixin _$EventTicketDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int? get currentTicketsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  String get priceCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverCharge', defaultValue: 0)
  double get coverCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate', defaultValue: '')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate', defaultValue: '')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  int get maxTicketsToBook => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', defaultValue: '')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt', defaultValue: '')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedByMe', defaultValue: 0)
  int get bookedByMe => throw _privateConstructorUsedError;

  /// Serializes this EventTicketDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventTicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventTicketDtoCopyWith<EventTicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTicketDtoCopyWith<$Res> {
  factory $EventTicketDtoCopyWith(
          EventTicketDto value, $Res Function(EventTicketDto) then) =
      _$EventTicketDtoCopyWithImpl<$Res, EventTicketDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(defaultValue: 0) int? currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '') String priceCurrency,
      @JsonKey(name: 'coverCharge', defaultValue: 0) double coverCharge,
      @JsonKey(name: 'startDate', defaultValue: '') String startDate,
      @JsonKey(name: 'endDate', defaultValue: '') String endDate,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0) int maxTicketsToBook,
      @JsonKey(name: 'category', defaultValue: '') String? category,
      @JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'updatedAt', defaultValue: '') String updatedAt,
      @JsonKey(name: 'bookedByMe', defaultValue: 0) int bookedByMe});
}

/// @nodoc
class _$EventTicketDtoCopyWithImpl<$Res, $Val extends EventTicketDto>
    implements $EventTicketDtoCopyWith<$Res> {
  _$EventTicketDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventTicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? totalCapacity = null,
    Object? bookedSeats = null,
    Object? currentTicketsCount = freezed,
    Object? isPaid = null,
    Object? priceCurrency = null,
    Object? coverCharge = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? maxTicketsToBook = null,
    Object? category = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? bookedByMe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      currentTicketsCount: freezed == currentTicketsCount
          ? _value.currentTicketsCount
          : currentTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      priceCurrency: null == priceCurrency
          ? _value.priceCurrency
          : priceCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      coverCharge: null == coverCharge
          ? _value.coverCharge
          : coverCharge // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      maxTicketsToBook: null == maxTicketsToBook
          ? _value.maxTicketsToBook
          : maxTicketsToBook // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      bookedByMe: null == bookedByMe
          ? _value.bookedByMe
          : bookedByMe // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventTicketDtoImplCopyWith<$Res>
    implements $EventTicketDtoCopyWith<$Res> {
  factory _$$EventTicketDtoImplCopyWith(_$EventTicketDtoImpl value,
          $Res Function(_$EventTicketDtoImpl) then) =
      __$$EventTicketDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(defaultValue: 0) int? currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '') String priceCurrency,
      @JsonKey(name: 'coverCharge', defaultValue: 0) double coverCharge,
      @JsonKey(name: 'startDate', defaultValue: '') String startDate,
      @JsonKey(name: 'endDate', defaultValue: '') String endDate,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0) int maxTicketsToBook,
      @JsonKey(name: 'category', defaultValue: '') String? category,
      @JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'updatedAt', defaultValue: '') String updatedAt,
      @JsonKey(name: 'bookedByMe', defaultValue: 0) int bookedByMe});
}

/// @nodoc
class __$$EventTicketDtoImplCopyWithImpl<$Res>
    extends _$EventTicketDtoCopyWithImpl<$Res, _$EventTicketDtoImpl>
    implements _$$EventTicketDtoImplCopyWith<$Res> {
  __$$EventTicketDtoImplCopyWithImpl(
      _$EventTicketDtoImpl _value, $Res Function(_$EventTicketDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventTicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? totalCapacity = null,
    Object? bookedSeats = null,
    Object? currentTicketsCount = freezed,
    Object? isPaid = null,
    Object? priceCurrency = null,
    Object? coverCharge = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? maxTicketsToBook = null,
    Object? category = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? bookedByMe = null,
  }) {
    return _then(_$EventTicketDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      currentTicketsCount: freezed == currentTicketsCount
          ? _value.currentTicketsCount
          : currentTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      priceCurrency: null == priceCurrency
          ? _value.priceCurrency
          : priceCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      coverCharge: null == coverCharge
          ? _value.coverCharge
          : coverCharge // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      maxTicketsToBook: null == maxTicketsToBook
          ? _value.maxTicketsToBook
          : maxTicketsToBook // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      bookedByMe: null == bookedByMe
          ? _value.bookedByMe
          : bookedByMe // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventTicketDtoImpl implements _EventTicketDto {
  const _$EventTicketDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'price', defaultValue: 0) required this.price,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required this.totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) required this.bookedSeats,
      @JsonKey(defaultValue: 0) required this.currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) required this.isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '')
      required this.priceCurrency,
      @JsonKey(name: 'coverCharge', defaultValue: 0) required this.coverCharge,
      @JsonKey(name: 'startDate', defaultValue: '') required this.startDate,
      @JsonKey(name: 'endDate', defaultValue: '') required this.endDate,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      required this.maxTicketsToBook,
      @JsonKey(name: 'category', defaultValue: '') this.category,
      @JsonKey(name: 'createdAt', defaultValue: '') required this.createdAt,
      @JsonKey(name: 'updatedAt', defaultValue: '') required this.updatedAt,
      @JsonKey(name: 'bookedByMe', defaultValue: 0) required this.bookedByMe});

  factory _$EventTicketDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTicketDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  final double price;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  final int totalCapacity;
  @override
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  final int bookedSeats;
  @override
  @JsonKey(defaultValue: 0)
  final int? currentTicketsCount;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  final bool isPaid;
  @override
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  final String priceCurrency;
  @override
  @JsonKey(name: 'coverCharge', defaultValue: 0)
  final double coverCharge;
  @override
  @JsonKey(name: 'startDate', defaultValue: '')
  final String startDate;
  @override
  @JsonKey(name: 'endDate', defaultValue: '')
  final String endDate;
  @override
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  final int maxTicketsToBook;
  @override
  @JsonKey(name: 'category', defaultValue: '')
  final String? category;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  final String createdAt;
  @override
  @JsonKey(name: 'updatedAt', defaultValue: '')
  final String updatedAt;
  @override
  @JsonKey(name: 'bookedByMe', defaultValue: 0)
  final int bookedByMe;

  @override
  String toString() {
    return 'EventTicketDto(id: $id, name: $name, description: $description, price: $price, totalCapacity: $totalCapacity, bookedSeats: $bookedSeats, currentTicketsCount: $currentTicketsCount, isPaid: $isPaid, priceCurrency: $priceCurrency, coverCharge: $coverCharge, startDate: $startDate, endDate: $endDate, maxTicketsToBook: $maxTicketsToBook, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, bookedByMe: $bookedByMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTicketDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalCapacity, totalCapacity) ||
                other.totalCapacity == totalCapacity) &&
            (identical(other.bookedSeats, bookedSeats) ||
                other.bookedSeats == bookedSeats) &&
            (identical(other.currentTicketsCount, currentTicketsCount) ||
                other.currentTicketsCount == currentTicketsCount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.priceCurrency, priceCurrency) ||
                other.priceCurrency == priceCurrency) &&
            (identical(other.coverCharge, coverCharge) ||
                other.coverCharge == coverCharge) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.maxTicketsToBook, maxTicketsToBook) ||
                other.maxTicketsToBook == maxTicketsToBook) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.bookedByMe, bookedByMe) ||
                other.bookedByMe == bookedByMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      totalCapacity,
      bookedSeats,
      currentTicketsCount,
      isPaid,
      priceCurrency,
      coverCharge,
      startDate,
      endDate,
      maxTicketsToBook,
      category,
      createdAt,
      updatedAt,
      bookedByMe);

  /// Create a copy of EventTicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventTicketDtoImplCopyWith<_$EventTicketDtoImpl> get copyWith =>
      __$$EventTicketDtoImplCopyWithImpl<_$EventTicketDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventTicketDtoImplToJson(
      this,
    );
  }
}

abstract class _EventTicketDto implements EventTicketDto {
  const factory _EventTicketDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'price', defaultValue: 0) required final double price,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required final int totalCapacity,
      @JsonKey(name: 'bookedSeats', defaultValue: 0)
      required final int bookedSeats,
      @JsonKey(defaultValue: 0) required final int? currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) required final bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '')
      required final String priceCurrency,
      @JsonKey(name: 'coverCharge', defaultValue: 0)
      required final double coverCharge,
      @JsonKey(name: 'startDate', defaultValue: '')
      required final String startDate,
      @JsonKey(name: 'endDate', defaultValue: '') required final String endDate,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      required final int maxTicketsToBook,
      @JsonKey(name: 'category', defaultValue: '') final String? category,
      @JsonKey(name: 'createdAt', defaultValue: '')
      required final String createdAt,
      @JsonKey(name: 'updatedAt', defaultValue: '')
      required final String updatedAt,
      @JsonKey(name: 'bookedByMe', defaultValue: 0)
      required final int bookedByMe}) = _$EventTicketDtoImpl;

  factory _EventTicketDto.fromJson(Map<String, dynamic> json) =
      _$EventTicketDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  double get price;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity;
  @override
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats;
  @override
  @JsonKey(defaultValue: 0)
  int? get currentTicketsCount;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid;
  @override
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  String get priceCurrency;
  @override
  @JsonKey(name: 'coverCharge', defaultValue: 0)
  double get coverCharge;
  @override
  @JsonKey(name: 'startDate', defaultValue: '')
  String get startDate;
  @override
  @JsonKey(name: 'endDate', defaultValue: '')
  String get endDate;
  @override
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  int get maxTicketsToBook;
  @override
  @JsonKey(name: 'category', defaultValue: '')
  String? get category;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt;
  @override
  @JsonKey(name: 'updatedAt', defaultValue: '')
  String get updatedAt;
  @override
  @JsonKey(name: 'bookedByMe', defaultValue: 0)
  int get bookedByMe;

  /// Create a copy of EventTicketDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventTicketDtoImplCopyWith<_$EventTicketDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
