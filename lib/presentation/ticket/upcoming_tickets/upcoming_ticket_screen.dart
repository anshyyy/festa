import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../application/ticket/ticket_cubit.dart';
import 'booking_description.dart';
import 'event_description.dart';
import 'ticket_painter.dart';

class UpcomingTicketsScreen extends StatelessWidget {
  const UpcomingTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetsToImage(
          controller: state.widgetsToImageController,
              child: SizedBox(
                height: 64.h,
                child: PageView.builder(
                  onPageChanged: (value) {
                    context.read<TicketCubit>().onPageChanged(value);
                  },
                  itemCount: state.userTickets!.upcomingTickets.length,
                  itemBuilder: (context, index) {
                    final current = state.userTickets!.upcomingTickets[index];
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
                                  ticketDetails: current,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                 BookingDescription(
                                  ticketDetails: current,
                                 )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 0.h,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  state.userTickets!.upcomingTickets.length,
                  (dotIndex) => Padding(
                        padding: EdgeInsets.all(.7.w),
                        child: Container(
                          height: 1.5.h,
                          width: 1.5.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: dotIndex == state.currentPage
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer),
                        ),
                      )),
            ),
          ],
        );
      },
    );
  }
}
