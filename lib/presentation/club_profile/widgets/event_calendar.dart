import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../application/club_profile/events_calendar/events_calendar_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
class EventCalender extends StatelessWidget {
  final DateTime startDate;
  final int? eventId;
  final DateTime endDate;
  const EventCalender(
      {super.key,
      this.eventId,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCalendarCubit, EventsCalendarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: TableCalendar(
              availableGestures: AvailableGestures.none,
              firstDay: startDate,
              lastDay: endDate,
              focusedDay: startDate,
              headerStyle: HeaderStyle(
                titleTextStyle:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: false,
                outsideDaysVisible: false,
              ),
              daysOfWeekHeight: 2.5.h,
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16.5.sp),
                  weekendStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          fontWeight: FontWeight.w500, fontSize: 16.5.sp)),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final imageUrl = context
                      .read<EventsCalendarCubit>()
                      .getEventImageByDate(day);
                  return GestureDetector(
                    onTap: () {
                      if (eventId != 0 && imageUrl.isNotEmpty) {
                        navigator<NavigationService>().navigateTo(
                            UserRoutes.eventDetailsRoute,
                            queryParams: {
                              'id': eventId.toString(),
                            });
                      }
                    },
                    child: Container(
                      height: 3.5.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: imageUrl.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    imageUrl,
                                  ),
                                )
                              : null),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
