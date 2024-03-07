import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalender extends StatelessWidget {
  final List<String> images;
  final DateTime startDate;
  final DateTime endDate;
  const EventCalender({super.key, required this.images, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
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
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
        
          daysOfWeekHeight:2.5.h,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.5.sp),
            weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.5.sp)
          ),
                    calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) => Container(
                    height: 3.5.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: day.day % 5 == 0
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  images[day.day%12],
                                ),
                              )
                            : null),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600
                            ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
