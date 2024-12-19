import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/event_details/event_details_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/helpers/generic_helpers.dart';
import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../common/event_card.dart';
import '../common/event_card2.dart';
import '../core/open_maps_modal.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_button.dart';
import '../widgets/gradient_text.dart';
import 'core/book_tickets.dart';
import 'widgets/animated_event_description.dart';
import 'widgets/events_options_modal_sheet.dart';
import 'widgets/faq_section.dart';
import 'widgets/cancellation_policy.dart';

class EventDetailsScreen2 extends StatelessWidget {
  final String id;
  final String distance;
  final bool isVideoMute;
  final bool isMutedNotifierValue;

  const EventDetailsScreen2({
    super.key,
    required this.id,
    required this.distance,
    required this.isVideoMute,
    required this.isMutedNotifierValue,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    final ValueNotifier<bool> isMutedNotifier =
        ValueNotifier<bool>(isMutedNotifierValue);
    return BlocProvider(
      create: (context) => EventDetailsCubit(
        EventDetailsState.initial(
          apiBaseUrl: appConfig.serverUrl,
          eventDistance: distance,
        ),
      )..fetchEventDetails(id: int.parse(id)),
      child: EventDetailsScreenConsumer2(
        isVideoMute: isVideoMute,
        isMutedNotifier: isMutedNotifier,
      ),
    );
  }
}

class EventDetailsScreenConsumer2 extends StatelessWidget {
  final bool isVideoMute;
  final ValueNotifier<bool> isMutedNotifier;
  final MapController controller = MapController();

  List<String> tags = ["Rock", "DJ", "Music", "Concert"];

