// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_ticket_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventTicketDetailDto _$EventTicketDetailDtoFromJson(Map<String, dynamic> json) {
  return _EventTicketDetailDto.fromJson(json);
}

/// @nodoc
mixin _$EventTicketDetailDto {
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
  @JsonKey(name: 'noOfTickets', defaultValue: 0)
  int get noOfTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  bool get coverChargeEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventTicketDetailDtoCopyWith<EventTicketDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTicketDetailDtoCopyWith<$Res> {
  factory $EventTicketDetailDtoCopyWith(EventTicketDetailDto value,
          $Res Function(EventTicketDetailDto) then) =
      _$EventTicketDetailDtoCopyWithImpl<$Res, EventTicketDetailDto>;
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
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0) int maxTicketsToBook,
      @JsonKey(name: 'noOfTickets', defaultValue: 0) int noOfTickets,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      bool coverChargeEnabled});
}

/// @nodoc
class _$EventTicketDetailDtoCopyWithImpl<$Res,
        $Val extends EventTicketDetailDto>
    implements $EventTicketDetailDtoCopyWith<$Res> {
  _$EventTicketDetailDtoCopyWithImpl(this._value, this._then);

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
    Object? noOfTickets = null,
    Object? coverChargeEnabled = null,
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
      noOfTickets: null == noOfTickets
          ? _value.noOfTickets
          : noOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      coverChargeEnabled: null == coverChargeEnabled
          ? _value.coverChargeEnabled
          : coverChargeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventTicketDetailDtoImplCopyWith<$Res>
    implements $EventTicketDetailDtoCopyWith<$Res> {
  factory _$$EventTicketDetailDtoImplCopyWith(_$EventTicketDetailDtoImpl value,
          $Res Function(_$EventTicketDetailDtoImpl) then) =
      __$$EventTicketDetailDtoImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'maxTicketsToBook', defaultValue: 0) int maxTicketsToBook,
      @JsonKey(name: 'noOfTickets', defaultValue: 0) int noOfTickets,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      bool coverChargeEnabled});
}

/// @nodoc
class __$$EventTicketDetailDtoImplCopyWithImpl<$Res>
    extends _$EventTicketDetailDtoCopyWithImpl<$Res, _$EventTicketDetailDtoImpl>
    implements _$$EventTicketDetailDtoImplCopyWith<$Res> {
  __$$EventTicketDetailDtoImplCopyWithImpl(_$EventTicketDetailDtoImpl _value,
      $Res Function(_$EventTicketDetailDtoImpl) _then)
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
    Object? noOfTickets = null,
    Object? coverChargeEnabled = null,
  }) {
    return _then(_$EventTicketDetailDtoImpl(
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
      noOfTickets: null == noOfTickets
          ? _value.noOfTickets
          : noOfTickets // ignore: cast_nullable_to_non_nullable
              as int,
      coverChargeEnabled: null == coverChargeEnabled
          ? _value.coverChargeEnabled
          : coverChargeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventTicketDetailDtoImpl implements _EventTicketDetailDto {
  const _$EventTicketDetailDtoImpl(
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
      required this.maxTicketsToBook,
      @JsonKey(name: 'noOfTickets', defaultValue: 0) required this.noOfTickets,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      required this.coverChargeEnabled});

  factory _$EventTicketDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTicketDetailDtoImplFromJson(json);

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
  @JsonKey(name: 'noOfTickets', defaultValue: 0)
  final int noOfTickets;
  @override
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  final bool coverChargeEnabled;

  @override
  String toString() {
    return 'EventTicketDetailDto(id: $id, name: $name, description: $description, price: $price, bookedSeats: $bookedSeats, totalCapacity: $totalCapacity, currentTicketsCount: $currentTicketsCount, isPaid: $isPaid, priceCurrency: $priceCurrency, maxTicketsToBook: $maxTicketsToBook, noOfTickets: $noOfTickets, coverChargeEnabled: $coverChargeEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTicketDetailDtoImpl &&
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
                other.maxTicketsToBook == maxTicketsToBook) &&
            (identical(other.noOfTickets, noOfTickets) ||
                other.noOfTickets == noOfTickets) &&
            (identical(other.coverChargeEnabled, coverChargeEnabled) ||
                other.coverChargeEnabled == coverChargeEnabled));
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
      maxTicketsToBook,
      noOfTickets,
      coverChargeEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventTicketDetailDtoImplCopyWith<_$EventTicketDetailDtoImpl>
      get copyWith =>
          __$$EventTicketDetailDtoImplCopyWithImpl<_$EventTicketDetailDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventTicketDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _EventTicketDetailDto implements EventTicketDetailDto {
  const factory _EventTicketDetailDto(
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
      required final int maxTicketsToBook,
      @JsonKey(name: 'noOfTickets', defaultValue: 0)
      required final int noOfTickets,
      @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
      required final bool coverChargeEnabled}) = _$EventTicketDetailDtoImpl;

  factory _EventTicketDetailDto.fromJson(Map<String, dynamic> json) =
      _$EventTicketDetailDtoImpl.fromJson;

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
  @JsonKey(name: 'noOfTickets', defaultValue: 0)
  int get noOfTickets;
  @override
  @JsonKey(name: 'coverChargeEnabled', defaultValue: false)
  bool get coverChargeEnabled;
  @override
  @JsonKey(ignore: true)
  _$$EventTicketDetailDtoImplCopyWith<_$EventTicketDetailDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
