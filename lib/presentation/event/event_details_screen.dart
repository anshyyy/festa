import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/event_details/event_details_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../common/event_card.dart';
import '../core/open_maps_modal.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_text.dart';
import 'core/book_tickets.dart';
import 'widgets/events_options_modal_sheet.dart';

class EventDetailsScreen extends StatelessWidget {
  final String id;
  final String distance;
  final bool isVideoMute;
  final bool isMutedNotifierValue;

  const EventDetailsScreen({
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
      child: EventDetailsScreenConsumer(
        isVideoMute: isVideoMute,
        isMutedNotifier: isMutedNotifier,
      ),
    );
  }
}

class EventDetailsScreenConsumer extends StatelessWidget {
  final bool isVideoMute;
  final ValueNotifier<bool> isMutedNotifier;
  EventDetailsScreenConsumer(
      {super.key, required this.isVideoMute, required this.isMutedNotifier});

  @override
  Widget build(BuildContext context) {
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
        (state);
        final event = state.event;
        final List<GlobalKey> tileKeys = [
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey()
        ];
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
                          navigator<NavigationService>().navigateTo(
                              UserRoutes.bookingRoute,
                              queryParams: {
                                'eventId': state.event?.id.toString() ?? "",
                              });
                        },
                      ),
                appBar: CustomAppBar(
                    title: event.name,
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
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => EventOptionsModalSheet(
                                eventStartDate:event.startDate,
                                eventDescription:event.description,
                                eventCompleteAddress:event.address?.completeAddress??'',
                                eventEndDate:event.endDate??'',
                                eventId: state.event?.id ?? 0,
                                eventName: state.event?.name ?? "",
                                artists: state.event?.artists ?? []),
                          ).then((v) {
                            context
                                .read<EventDetailsCubit>()
                                .updateArtists(artists: v['artists']);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: SvgPicture.asset(AssetConstants.threeDotsIcon),
                        ),
                      )
                    ]),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        child: EventCard(
                          vKey: event.id.toString(),
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
                      ),

                      GestureDetector(
                        onTap: () {
                          context.read<EventDetailsCubit>().viewOnMaps(
                              lat: state.event?.address?.lat ?? 0,
                              long: state.event?.address?.lng ?? 0,
                              isAndroid: Platform.isAndroid,
                              eventTitle: state.event?.pub?.fullName ?? '');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: GradientText(
                            text: EventDetailsScreenConstants.viewOnMaps,
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary
                            ],
                            textStyle:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      // description box
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ListTileTheme(
                          dense: true,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            onExpansionChanged: (value) {
                              //if (value) {
                              // Scrollable.ensureVisible(
                              //     tileKeys[0].currentContext!);
                              //}
                            },
                            iconColor: Theme.of(context).colorScheme.background,
                            collapsedIconColor:
                                Theme.of(context).colorScheme.background,
                            collapsedBackgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            title: Text(
                              EventScreenConstants.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 15.5.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.w600),
                            ),
                            key: tileKeys[0],
                            tilePadding: EdgeInsets.only(
                                right: 6.0.w,
                                left: 3.9.w,
                                top: 0.45.h,
                                bottom: 0.3.h),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5.w)
                                    .copyWith(bottom: 1.h),
                                child: Text(
                                  event.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 15.5.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 1.2.h),
                      // rules box

                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          onExpansionChanged: (value) async {
                            if (value) {
                              // Scrollable.ensureVisible(
                              //     tileKeys[4].currentContext!);
                              // await Future.delayed(
                              //     const Duration(milliseconds: 200));
                              // Scrollable.ensureVisible(
                              //     tileKeys[4].currentContext!);
                            }
                          },
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          collapsedBackgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          title: Text(
                            "Rules",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15.5.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600),
                          ),
                          key: tileKeys[4],
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: event.faqs.length,
                              itemBuilder: (context, index) {
                                final e = event.termsAndConditions[index];
                                return Padding(
                                  key: event.termsAndConditions.length - 1 ==
                                          index
                                      ? tileKeys[6]
                                      : null,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5.w)
                                          .copyWith(bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${(index + 1).toString()}. ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 15.5.sp,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.text,
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 15.5.sp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),

// FAQs box
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          onExpansionChanged: (value) async {
                            if (value) {
                              // Scrollable.ensureVisible(
                              //     tileKeys[7].currentContext!);
                              // await Future.delayed(
                              //     const Duration(milliseconds: 200));
                              // Scrollable.ensureVisible(
                              //     tileKeys[7].currentContext!);
                            }
                          },
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          collapsedBackgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          title: Text(
                            EventScreenConstants.fAQs,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                          key: tileKeys[7],
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: event.faqs.length,
                              itemBuilder: (context, index) {
                                final e = event.faqs[index];
                                return Padding(
                                  key: event.faqs.length - 1 == index
                                      ? tileKeys[8]
                                      : null,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5.w)
                                          .copyWith(bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${(index + 1).toString()}. ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 15.5.sp,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.question,
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 15.5.sp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    e.answer,
                                                    maxLines: 10,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontSize: 15.5.sp,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .background,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              );
      },
    );
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
