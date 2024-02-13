import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'event_calendar.dart';

class CalendarBuilder extends StatelessWidget {
  final List<String> images;
    final DateTime startDate;
  final DateTime endDate;
  const CalendarBuilder({super.key, required this.images, required this.startDate, required this.endDate});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder:(context, index) => Padding(
        padding:  EdgeInsets.symmetric(vertical: 1.h),
        child: EventCalender(images: images, startDate: startDate, endDate: endDate),
      ),);
  }
}