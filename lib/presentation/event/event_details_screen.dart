import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/event_details/event_details_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../common/event_card.dart';
import '../widgets/custom_appbar.dart';

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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final event = state.event;
        return state.isLoading
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
                // bottomNavigationBar: Container(
                //   height: 100,
                //   padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                //   color: Theme.of(context).colorScheme.primaryContainer,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //                 StringExtension.formatDateTimeMedium(
                //                     DateTime.parse(event!.startDate)),
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodyMedium!
                //                     .copyWith(
                //                         fontWeight: FontWeight.w600,
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .background,
                //                         fontSize: 15.sp)),
                //             Row(
                //               children: [
                //                 Text(
                //                     '${event.priceRangeStart.toIndianRupeeString()} ',
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodyMedium!
                //                         .copyWith(
                //                             fontWeight: FontWeight.w600,
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .background,
                //                             fontSize: 15.sp)),
                //                 if (event.priceRangeEnd != null)
                //                   Text(
                //                       event.priceRangeEnd!
                //                           .toIndianRupeeString(),
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .bodyMedium!
                //                           .copyWith(
                //                               fontWeight: FontWeight.w600,
                //                               fontSize: 15.sp)),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       Expanded(
                //           child: GradientButton(
                //         text: EventDetailsScreenConstants.bookTheTickets,
                //         onTap: () {},
                //         textStyle: Theme.of(context)
                //             .textTheme
                //             .bodySmall!
                //             .copyWith(
                //               color: Theme.of(context).colorScheme.background,
                //               fontWeight: FontWeight.w600,
                //             ),
                //       ))
                //     ],
                //   ),
                // ),

                appBar: CustomAppBar(
                    title: event!.name,
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
                                const EventOptionsModalSheet(),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: SvgPicture.asset(AssetConstants.threeDotsIcon),
                        ),
                      )
                    ]),
                body: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventCard(event: event),
                        // GradientText(
                        //   text: EventDetailsScreenConstants.viewOnMaps,
                        //   colors: [
                        //     Theme.of(context).colorScheme.primary,
                        //     Theme.of(context).colorScheme.secondary
                        //   ],
                        //   textStyle:
                        //       Theme.of(context).textTheme.bodySmall!.copyWith(
                        //             fontWeight: FontWeight.w800,
                        //           ),
                        // ),

                        SizedBox(
                          height: 0.h,
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
                ),
              );
      },
    );
  }
}

class EventOptionsModalSheet extends StatelessWidget {
  const EventOptionsModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      height: 30.h,
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          EventOptionsTile(
            onTap: () {
              navigator<NavigationService>().goBack();
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const FollowArtistsModalSheet());
            },
            title: EventDetailsScreenConstants.followArtists,
            suffixIcon: SvgPicture.asset(
              AssetConstants.arrowRight,
            ),
          ),
          EventOptionsTile(title: EventDetailsScreenConstants.addToCalendar),
          // EventOptionsTile(title: EventDetailsScreenConstants.shareEvent),
          EventOptionsTile(title: EventDetailsScreenConstants.report),
        ],
      ),
    );
  }
}

class FollowArtistsModalSheet extends StatelessWidget {
  const FollowArtistsModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              EventDetailsScreenConstants.followArtists,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Theme.of(context).colorScheme.background),
            ),
            SvgPicture.asset(AssetConstants.closeIcon)
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: ArtistTile(),
            ),
          ),
        )
      ]),
    );
  }
}

class ArtistTile extends StatelessWidget {
  const ArtistTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 6.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mike Shinoda',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                  Text(
                    '@mikeshinoda',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        // fontSize: 17.sp
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
          height: 5.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text('Follow',
          
          style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
          )),
        )
      ],
    );
  }
}

class EventOptionsTile extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;

  const EventOptionsTile({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                prefixIcon ?? SizedBox(),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            suffixIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
