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
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../core/agree_to_block_modal.dart';
import '../../core/report_modal.dart';
import 'event_option_tile.dart';
import 'follow_artist_modalsheet.dart';

class EventOptionsModalSheet extends StatelessWidget {
  final int eventId;
  const EventOptionsModalSheet({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => EventOptionsCubit(EventOptionsState.initial(
        eventId: eventId,
        serverUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: const EventOptionsModalsheetConsumer(),
    );
  }
}

class EventOptionsModalsheetConsumer extends StatelessWidget {
  const EventOptionsModalsheetConsumer({
    super.key,
  });

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
            child: !state.isLoading
                ? Column(
                    children: [
                      Container(
                        width: 12.w,
                        height: .5.h,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                          navigator<NavigationService>().goBack();
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => FollowArtistsModalSheet(
                                    artists: state.event!.artists,
                                  ));
                        },
                        title: EventDetailsScreenConstants.followArtists,
                        suffixIcon: SvgPicture.asset(
                          AssetConstants.arrowRight,
                        ),
                      ),
                      EventOptionsTile(
                          onTap: () {
                            final Event event = Event(
                              title: state.event!.name,
                              description: state.event!.description,
                              location: state.event!.address!.completeAddress,
                              startDate: DateTime.parse(state.event!.startDate)
                                  .toLocal(),
                              endDate: DateTime.parse(state.event!.endDate!)
                                  .toLocal(),
                              iosParams: const IOSParams(
                                reminder: Duration(hours: 1),
                                url: 'https://www.festa.com',
                              ),
                              androidParams: const AndroidParams(
                                emailInvites: [],
                              ),
                            );
                            Add2Calendar.addEvent2Cal(event);
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
                                    id: state.eventId.toString(),
                                    name: state.event!.name,
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
                              name: state.event!.name,
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
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 12.w,
                        height: .5.h,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!.withOpacity(0.5),
                        highlightColor: Colors.grey[400]!.withOpacity(0.5),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              const MenuShimmer(),
                              SizedBox(
                                height: 2.h,
                              ),
                              const MenuShimmer(),
                              SizedBox(
                                height: 2.h,
                              ),
                              const MenuShimmer(),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
