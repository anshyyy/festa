import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'booking_description.dart';
import 'event_description.dart';
import 'ticket_painter.dart';

class UpcomingTicketsScreen extends StatelessWidget {
  const UpcomingTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: CustomPaint(
        painter: TicketPainter(
            gradientColor1: Theme.of(context).colorScheme.primaryContainer),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical:3.5.w),
          child: Column(
            children: [
              const EventDescription(),
              SizedBox(
                height: 2.5.h,
              ),
              const BookingDescription()
            ],
          ),
        ),
      ),
    );
  }
}
