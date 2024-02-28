import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'booking_description.dart';
import 'event_description.dart';
import 'ticket_painter.dart';

class UpcomingTicketsScreen extends StatelessWidget {
  const UpcomingTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 61.3.h,
          child: CustomPaint(
            painter: TicketPainter(
                gradientColor1: Theme.of(context).colorScheme.primaryContainer,
                borderColor:Theme.of(context).colorScheme.secondary,
                ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical:4.w),
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
        ),
        SizedBox(height: 1.h,),
        Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (dotIndex) => Padding(
                            padding: EdgeInsets.all(.7.w),
                            child: Container(
                              height: 1.5.h,
                              width: 1.5.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dotIndex == 1
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                            ),
                          )),
                ),
      ],
    );
  }
}
