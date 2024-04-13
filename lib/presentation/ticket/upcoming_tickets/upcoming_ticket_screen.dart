import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../ticket_ui_wiget.dart';

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
              child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
                height: 64.h,
                child: PageView.builder(
                  onPageChanged: (value) {
                    context.read<TicketCubit>().onPageChanged(value);
                  },
                  itemCount: state.userTickets!.upcomingTickets.length,
                  itemBuilder: (context, index) {
                    final current = state.userTickets!.upcomingTickets[index];
                    return TicketUiWidgget(ticket: current);
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


