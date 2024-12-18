import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../infrastructure/core/enum/ticket.enum.dart';
import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import '../../widgets/custom_appbar.dart';
import 'widgets/past_ticket.dart';
import 'widgets/past_ticket_review.dart';

class PastTicketScreen extends StatelessWidget {
  const PastTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => TicketCubit(TicketState.initial(
        razorPayApiKey: appConfig.razorPayApiKey,
        serverUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: CustomAppBar(
                title: TicketScreenConstants.pastTickets,
                scaffoldBackgroundColor:
                    Theme.of(context).colorScheme.background.withOpacity(.02),
                leading: GestureDetector(
                  onTap: () => navigator<NavigationService>().goBack(),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetConstants.closeIcon,
                      width: 7.w,
                    ),
                  ),
                ),
                actions: [],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
                child: Column(
                  children: [
                    // SizedBox(height: 2.h), // Spacing after appbar
                    TabBar(
                      labelColor: colorScheme.background,
                      unselectedLabelColor: Colors.grey.shade600,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.sp),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                      indicatorColor: colorScheme.primary,
                      dividerColor: Colors.transparent,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3,
                          color: colorScheme.primary,
                        ),
                      ),
                      tabs: [
                        Tab(text: 'All Tickets'),
                        Tab(text: 'Attended'),
                        Tab(text: 'Missed'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // All Tickets Tab
                          state.isLoading
                              ? ListView.builder(
                                  itemBuilder: (context, index) {
                                    return const TicketShimmerHistory();
                                  },
                                  itemCount: 4,
                                )
                              : state.userTickets == null ||
                                      state.userTickets!.bookedTicketsHistory
                                          .isEmpty
                                  ? _buildEmptyState(context)
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              var ticket = state.userTickets
                                                  ?.bookedTicketsHistory[index];

                                              bool is24HoursAndAttended = DateTime
                                                          .parse(ticket!
                                                              .eventDetails
                                                              .endDate!)
                                                      .isBefore(DateTime.now()
                                                          .add(const Duration(
                                                              hours: 24))) &&
                                                  ticket.checkInStatus ==
                                                      CheckinStatus
                                                          .Attended.value;

                                              return is24HoursAndAttended
                                                  ? PastTicketReview(
                                                      event:
                                                          ticket!.eventDetails,
                                                      onReview: () {},
                                                      onDetail: () {
                                                        navigator<NavigationService>().navigateTo(
                                                          UserRoutes.eventDetailsRoute,
                                                          queryParams: {
                                                            'id': ticket!.eventDetails.id.toString()
                                                          }
                                                        );
                                                      })
                                                  : PastTicket(ticket: ticket!);
                                            },
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                height: 1,
                                                color: Color(0xff171717),
                                              );
                                            },
                                            itemCount: state
                                                    .userTickets
                                                    ?.bookedTicketsHistory
                                                    .length ??
                                                0,
                                          ),
                                        )
                                      ],
                                    ),

                          // Attended Tab
                          _buildEmptyState(context),

                          // Missed Tab
                          _buildEmptyState(context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      height: 65.h,
      width: 100.w,
      color: Theme.of(context).colorScheme.surface.withOpacity(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetConstants.ticketIcon,
            height: 10.h,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'No Tickets',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class TicketShimmerHistory extends StatelessWidget {
  const TicketShimmerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!.withOpacity(0.5),
        highlightColor: Colors.grey[400]!.withOpacity(0.5),
        child: Container(
          margin: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
          height: 11.5.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
        ));
  }
}
