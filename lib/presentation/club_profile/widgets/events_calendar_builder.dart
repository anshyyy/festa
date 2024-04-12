import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        return state.isLoading 
            ? Container(
                color: Theme.of(context).colorScheme.surface,
                child: const Center(child: CircularProgressIndicator()))
            :   ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: state.pubEventsClubbed == null ? 0  : state.pubEventsClubbed!.eventMonths.length,
                itemBuilder: (context, index) {
                  final currentMonth =
                      state.pubEventsClubbed!.eventMonths[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: .5.h),
                    child: EventCalender(
                        eventId: state.pubEventsClubbed!.events.isNotEmpty
                            ? state.pubEventsClubbed!.events[0].id
                            : null,
                        startDate: DateTime.utc(
                            DateTime.now().year, currentMonth + 1, 1),
                        endDate: DateTime.utc(
                            DateTime.now().year, currentMonth + 1 + index, 31)),
                  );
                });
      },
    );
  }
}
