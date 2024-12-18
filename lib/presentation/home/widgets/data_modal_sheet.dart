import 'package:app/presentation/home/widgets/filter_modal_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../application/filter/filter_cubit.dart';
import '../../../application/home/cubit/home_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../widgets/gradient_button.dart';

class DateModalSheet extends StatefulWidget {
  final List<FilterDto> filters;
  const DateModalSheet({
    super.key,
    required this.filters,
  });

  @override
  State<DateModalSheet> createState() => _DateModalSheetState();
}

class _DateModalSheetState extends State<DateModalSheet> {
  List<DateTime> _selectedDays = [];
  DateTime _focusedDay = DateTime.now(); // Add focusedDay state

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => FilterCubit(
        FilterState.initial(
          filters: widget.filters,
        ),
      )..init(),
      child: BlocConsumer<FilterCubit, FilterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: 72.75.h,
            padding: EdgeInsets.only(left: 1.h, right: 1.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(7.w),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: .5.h,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 2.h,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.w, right: 2.w, top: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Date',
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          color: themeData.colorScheme.background,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigator<NavigationService>()
                              .goBack(responseObject: state.filters);
                        },
                        child: SvgPicture.asset(
                          AssetConstants.closeIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "Simply select or click the days you prefer to view events.",
                  style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.onTertiary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.px),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Divider(
                  thickness: .035.w,
                ),
              ),
              Container(
                height: 47.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: TableCalendar(
                    selectedDayPredicate: (day) {
                      return _selectedDays.contains(day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (_selectedDays.contains(selectedDay)) {
                          _selectedDays.remove(selectedDay);
                        } else {
                          _selectedDays.add(selectedDay);
                        }
                        _focusedDay = focusedDay; // Update focusedDay
                      });
                    },
                    availableGestures: AvailableGestures.none,

                    // enabledDayPredicate: (day) {
                    //   // This will disable all days before today
                    //   return day
                    //       .isAfter(DateTime.now().subtract(Duration(days: 1)));
                    // },
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    // Use focusedDay state
                    headerStyle: HeaderStyle(
                      titleCentered: _focusedDay.month > DateTime.now().month ||
                          _focusedDay.year > DateTime.now().year,
                      headerPadding:
                          !(_focusedDay.month > DateTime.now().month ||
                                  _focusedDay.year > DateTime.now().year)
                              ? EdgeInsets.only(left: 1.2.h)
                              : const EdgeInsets.symmetric(vertical: 8.0),
                      leftChevronIcon: SvgPicture.asset(
                        AssetConstants.backArrowIcon,
                      ),
                      rightChevronIcon: SvgPicture.asset(
                        AssetConstants.arrowRight,
                      ),
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.background,
                              ),
                      formatButtonVisible: false,
                      leftChevronVisible:
                          _focusedDay.month > DateTime.now().month ||
                              _focusedDay.year > DateTime.now().year,
                      rightChevronVisible: true,
                    ),
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: false,
                      outsideDaysVisible: false,
                      selectedDecoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                      
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: const TextStyle(
                        
                        color: Colors.white,
                      ),
                    ),
                    daysOfWeekHeight: 2.5.h,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16.5.sp)
                          .copyWith(
                            textBaseline: TextBaseline.alphabetic,
                          ),
                      weekendStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: themeData.colorScheme.onTertiary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.5.sp)
                          .copyWith(
                            textBaseline: TextBaseline.alphabetic,
                          ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, events) => Container(
                        height: 3.75.h,
                        width: 3.75.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${date.day}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      defaultBuilder: (context, day, focusedDay) {
                        final bool isPastDate = day.isBefore(
                            DateTime.now().subtract(Duration(days: 1)));
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedDays.contains(day)) {
                                _selectedDays.remove(day);
                              } else {
                                _selectedDays.add(day);
                              }
                              _focusedDay = focusedDay; // Update focusedDay
                            });
                          },
                          child: Container(
                            height: 3.9.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedDays.contains(day)
                                  ? themeData.colorScheme.onPrimary
                                  : null,
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Text(
                                    '${day.day}',
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      //  decoration: TextDecoration.lineThrough,
                                      color: _selectedDays.contains(day)
                                          ? Colors.white
                                          : themeData.colorScheme.background,
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // if (isPastDate)
                                  //   Positioned(

                                  //     child: Container(
                                  //       width: 20,
                                  //       height: 20,
                                  //       decoration: BoxDecoration(
                                  //         color: const Color.fromARGB(255, 33, 33, 33).withOpacity(0.6),
                                  //         shape: BoxShape.circle,
                                  //       ),
                                  //       child: SvgPicture.asset(AssetConstants.closeIcon),
                                  //     ),
                                  //   ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: .035.w,
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedDays.clear();
                        });
                        CustomToast.show(context, 'All the Dates are cleared');
                      },
                      child: Text(
                        'Clear All',
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: themeData.colorScheme.background,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                    Expanded(
                      child: GradientButton(
                          textStyle: themeData.textTheme.bodySmall!.copyWith(
                              color: themeData.colorScheme.background,
                              fontWeight: FontWeight.w600,
                              fontSize: 3.5.w),
                          isEnabled: true,
                          width: 100.w,
                          height: 5.5.h,
                          text: 'Apply filters',
                          onTap: () {
                            (_selectedDays);
                            navigator<NavigationService>()
                                .goBack(responseObject: _selectedDays);
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              )
            ]),
          );
        },
      ),
    );
  }
}
