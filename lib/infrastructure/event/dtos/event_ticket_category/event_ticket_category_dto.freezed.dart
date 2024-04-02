// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_ticket_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventTicketCategoryDto _$EventTicketCategoryDtoFromJson(
    Map<String, dynamic> json) {
  return _EventTicketCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$EventTicketCategoryDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get currentTicketsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  String get priceCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  int get maxTicketsToBook => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventTicketCategoryDtoCopyWith<EventTicketCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTicketCategoryDtoCopyWith<$Res> {
  factory $EventTicketCategoryDtoCopyWith(EventTicketCategoryDto value,
          $Res Function(EventTicketCategoryDto) then) =
      _$EventTicketCategoryDtoCopyWithImpl<$Res, EventTicketCategoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(defaultValue: 0) int currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '') String priceCurrency,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      int maxTicketsToBook});
}

/// @nodoc
class _$EventTicketCategoryDtoCopyWithImpl<$Res,
        $Val extends EventTicketCategoryDto>
    implements $EventTicketCategoryDtoCopyWith<$Res> {
  _$EventTicketCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? bookedSeats = null,
    Object? totalCapacity = null,
    Object? currentTicketsCount = null,
    Object? isPaid = null,
    Object? priceCurrency = null,
    Object? maxTicketsToBook = null,
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
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentTicketsCount: null == currentTicketsCount
          ? _value.currentTicketsCount
          : currentTicketsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      priceCurrency: null == priceCurrency
          ? _value.priceCurrency
          : priceCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      maxTicketsToBook: null == maxTicketsToBook
          ? _value.maxTicketsToBook
          : maxTicketsToBook // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventTicketCategoryDtoImplCopyWith<$Res>
    implements $EventTicketCategoryDtoCopyWith<$Res> {
  factory _$$EventTicketCategoryDtoImplCopyWith(
          _$EventTicketCategoryDtoImpl value,
          $Res Function(_$EventTicketCategoryDtoImpl) then) =
      __$$EventTicketCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'price', defaultValue: 0) double price,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) int bookedSeats,
      @JsonKey(name: 'totalCapacity', defaultValue: 0) int totalCapacity,
      @JsonKey(defaultValue: 0) int currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '') String priceCurrency,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      int maxTicketsToBook});
}

/// @nodoc
class __$$EventTicketCategoryDtoImplCopyWithImpl<$Res>
    extends _$EventTicketCategoryDtoCopyWithImpl<$Res,
        _$EventTicketCategoryDtoImpl>
    implements _$$EventTicketCategoryDtoImplCopyWith<$Res> {
  __$$EventTicketCategoryDtoImplCopyWithImpl(
      _$EventTicketCategoryDtoImpl _value,
      $Res Function(_$EventTicketCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? bookedSeats = null,
    Object? totalCapacity = null,
    Object? currentTicketsCount = null,
    Object? isPaid = null,
    Object? priceCurrency = null,
    Object? maxTicketsToBook = null,
  }) {
    return _then(_$EventTicketCategoryDtoImpl(
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
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalCapacity: null == totalCapacity
          ? _value.totalCapacity
          : totalCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentTicketsCount: null == currentTicketsCount
          ? _value.currentTicketsCount
          : currentTicketsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      priceCurrency: null == priceCurrency
          ? _value.priceCurrency
          : priceCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      maxTicketsToBook: null == maxTicketsToBook
          ? _value.maxTicketsToBook
          : maxTicketsToBook // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventTicketCategoryDtoImpl implements _EventTicketCategoryDto {
  const _$EventTicketCategoryDtoImpl(
      {@JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'price', defaultValue: 0) required this.price,
      @JsonKey(name: 'bookedSeats', defaultValue: 0) required this.bookedSeats,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required this.totalCapacity,
      @JsonKey(defaultValue: 0) required this.currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) required this.isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '')
      required this.priceCurrency,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      required this.maxTicketsToBook});

  factory _$EventTicketCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTicketCategoryDtoImplFromJson(json);

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
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  final int bookedSeats;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  final int totalCapacity;
  @override
  @JsonKey(defaultValue: 0)
  final int currentTicketsCount;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  final bool isPaid;
  @override
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  final String priceCurrency;
  @override
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  final int maxTicketsToBook;

  @override
  String toString() {
    return 'EventTicketCategoryDto(id: $id, name: $name, description: $description, price: $price, bookedSeats: $bookedSeats, totalCapacity: $totalCapacity, currentTicketsCount: $currentTicketsCount, isPaid: $isPaid, priceCurrency: $priceCurrency, maxTicketsToBook: $maxTicketsToBook)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTicketCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bookedSeats, bookedSeats) ||
                other.bookedSeats == bookedSeats) &&
            (identical(other.totalCapacity, totalCapacity) ||
                other.totalCapacity == totalCapacity) &&
            (identical(other.currentTicketsCount, currentTicketsCount) ||
                other.currentTicketsCount == currentTicketsCount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.priceCurrency, priceCurrency) ||
                other.priceCurrency == priceCurrency) &&
            (identical(other.maxTicketsToBook, maxTicketsToBook) ||
                other.maxTicketsToBook == maxTicketsToBook));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      bookedSeats,
      totalCapacity,
      currentTicketsCount,
      isPaid,
      priceCurrency,
      maxTicketsToBook);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventTicketCategoryDtoImplCopyWith<_$EventTicketCategoryDtoImpl>
      get copyWith => __$$EventTicketCategoryDtoImplCopyWithImpl<
          _$EventTicketCategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventTicketCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _EventTicketCategoryDto implements EventTicketCategoryDto {
  const factory _EventTicketCategoryDto(
      {@JsonKey(name: 'id', defaultValue: 0) required final int id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'price', defaultValue: 0) required final double price,
      @JsonKey(name: 'bookedSeats', defaultValue: 0)
      required final int bookedSeats,
      @JsonKey(name: 'totalCapacity', defaultValue: 0)
      required final int totalCapacity,
      @JsonKey(defaultValue: 0) required final int currentTicketsCount,
      @JsonKey(name: 'isPaid', defaultValue: false) required final bool isPaid,
      @JsonKey(name: 'priceCurrency', defaultValue: '')
      required final String priceCurrency,
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
      required final int maxTicketsToBook}) = _$EventTicketCategoryDtoImpl;

  factory _EventTicketCategoryDto.fromJson(Map<String, dynamic> json) =
      _$EventTicketCategoryDtoImpl.fromJson;

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
  @JsonKey(name: 'bookedSeats', defaultValue: 0)
  int get bookedSeats;
  @override
  @JsonKey(name: 'totalCapacity', defaultValue: 0)
  int get totalCapacity;
  @override
  @JsonKey(defaultValue: 0)
  int get currentTicketsCount;
  @override
  @JsonKey(name: 'isPaid', defaultValue: false)
  bool get isPaid;
  @override
  @JsonKey(name: 'priceCurrency', defaultValue: '')
  String get priceCurrency;
  @override
  @JsonKey(name: 'maxTicketsToBook', defaultValue: 0)
  int get maxTicketsToBook;
  @override
  @JsonKey(ignore: true)
  _$$EventTicketCategoryDtoImplCopyWith<_$EventTicketCategoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
