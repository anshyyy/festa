import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../widgets/gradient_button.dart';

class TicketBookingWidget extends StatelessWidget {
  final void Function()? onClick;
  const TicketBookingWidget({super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      padding: EdgeInsets.only(left: 4.w,right: 4.w, bottom: 1.h),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    // StringExtension.formatDateTimeMedium(
                    //     DateTime.parse(event!.startDate)),
                    'Dec 25, 08:00 PM',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16.5.sp
                       )),
                       SizedBox(height: 1.h,),
                Row(
                  children: [
                    Text(
                        // '${event.priceRangeStart.toIndianRupeeString()} ',
                        '4999',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15.sp)),
                            SizedBox(width: 1.w,),
                    Text('5999',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 15.sp)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
              child: GradientButton(
            text: EventDetailsScreenConstants.bookTheTickets,
            onTap:onClick,
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
          ))
        ],
      ),
    );
  }
}
