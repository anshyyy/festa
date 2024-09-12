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
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import '../../widgets/custom_appbar.dart';
import 'widgets/past_ticket.dart';
import 'widgets/past_ticket_review.dart';

class PastTicketScreen extends StatelessWidget {
  const PastTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
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
          return Scaffold(
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
              child: state.userTickets?.bookedTicketsHistory.length == 0
                  ? Container(
                      height: 65.h,
                      width: 100.w,
                      color:
                          Theme.of(context).colorScheme.surface.withOpacity(0),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              // Assuming state.userTickets?.bookedTicketsHistory is a list of tickets
                              var ticket = state
                                  .userTickets?.bookedTicketsHistory[index];

                              if (ticket == null) {
                                return TicketShimmerHistory();
                              }

                              // Get the event date from the ticket
                              DateTime eventDate = DateTime.parse(ticket.eventDetails.startDate??"");
                              
                              // (eventDate);
                              // ('${ticket.eventDetails.startDate}  ${ticket.eventDetails.endDate}');
                                   // Adjust according to your model
                              DateTime now = DateTime.now();

                              // Calculate the difference in hours
                              Duration difference = now.difference(eventDate);
                              bool isRecent = difference.inHours <= 24;

                              if (isRecent) {
                                return InkWell(
                                  onTap: () {
                                    navigator<NavigationService>().navigateTo(
                                      UserRoutes.ticketHistory,
                                      queryParams: {
                                        'ticket': jsonEncode(ticket.toJson())
                                      }, // Adjust according to your model
                                    );
                                  },
                                  child: PastTicketReview(event:ticket.eventDetails),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    // Add your navigation or any other action
                                  },
                                  child: PastTicket(
                                      ticket: ticket as BookedTicketDetailsDto),
                                );
                              }
                            },
                            separatorBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  height: 2,
                                  color: Color(0xff171717),
                                ),
                              );
                            },
                            itemCount: state
                                    .userTickets?.bookedTicketsHistory.length ??
                                4,
                          ),
                        )
                      ],
                    ),
            ),
          );
        },
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
          height: 11.5.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
        ));
  }
}