  EventDetailsScreenConsumer2(
      {super.key, required this.isVideoMute, required this.isMutedNotifier});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeData = Theme.of(context);
    return BlocConsumer<EventDetailsCubit, EventDetailsState>(
      listener: (context, state) {
        if (state.isOpenMapModal) {
          context
              .read<EventDetailsCubit>()
              .emitFromAnywhere(state: state.copyWith(isOpenMapModal: false));
          showModalBottomSheet(
              context: context,
              builder: (context) => OpenMapsModal(
                    title: state.event?.pub?.fullName ?? '',
                    coords: state.eventLocation!,
                    mapsOptions: state.mapsOptions,
                  ));
        }
      },
      builder: (context, state) {
        final event = state.event;

        print("categories: ${event?.categories}");
        return state.isLoading
            ? const Scaffold(body: EventDetailsShimmer())
            : Scaffold(
                bottomNavigationBar: event!.eventTicketCategories.isEmpty
                    ? const SizedBox()
                    : TicketBookingWidget(
                        endDate: event.endDate,
                        title: "Let's Go",
                        startDate: event.startDate, // Provide a default value
                        priceRangeStart: event.priceRangeStart ??
                            0, // Provide a default value
                        priceRangeEnd: event.priceRangeEnd ?? 0,
                        onClick: () {
                          AnalyticsService()
                              .logEvent(eventName: 'Lets go', paras: {
                            'eventId': state.event?.id,
                          });
                          navigator<NavigationService>().navigateTo(
                              UserRoutes.bookingRoute,
                              queryParams: {
                                'eventId': state.event?.id.toString() ?? "",
                              });
                        },
                      ),
                appBar: CustomAppBar(
                    title: '',
                    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                    scaffoldBackgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    leading: GestureDetector(
                        onTap: () {
                          navigator<NavigationService>().goBack();
                        },
                        child: Center(
                            child: SvgPicture.asset(
                          AssetConstants.arrowLeft,
                          width: 7.w,
                        ))),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          AnalyticsService()
                              .logEvent(eventName: 'share_event', paras: {
                            'event_id': state.event!.id.toString(),
                          });

                          String formattedMessage =
                              GenericHelpers().formatEventShareMessage(
                            eventName: state.event!.name,
                            artists: state.event!.artists,
                            eventDateTime:
                                DateTime.parse(state.event!.startDate),
                            eventLocation: state.event!.address!.vicinity,
                            eventCategory: AppConstants.event,
                            eventId: state.event!.id.toString(),
                          );

                          Share.share(formattedMessage);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: SvgPicture.asset(AssetConstants.shareIcon2),
                        ),
                      )
                    ]),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventCard2(
                          vKey: event.id.toString(),
                          height: 45,
                          isVideoMute: isVideoMute,
                          isMutedNotifier: isMutedNotifier,
                          loadData: () {
                            if (state.event != null) {
                              context
                                  .read<EventDetailsCubit>()
                                  .fetchEventDetails(
                                      id: state.event?.id ?? 0,
                                      isUpdatedDetails: true);
                            }
                          },
                          distance: state.eventDistance,
                          event: event,
                          isLiked: state.isEventLiked,
                          onLike: () {
                            context
                                .read<EventDetailsCubit>()
                                .onEventLikedUnliked(eventId: event.id);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rock',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(' • '),
                            Text('English',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                            Text(' • '),
                            Text('12+',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                            Text(' • '),
                            Text(
                                StringExtension.durationRange(
                                    state.event!.startDate,
                                    state.event!.endDate ?? ''),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              showShareBottomSheet(context, state);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.5.h, vertical: 2.h),
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: colorScheme.surfaceVariant,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(AssetConstants.giftIcon),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Share Experiences, earn discount!",
                                        style: TextStyle(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        "Share this experiences, and earn discounts",
                                        style: TextStyle(
                                            color: colorScheme.onTertiary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.5.sp),
                                      )
                                    ],
                                  ),
                                  SvgPicture.asset(AssetConstants.arrowRight)
                                ],
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.5.h, vertical: 2.h),
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.event!.categories.isNotEmpty) ...[
                                Row(
                                  children: state.event!.categories
                                      .map((tag) => Container(
                                          height: 3.3.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          margin: EdgeInsets.only(right: 1.w),
                                          decoration: BoxDecoration(
                                              // color: colorScheme.surfaceVariant,
                                              // gradient: RadialGradient(
                                              //     radius: 1.7,
                                              //     colors: [
                                              //       Color(0xff111111),
                                              //       Color(0xff2c2c2c),
                                              //     ]),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Color(0xff4d4d4d),
                                                  width: 1.px)),
                                          child: Center(
                                            child: Text(tag.name,
                                                style: TextStyle(
                                                    color:
                                                        colorScheme.background,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )))
                                      .toList(),
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                              Text(
                                'About the event',
                                style: TextStyle(
                                    color: colorScheme.background,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              // TODO: about the event
                              AnimatedEventDescription(
                                  description: state.event!.description),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                height: 32.21.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xff212121),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 2.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          AnalyticsService().logEvent(
                                              eventName: 'view_club',
                                              paras: {
                                                'club_id': state.event!.pub!.id
                                                    .toString(),
                                              });

                                          navigator<NavigationService>()
                                              .navigateTo(
                                                  UserRoutes.clubProfileRoute,
                                                  queryParams: {
                                                'id': state.event!.pub!.id
                                                    .toString()
                                              });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50.w,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 4.5.w,
                                                    backgroundImage: CachedNetworkImageProvider(
                                                        CustomImageProvider
                                                            .getImageUrl(
                                                                state.event!.pub
                                                                        ?.logo ??
                                                                    "",
                                                                // widget.event.pub?.coverImageUrl ?? '',
                                                                ImageType
                                                                    .profile)),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          state.event!.pub!
                                                              .fullName,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: themeData
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  color: themeData
                                                                      .colorScheme
                                                                      .background,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      16.5.sp),
                                                        ),
                                                        Text(
                                                          state.event?.pub?.completedEventsCount !=
                                                                      null &&
                                                                  state
                                                                          .event!
                                                                          .pub!
                                                                          .completedEventsCount! >
                                                                      0
                                                              ? "${state.event!.pub!.completedEventsCount}+ events hosted"
                                                              : "${state.event?.pub?.completedEventsCount ?? 0} event hosted",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: themeData
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14.sp,
                                                            color: themeData
                                                                .colorScheme
                                                                .background,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                AssetConstants.arrowRight),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 23.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        // color: colorScheme.primary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: GridView.custom(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        //  dragStartBehavior: DragStartBehavior.down,
                                        scrollDirection: Axis.horizontal,

                                        gridDelegate: SliverQuiltedGridDelegate(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 1.9.w,
                                          crossAxisSpacing: 1.h,
                                          repeatPattern:
                                              QuiltedGridRepeatPattern.inverted,
                                          pattern: const [
                                            QuiltedGridTile(2, 2),
                                            QuiltedGridTile(1, 1),
                                          ],
                                        ),
                                        childrenDelegate:
                                            SliverChildBuilderDelegate(
                                                childCount: state
                                                    .pubassetsForTheEvent
                                                    .length,
                                                (context, index) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        navigator<
                                                                NavigationService>()
                                                            .navigateTo(
                                                          UserRoutes
                                                              .mediaViewerWidgetScreen,
                                                          queryParams: {
                                                            'type': state
                                                                    .pubassetsForTheEvent[
                                                                        index]
                                                                    .type
                                                                    ?.toString() ??
                                                                '',
                                                            'url': state
                                                                    .pubassetsForTheEvent[
                                                                        index]
                                                                    .url ??
                                                                '',
                                                            'pubId': state.event
                                                                    ?.pub?.id
                                                                    ?.toString() ??
                                                                '',
                                                            'currentIndex':
                                                                index
                                                                    .toString(),
                                                            'assets':
                                                                jsonEncode(
                                                              state.pubassetsForTheEvent
                                                                      .map((asset) =>
                                                                          asset
                                                                              .toJson())
                                                                      .toList() ??
                                                                  [],
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: state
                                                                  .pubassetsForTheEvent[
                                                                      index]
                                                                  .type !=
                                                              MediaType.VIDEO
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  image: DecorationImage(
                                                                      image: CachedNetworkImageProvider(CustomImageProvider.getImageUrl(
                                                                          state
                                                                              .pubassetsForTheEvent[
                                                                                  index]
                                                                              .url,
                                                                          ImageType
                                                                              .other)),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            )
                                                          : ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: state.pubassetsForTheEvent[index]?.thumbnail !=
                                                                            null &&
                                                                        state
                                                                            .pubassetsForTheEvent[
                                                                                index]!
                                                                            .thumbnail
                                                                            .isNotEmpty
                                                                    ? state
                                                                        .pubassetsForTheEvent[
                                                                            index]!
                                                                        .thumbnail
                                                                    : 'https://res.cloudinary.com/dltfyyjib/image/upload/v1727071693/iqdj1ow7d1quudbkk5bw.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                    )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetConstants.locationIcon,
                                      color: colorScheme.inversePrimary,
                                      height: 21.sp,
                                      width: 21.sp),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          state.event?.address?.vicinity ?? '',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: colorScheme.background,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          '${(state.event?.distance ?? 0) <= 0 ? state.eventDistance : (state.event?.distance ?? 0) > 1000 ? ((state.event?.distance ?? 0) / 1000).toStringAsFixed(1) + 'km' : (state.event?.distance ?? 0).toStringAsFixed(0) + 'm'} away.',
                                          style: TextStyle(
                                              color: colorScheme.onPrimary,
                                              fontSize: 14.sp)),
                                    ],
                                  )
                                ],
                              ),

