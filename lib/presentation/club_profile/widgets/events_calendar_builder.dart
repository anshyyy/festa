import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/club_profile/events_calendar/events_calendar_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import 'event_calendar.dart';

class EventsCalendarBuilder extends StatelessWidget {
  final int clubId;
  const EventsCalendarBuilder({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => EventsCalendarCubit(
        EventsCalendarState.initial(
          clubId: clubId,
          serverUrl: appConfig.serverUrl,
        ),
      )..init(),
      child: const EventsCalendarBuilderConsumer(),
    );
  }
}

class EventsCalendarBuilderConsumer extends StatelessWidget {
  const EventsCalendarBuilderConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCalendarCubit, EventsCalendarState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.pubEventsClubbed == null || state.pubEventsClubbed!.eventMonths.isEmpty) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: Text("No events available")),
          );
        }

        final eventMonths = state.pubEventsClubbed!.eventMonths;
        final firstMonth = eventMonths.first;
        final lastMonth = eventMonths.last;

        return EventCalender(
          lsOfEvents: state.pubEventsClubbed?.events ?? [],
          startDate: DateTime.utc(DateTime.now().year, firstMonth + 1, 1),
          endDate: DateTime.utc(DateTime.now().year, DateTime.now().month + 3, 1).subtract(Duration(days: 1)),
        );  
      },
    );
  }
}
