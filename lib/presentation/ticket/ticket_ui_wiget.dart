
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import 'upcoming_tickets/booking_description.dart';
import 'upcoming_tickets/event_description.dart';
import 'upcoming_tickets/ticket_painter.dart';

class TicketUiWidgget extends StatelessWidget {
  const TicketUiWidgget({
    super.key,
    required this.ticket,
  });

  final BookedTicketDetailsDto ticket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
      child: SizedBox(
        child: CustomPaint(
          painter: TicketPainter(
            gradientColor1:
                Theme.of(context).colorScheme.primaryContainer,
            borderColor: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.w, vertical: 4.w),
            child: Column(
              children: [
                EventDescription(
                  ticketDetails: ticket,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                 BookingDescription(
                  ticketDetails: ticket,
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}