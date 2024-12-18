import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/event_details/event_options/event_options_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../../infrastructure/event/dtos/artist/artist_dto.dart';
import '../../core/agree_to_block_modal.dart';
import '../../core/report_modal.dart';
import 'event_option_tile.dart';
import 'follow_artist_modalsheet.dart';

class EventOptionsModalSheet extends StatelessWidget {
  final int eventId;
  final String eventName;
  final List<ArtistProfileDto> artists;
  final String eventStartDate;
  final String eventEndDate;
  final String eventDescription;
  final String eventCompleteAddress;
  const EventOptionsModalSheet(
      {super.key,
      required this.eventId,
      required this.eventName,
      required this.artists,
      required this.eventDescription,
      required this.eventCompleteAddress,
      required this.eventEndDate,
      required this.eventStartDate});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => EventOptionsCubit(EventOptionsState.initial(
        eventId: eventId,
        serverUrl: appConfig.serverUrl,
      )),
      child: EventOptionsModalsheetConsumer(
        eventId: eventId,
        eventName: eventName,
        artists: artists,
        eventDescription: eventDescription,
        eventCompleteAddress: eventCompleteAddress,
        eventStartDate: eventStartDate,
        eventEndDate: eventEndDate,
      ),
    );
  }
}

class EventOptionsModalsheetConsumer extends StatelessWidget {
  final int eventId;
  final String eventName;
  final List<ArtistProfileDto> artists;
  final String eventStartDate,
      eventEndDate,
      eventDescription,
      eventCompleteAddress;
  const EventOptionsModalsheetConsumer(
      {super.key,
      required this.eventId,
      required this.artists,
      required this.eventName,
      required this.eventDescription,
      required this.eventCompleteAddress,
      required this.eventEndDate,
      required this.eventStartDate});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventOptionsCubit, EventOptionsState>(
      listener: (context, state) {
        if (state.goToHome) {
          navigator<NavigationService>()
              .navigateTo(UserRoutes.mainNavRoute, isClearStack: true);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                width: 12.w,
                height: .5.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              EventOptionsTile(
                prefixIcon: SvgPicture.asset(
                  AssetConstants.followIcon,
                  height: 5.w,
                ),
                onTap: () {
                  if (!state.isLoading) {
                    showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (context) =>
                                FollowArtistsModalSheet(artists: artists))
                        .then((v) {
                      // print(v);
                      navigator<NavigationService>()
                          .goBack(responseObject: {'artists': v['artists']});
                    });
                  }
                },
                title: EventDetailsScreenConstants.followArtists,
                suffixIcon: state.isLoading
                    ? Image.asset(
                        AssetConstants.bubbleLoader,
                        height: 3.5.h,
                      )
                    : SvgPicture.asset(
                        AssetConstants.arrowRight,
                      ),
              ),
              EventOptionsTile(
                  onTap: () {
                    if (state.isLoading) {
                      return;
                    }

                    // print(eventStartDate);
                    // print(eventEndDate);

                    // Parse UTC time and subtract 5 hours and 30 minutes (IST)
                    DateTime sd = DateTime.parse(eventStartDate)
                        .toUtc()
                        .subtract(Duration(hours: 5, minutes: 30));
                    print(
                        'Adjusted UTC Start Date: $sd'); // Show adjusted UTC time

                    DateTime ed = DateTime.parse(eventEndDate)
                        .toUtc()
                        .subtract(Duration(hours: 5, minutes: 30));
                    print(
                        'Adjusted UTC End Date: $ed'); // Show adjusted UTC time

                    // Prepare the event with the adjusted UTC times
                    final Event event = Event(
                      title: eventName ?? "",
                      description: eventDescription ?? "",
                      location: eventCompleteAddress ?? '',
                      startDate: sd, // Pass the pre-adjusted UTC time
                      endDate: ed, // Pass the pre-adjusted UTC time
                      iosParams: const IOSParams(
                        reminder: Duration(hours: 1),
                        url: 'https://www.festa.com',
                      ),
                      androidParams: const AndroidParams(
                        emailInvites: [],
                      ),
                    );

                    // Add the event to the calendar
                    Add2Calendar.addEvent2Cal(event);
                    Navigator.pop(context);
                  },
                  prefixIcon: SvgPicture.asset(
                    AssetConstants.addToCalendar,
                    height: 5.w,
                  ),
                  title: EventDetailsScreenConstants.addToCalendar),
              // EventOptionsTile(title: EventDetailsScreenConstants.shareEvent),
              EventOptionsTile(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                    showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return ReportModalSheet(
                            id: eventId.toString(),
                            name: eventName,
                            type: 'event',
                          );
                        });
                  },
                  prefixIcon: SvgPicture.asset(
                    AssetConstants.gradientReport,
                    height: 5.w,
                  ),
                  title: EventDetailsScreenConstants.report),

              EventOptionsTile(
                prefixIcon: SvgPicture.asset(
                  AssetConstants.userBlock,
                  height: 5.w,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AgreeToBlock(
                      name: eventName,
                    ),
                  ).then((value) {
                    if (value != null) {
                      context.read<EventOptionsCubit>().blockEvent();
                    }
                  });
                },
                title: 'Block',
                suffixIcon: SvgPicture.asset(
                  AssetConstants.arrowRight,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          )
              // : Column(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Container(
              //         width: 12.w,
              //         height: .5.h,
              //         decoration: BoxDecoration(
              //           color:
              //               Theme.of(context).colorScheme.secondaryContainer,
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //       ),
              //       Shimmer.fromColors(
              //         baseColor: Colors.grey[300]!.withOpacity(0.5),
              //         highlightColor: Colors.grey[400]!.withOpacity(0.5),
              //         child: Container(
              //           margin: EdgeInsets.only(bottom: 1.h),
              //           child: Column(
              //             children: [
              //               SizedBox(
              //                 height: 2.h,
              //               ),
              //               const MenuShimmer(),
              //               SizedBox(
              //                 height: 2.h,
              //               ),
              //               const MenuShimmer(),
              //               SizedBox(
              //                 height: 2.h,
              //               ),
              //               const MenuShimmer(),
              //               SizedBox(
              //                 height: 2.h,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              ),
        );
      },
    );
  }
}

class MenuShimmer extends StatelessWidget {
  const MenuShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5.w,
          height: 5.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 2.h,
        ),
        Container(
          width: 70.w,
          height: 4.w,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(1.w)),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
