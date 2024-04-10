import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/event_details/event_details_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../common/event_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_text.dart';
import 'core/book_tickets.dart';
import 'widgets/events_options_modal_sheet.dart';

class EventDetailsScreen extends StatelessWidget {
  final String id;
  const EventDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => EventDetailsCubit(
        EventDetailsState.initial(
          apiBaseUrl: appConfig.serverUrl,
        ),
      )..fetchEventDetails(id: int.parse(id)),
      child: const EventDetailsScreenConsumer(),
    );
  }
}

class EventDetailsScreenConsumer extends StatelessWidget {
  const EventDetailsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventDetailsCubit, EventDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final event = state.event;
        return state.isLoading
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
                bottomNavigationBar: event!.eventTicketCategories.isEmpty
                    ? const SizedBox()
                    : TicketBookingWidget(
                        startDate: event.startDate,
                        priceRangeStart: event.priceRangeStart,
                        priceRangeEnd: event.priceRangeEnd!,
                        onClick: () {
                          Provider.of<AppStateNotifier>(context, listen: false)
                              .toggleBottomNav(showBottomNav: false);
                          navigator<NavigationService>().navigateTo(
                              UserRoutes.bookingRoute,
                              queryParams: {
                                'eventId': state.event!.id.toString(),
                              }).then((value) {
                            Provider.of<AppStateNotifier>(context,
                                    listen: false)
                                .toggleBottomNav(showBottomNav: true);
                          });
                        },
                      ),
                appBar: CustomAppBar(
                    title: event.name,
                    leading: GestureDetector(
                        onTap: () => navigator<NavigationService>().goBack(),
                        child: Center(
                            child: SvgPicture.asset(AssetConstants.arrowLeft))),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                              EventOptionsModalSheet(artists: event.artists,),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: SvgPicture.asset(AssetConstants.threeDotsIcon),
                        ),
                      )
                    ]),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: EventCard(
                          event: event,
                          isLiked: state.isEventLiked,
                          onLike: () {
                            context
                                .read<EventDetailsCubit>()
                                .onEventLikedUnliked(eventId: event.id);
                          },
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
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
                
                      SizedBox(
                        height: 2.h,
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ListTileTheme(
                          dense: true,
                          child: ExpansionTile(
                            iconColor:
                                Theme.of(context).colorScheme.background,
                            collapsedIconColor:
                                Theme.of(context).colorScheme.background,
                            collapsedBackgroundColor: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                            title: Text(
                              EventScreenConstants.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.w600),
                            ),
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 3.5.w)
                                        .copyWith(bottom: 1.h),
                                child: Text(
                                  event.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
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
                      const SizedBox(
                        height: 10,
                      ),
                      // LSD
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          collapsedBackgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          title: Text(
                            EventScreenConstants.lsd,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600),
                          ),
                          children: [
                            ...event.lsd.map((e) {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 3.5.w)
                                        .copyWith(bottom: 1.h),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AssetConstants.extras[e.type]!,
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      e.text,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    )),
                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                
                      // Ambience
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          collapsedBackgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          title: Text(
                            EventScreenConstants.ambience,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600),
                          ),
                          children: [
                            ...event.ambience.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3.5.w,
                                ).copyWith(bottom: 1.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      e.text,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    )),
                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                
                      // Food
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          collapsedBackgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          title: Text(
                            EventScreenConstants.foodAndBeverages,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600),
                          ),
                          children: [
                            ...event.foodAndBeverages.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3.5.w,
                                ).copyWith(bottom: 1.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetConstants.extras[e.type]!,
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      e.text,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    )),
                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                
                      // Food
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
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
                                    fontWeight: FontWeight.w600),
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: event.faqs.length,
                              itemBuilder: (context, index) {
                                final e = event.faqs[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.5.w,
                                  ).copyWith(bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${(index + 1).toString()}. ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
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
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    fontWeight:
                                                        FontWeight.w600,
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
                                                          color: Theme.of(
                                                                  context)
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
