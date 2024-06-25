import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../ticket_ui_wiget.dart';

class UpcomingTicketsScreen extends StatelessWidget {
  const UpcomingTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.userTickets!.upcomingTickets.isEmpty
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
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetsToImage(
                    controller: state.widgetsToImageController,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      height: 63.h,
                      child: PageView.builder(
                        onPageChanged: (value) {
                          context.read<TicketCubit>().onPageChanged(value);
                        },
                        itemCount: state.userTickets!.upcomingTickets.length,
                        itemBuilder: (context, index) {
                          final current =
                              state.userTickets!.upcomingTickets[index];
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
                                        ? Theme.of(context)
                                            .colorScheme
                                            .background
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