                              //add map here

                              Container(
                                width: 100.w,
                                height: 21.05.h,
                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FlutterMap(
                                    mapController: controller,
                                    options: MapOptions(
                                      onTap: (tapPosition, point) {
                                        context
                                            .read<EventDetailsCubit>()
                                            .viewOnMaps(
                                                lat:
                                                    state.event?.address?.lat ??
                                                        0,
                                                long:
                                                    state.event?.address?.lng ??
                                                        0,
                                                isAndroid: Platform.isAndroid,
                                                eventTitle: state
                                                        .event?.pub?.fullName ??
                                                    '');
                                      },
                                      interactionOptions: InteractionOptions(
                                          flags: InteractiveFlag.none),
                                      initialCenter: LatLng(
                                        state.event?.address?.lat ?? 0,
                                        state.event?.address?.lng ?? 0,
                                      ),
                                      initialZoom: 15,
                                    ),
                                    children: [
                                      TileLayer(
                                          urlTemplate:
                                              "https://api.mapbox.com/styles/v1/anshyyy/clxu4z36q007701pfac8883yt/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5zaHl5eSIsImEiOiJjbHh0OHZuZ2gwenVoMnFzZTRrbjB2aDd1In0.LGPu0T-DYFNO7QiIuu20nQ"),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: LatLng(
                                              state.event?.address?.lat ?? 0,
                                              state.event?.address?.lng ?? 0,
                                            ),
                                            width: 40,
                                            height: 40,
                                            alignment: Alignment.topCenter,
                                            child: Icon(
                                              Icons.location_pin,
                                              color: Colors.red.shade700,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              if (state.event?.artists != null &&
                                  state.event!.artists!.isNotEmpty) ...[
                                Text(
                                  'Performing Artists',
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                    height: 19.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.event?.artists?.length ?? 0,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        var artist =
                                            state.event?.artists?[index];

                                        return InkWell(
                                            onTap: () {
                                              AnalyticsService().logEvent(
                                                  eventName: 'view_artist',
                                                  paras: {
                                                    'artist_id':
                                                        artist!.id.toString(),
                                                  });

                                              if (artist.socialMediaLinks !=
                                                      null &&
                                                  artist.socialMediaLinks!
                                                      .isNotEmpty) {
                                                if (artist.socialMediaLinks!
                                                        .length ==
                                                    1) {
                                                  _launchUrl(artist
                                                      .socialMediaLinks!
                                                      .values
                                                      .first);
                                                } else {
                                                  showSocialMediaBottomSheet(
                                                      context,
                                                      artist.socialMediaLinks!);
                                                }
                                              } else {
                                                // Handle case when there are no social media links
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'No social media links available')),
                                                );
                                              }
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 2.w),
                                                  padding: EdgeInsets.all(2.w),
                                                  height:
                                                      13.h, //   124,// 14.h,
                                                  width: 13.h, // 124,// 14.h,
                                                  decoration: BoxDecoration(
                                                    color: colorScheme
                                                        .surfaceVariant,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.w),
                                                    image: DecorationImage(
                                                      image: CachedNetworkImageProvider(
                                                          artist?.coverImage ??
                                                              ''),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  artist?.fullName ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: colorScheme
                                                          .background,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                Text(
                                                  artist?.description
                                                              .isNotEmpty ??
                                                          false
                                                      ? artist?.description ??
                                                          ''
                                                      : 'DJ',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: colorScheme
                                                          .background
                                                          .withOpacity(0.6),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ));
                                      },
                                    ))
                              ]
                            ],
                          ),
                        ),
                        if (state.event?.eventActivities != null &&
                            state.event!.eventActivities.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.only(left: 0.4.h),
                            child: Text(
                              'Activities',
                              style: TextStyle(
                                  color: colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 20.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.event?.eventActivities.length ?? 0,
                              itemBuilder: (context, index) {
                                final eventActivity =
                                    state.event?.eventActivities[index];
                                return Padding(
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 1.h),
                                            height: 15.78.h,
                                            width: 55.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: CachedNetworkImageProvider(
                                                        CustomImageProvider
                                                            .getImageUrl(
                                                                eventActivity
                                                                        ?.imageUrl ??
                                                                    '',
                                                                ImageType
                                                                    .profile)))),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            eventActivity?.name ?? '',
                                            style: TextStyle(
                                                color: colorScheme.background,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ]));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                        if (state.event?.eventRules != null &&
                            state.event!.eventRules.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.only(left: 0.4.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rules',
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          color: colorScheme.onPrimary,
                                          fontSize: 14.sp),
                                    ),
                                    SvgPicture.asset(AssetConstants.arrowRight)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 14.73.h,
                            width: 100.w,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.event?.eventRules.length ?? 0,
                              itemBuilder: (context, index) {
                                final rule = state.event?.eventRules[index];
                                print(rule);
                                return Padding(
                                    padding: EdgeInsets.zero,
                                    child: Column(children: [
                                      RulesContainer(
                                          ruleName: rule?.name ?? '',
                                          isSelected: rule?.isAllowed ?? true,
                                          ruleImage:
                                              AssetConstants.dressRuleIcon),
                                      SizedBox(height: 1.h),
                                      Row(

                                          //  crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              rule?.name ?? '',
                                              style: TextStyle(
                                                  color: colorScheme.background,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ])
                                    ]));
                              },
                            ),
                          ),
                        ],
                        if (state.event!.cancellationPolicy.isNotEmpty) ...[
                          Text(
                            'Cancellation Policy',
                            style: TextStyle(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.black.withOpacity(0.2),
                                isScrollControlled: true,
                                builder: (context) =>
                                    CancellationPolicyBottomSheet(
                                        policy:
                                            state.event?.cancellationPolicy ??
                                                ''),
                              );
                            },
                            child: Row(children: [
                              SizedBox(
                                  width: 90.w,
                                  child: Text(
                                    state.event?.cancellationPolicy ?? '',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.8),
                                      fontSize: 16.sp,
                                    ),
                                  )),
                              SvgPicture.asset(AssetConstants.arrowRight)
                            ]),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                        if (state.event?.faqs != null &&
                            state.event!.faqs!.isNotEmpty) ...[
                          Divider(
                            color: colorScheme.background.withOpacity(0.2),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          FAQSection(faqs: state.event?.faqs ?? []),
                        ],
                        SizedBox(
                          height: 1.h,
                        ),
                        Divider(
                          color: colorScheme.background.withOpacity(0.2),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        if ((state.event?.termsAndConditions.isNotEmpty) ??
                            false) ...[
                          Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              color: colorScheme.background,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          AnimatedEventDescription(
                              description:
                                  "Musk was born in Pretoria, South Africa, and briefly attended the University of Pretoria before immigrating to Canada at the age of 18, acquiring citizenship through his Canadian-born mother. Two years later, he matriculated at Queen's University at Kingston in Canada. Musk later transferred to the University of Pennsylvania and received bachelor's degrees in economics and physics. He moved to California in 1995 to attend Stanford University but never enrolled in classes, and with his brother Kimbal co-founded the online city guide software company Zip2. The startup was acquired by Compaq for 307 million in 1999. That same year, Musk co-founded X.com, a direct bank. X.com merged with Confinity in 2000 to form PayPal. In 2002, Musk acquired US citizenship, and that October eBay acquired PayPal for 1.5 billion. Using 100 million of the money he made from the sale of PayPal."),
                        ]
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  void showSocialMediaBottomSheet(
      BuildContext context, Map<String, String> links) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 10.w,
                  height: 0.5.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              // Title
              Text(
                'Connect with Artist',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),

              // Social media links
              ...links.entries.map(
                (entry) {
                  String url = entry.value;
                  if (url.startsWith('@')) url = url.substring(1);
                  String username = url.split('/').last;
                  if (username.isEmpty) {
                    username = url.split('/')[url.split('/').length - 2];
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _launchUrl(url);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1.5.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: _getSocialMediaIcon(entry.key),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(0.6),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  '@$username',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        );
      },
    );
  }

  void showShareBottomSheet(BuildContext context, EventDetailsState state) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 10.w,
                        height: 0.5.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Center(
                        child: Text(
                      "Share and Earn",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp),
                    )),
                    SvgPicture.asset(
                      AssetConstants.giftIcon,
                      width: 127,
                      height: 127,
                    ),
                    Text(
                      "When you share an event\n with your friends",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "This is what you both get...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 1.h),

                    Row(children: [
                      Container(
                        margin: EdgeInsets.only(right: 1.h),
                        height: 2.h,
                        width: 2.h,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "They receive \$8 to spend on Festa.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ]),
                    SizedBox(
                      height: 1.h,
                    ),

                    Row(children: [
                      Container(
                        margin: EdgeInsets.only(right: 1.h),
                        height: 2.h,
                        width: 2.h,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "When they make purchase, you earn \$8 too !.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ]),

                    SizedBox(height: 2.h),
                    GradientButton(
                        text: "Share the Event",
                        onTap: () {
                          AnalyticsService()
                              .logEvent(eventName: 'share_event', paras: {
                            'event_id': state.event!.id.toString(),
                          });

                          String formattedMessage =
                              GenericHelpers().formatEventShareMessage(
                            eventName: state.event!.name,
                            artists: state.event!.artists,
                            eventDateTime:
                                DateTime.parse(state.event!.startDate),
                            eventLocation: state.event!.address!.vicinity,
                            eventCategory: AppConstants.event,
                            eventId: state.event!.id.toString(),
                          );

                          Share.share(formattedMessage);
                        }),
                    SizedBox(height: 1.h),
                  ]));
        });
  }

  Widget _getSocialMediaIcon(String platform) {
    final iconPath = AssetConstants.socialMediaIcons[platform.toLowerCase()];

    if (iconPath != null) {
      if (iconPath.endsWith('.svg')) {
        return SvgPicture.asset(iconPath, width: 24, height: 24);
      } else {
        return Image.asset(iconPath, width: 24, height: 24);
      }
    }
    return Icon(Icons.link); // Fallback icon
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class EventDetailsShimmer extends StatelessWidget {
  const EventDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 45.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5.w)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 3.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(2.w)),
            ),
            SizedBox(
              height: 1.h,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    height: 5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2.w)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2.w)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2.w)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 2.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
                Container(
                  height: 2.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 2.h,
                  width: 65.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
                Container(
                  height: 2.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 2.h,
                  width: 65.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
                Container(
                  height: 2.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 4.5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(0.w)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 4.5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(0.w)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 4.5.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(0.w)),
            ),
          ],
        ),
      ),
    );
  }
}

class RulesContainer extends StatelessWidget {
  final String ruleName;
  final bool isSelected;
  final String ruleImage;
  const RulesContainer(
      {super.key,
      required this.ruleName,
      required this.isSelected,
      required this.ruleImage});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.5.h),
      margin: EdgeInsets.only(right: 1.h),
      height: 78,
      width: 109,
      decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(color: Color(0xff373737)),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(AssetConstants.tickIcon)],
          ),
          Center(child: SvgPicture.asset(ruleImage))
        ],
      ),
    );
  }
}
