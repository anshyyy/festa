import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/number_extension.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../widgets/gradient_button.dart';

class TicketBookingWidget extends StatelessWidget {
  final void Function() onClick;
  final String startDate;
  final double priceRangeStart;
  final double? priceRangeEnd;
  const TicketBookingWidget(
      {super.key,
      required this.onClick,
      required this.startDate,
      required this.priceRangeStart,
      this.priceRangeEnd});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 100.w,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.h),
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
                    StringExtension.formatDateTimeShort(
                        DateTime.parse(startDate)),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16.5.sp)),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                        // '${event.priceRangeStart.toIndianRupeeString()} ',
                        priceRangeStart == 0 ?'Free' : priceRangeStart.toIndianRupeeString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16.sp)),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(priceRangeEnd?.toIndianRupeeString() ?? '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: .5.w,
                          decorationColor: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w600, fontSize: 14.5.sp)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: GradientButton(
                text: EventDetailsScreenConstants.bookTheTickets,
                onTap: onClick,
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
