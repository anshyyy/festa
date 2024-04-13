import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../ticket_ui_wiget.dart';
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
                color: Theme.of(context).colorScheme.surface,
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
            : ListView.builder(
                padding: EdgeInsets.only(top: 4.w),
                shrinkWrap: true,
                itemCount: state.userTickets!.bookedTicketsHistory.length,
                itemBuilder: (context, index) {
                  final ticket = state.userTickets!.bookedTicketsHistory[index];
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<TicketCubit>()
                          .showHistoryTicket(ticket: ticket);
                    },
                    child: TicketHistoryTile(
                      eventPoster: ticket.eventDetails.coverImage,
                      eventTitle: ticket.eventDetails.name,
                      // artist: ticket['artist'],
                      // duration: ticket['duration'],
                      // dominantColor: snapshot.hasData
                      //     ? snapshot.data
                      //     : Theme.of(context).primaryColor,
                    ),
                  );
                },
              );
      },
    );
  }
}
