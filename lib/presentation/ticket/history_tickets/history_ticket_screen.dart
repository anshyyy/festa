import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../upcoming_tickets/event_description.dart';
import '../upcoming_tickets/ticket_painter.dart';
import '../upcoming_tickets/transaction_details.dart';
import 'history_ticket_tile.dart';

class HistoryTicketScreen extends StatelessWidget {
  const HistoryTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.userTickets!.bookedTicketsHistory.isEmpty
            ? Container(
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
              )
            : state.shoHistoryTicketDetails
                ? Stack(
                    children: [
                      SizedBox(
                        height: 65.h,
                        width: 95.w,
                        child: CustomPaint(
                          painter: TicketPainter(
                            gradientColor1:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 4.w),
                            child: Column(
                              children: [
                                EventDescription(
                                  ticketDetails: state.historyTicket!,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Expanded(
                                    child: TransactionDetails(
                                  ticketDetails: state.historyTicket!,
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2.w,
                        right: 2.w,
                        child: Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: GestureDetector(
                              onTap: () {
                                context.read<TicketCubit>().hideHistoryTicket();
                              },
                              child: Center(
                                  child: SvgPicture.asset(
                                      AssetConstants.arrowLeft, width: 7.w))),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.only(top: 4.w),
                    shrinkWrap: true,
                    itemCount: state.userTickets!.bookedTicketsHistory.length,
                    itemBuilder: (context, index) {
                      final ticket =
                          state.userTickets!.bookedTicketsHistory[index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<TicketCubit>()
                              .showHistoryTicket(ticket: ticket);
                        },
                        child: TicketHistoryTile(
                          eventPoster: ticket.eventDetails.coverImage,
                          eventTitle: ticket.eventDetails.name,
                        ),
                      );
                    },
                  );
      },
    );
  }
}
