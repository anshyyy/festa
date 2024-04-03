import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import 'history_ticket_tile.dart';

class HistoryTicketScreen extends StatelessWidget {
  const HistoryTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 4.w),
          shrinkWrap: true,
          itemCount: state.userTickets!.bookedTicketsHistory.length,
          itemBuilder: (context, index) {
            final ticket = state.userTickets!.bookedTicketsHistory[index];
            return TicketHistoryTile(
              eventPoster: ticket.eventDetails.coverImage,
              eventTitle: ticket.eventDetails.name,
              // artist: ticket['artist'],
              // duration: ticket['duration'],
              // dominantColor: snapshot.hasData
              //     ? snapshot.data
              //     : Theme.of(context).primaryColor,
            );
          },
        );
      },
    );
  }
}
