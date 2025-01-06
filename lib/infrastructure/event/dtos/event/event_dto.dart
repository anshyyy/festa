// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../artist/dtos/artist/artist_dto.dart';
import '../../../core/dtos/address/address_dto.dart';
import '../../../core/dtos/asset/asset_dto.dart';
import '../../../core/dtos/bullet/bullet_dto.dart';
import '../../../core/dtos/cancellation_policy/cancellation_policy.dart';
import '../../../core/dtos/event_rules/event_rules.dart';
import '../../../core/dtos/faq/faq_dto.dart';
import '../../../core/dtos/tnc/terms_and_condition.dart';
import '../category/category_dto.dart';
import '../event_activity/event_activity.dart';
import '../event_ticket_category/event_ticket_category_dto.dart';
import '../pub/pub_dto.dart';
import '../social_media/social_media_dto.dart';

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
    required List<TermsAndCondition> termsAndConditions,
    @JsonKey(name: 'faqs', defaultValue: []) required List<FAQDto> faqs,
    @JsonKey(name: 'isPaid', defaultValue: false) required bool isPaid,
    @JsonKey(name: 'totalCapacity', defaultValue: 0) required int totalCapacity,
    @JsonKey(name: 'bookedSeats', defaultValue: 0) required int bookedSeats,
    @JsonKey(name: 'eventStatus', defaultValue: 'ACTIVE')
    required String eventStatus,
    @JsonKey(name: 'assets', defaultValue: []) required List<AssetDto> assets,
    @JsonKey(name: 'artists', defaultValue: [])    required List<ArtistProfileDto> artists,
    @JsonKey(name:'eventRules',defaultValue: []) required List<EventRules> eventRules,
    @JsonKey(name: 'address') AddressDto? address,    
    @JsonKey(name: 'pub') PubDto? pub,
    @JsonKey(defaultValue: false) required bool isApplied,
    @JsonKey(name:'cancellationPolicy') CancellationPolicy? cancellationPolicy,
    @JsonKey(name: 'isLiked', defaultValue: false) required bool isLiked,
    @JsonKey(name: 'isPaused', defaultValue: true) required bool isPaused,
    @JsonKey(name: 'expensiveRating', defaultValue: 0) required int expensiveRating,
    @JsonKey(name: 'category', defaultValue: [])required List<CategoryDto> categories,
    @JsonKey(name:'eventActivities',defaultValue: []) required List<EventActivity> eventActivities,
    @JsonKey(name: 'eventTicketCategories', defaultValue: [])required List<EventTicketCategoryDto> eventTicketCategories,
    @JsonKey(name: 'coverChargeEnabled',defaultValue: false) required bool coverChargeEnabled
 
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);
}
