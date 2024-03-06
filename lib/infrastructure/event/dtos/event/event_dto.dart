// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/dtos/address/address_dto.dart';
import '../../../core/dtos/asset/asset_dto.dart';
import '../../../core/dtos/bullet/bullet_dto.dart';
import '../../../core/dtos/faq/faq_dto.dart';
import '../artist/artist_dto.dart';
import '../category/category_dto.dart';
import '../pub/pub_dto.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class EventDto with _$EventDto {
  const factory EventDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'fullName', defaultValue: 'BE ISSUE') required String name,
    @JsonKey(name: 'coverImageUrl', defaultValue: '')
    required String coverImage,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'vicinity', defaultValue: '') required String vicinity,
    @JsonKey(name: 'distance', defaultValue: 0) required double distance,
    @JsonKey(name: 'startDate', defaultValue: '') required String startDate,
    @JsonKey(
      name: 'endDate',
    )
    String? endDate,
    @JsonKey(name: 'priceRangeStart', defaultValue: 0.0)
    required double priceRangeStart,
    @JsonKey(name: 'priceRangeEnd') double? priceRangeEnd,
    @JsonKey(name: 'lsd', defaultValue: []) required List<BulletDto> lsd,
    @JsonKey(name: 'ambience', defaultValue: [])
    required List<BulletDto> ambience,
    @JsonKey(name: 'foodAndBeverages', defaultValue: [])
    required List<BulletDto> foodAndBeverages,
    @JsonKey(name: 'termsAndConditions', defaultValue: [])
    required List<BulletDto> termsAndConditions,
    @JsonKey(name: 'faqs', defaultValue: []) required List<FAQDto> faqs,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name: 'totalCapacity', defaultValue: 0) required int totalCapacity,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
    required String eventStatus,
    @JsonKey(name: 'assets', defaultValue: []) required List<AssetDto> assets,
    @JsonKey(name: 'artists', defaultValue: [])
    required List<ArtistDto> artists,
    @JsonKey(name: 'address') AddressDto? address,
    @JsonKey(name: 'pub') PubDto? pub,
    @JsonKey(defaultValue: false) required bool isApplied,
    @JsonKey(defaultValue: false) required bool isLiked,
    @JsonKey(name: 'categories', defaultValue: [])required List<CategoryDto> categories,
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);
}
