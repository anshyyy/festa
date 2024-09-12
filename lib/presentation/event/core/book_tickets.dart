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
  final int? couponAmount;
  const TicketBookingWidget(
      {super.key,
      required this.onClick,
      required this.startDate,
      required this.priceRangeStart,
      this.priceRangeEnd,
      this.couponAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.5.h,
      width: 100.w,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.5.h),
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
                        height: 1,
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16.5.sp)),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  children: [
                    Text(
                        // '${event.priceRangeStart.toIndianRupeeString()} ',
                        (priceRangeStart) == 0
                            ? 'Free'
                            : couponAmount == 0
                                ? (priceRangeStart ?? 0).toIndianRupeeString()
                                : ((priceRangeStart ?? 0) - (couponAmount ?? 0))
                                    .toIndianRupeeString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16.sp)),
                    SizedBox(
                      width: 1.w,
                    ),
                    // Text(priceRangeEnd?.toIndianRupeeString() ?? '',
                    //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    //         decorationThickness: .5.w,
                    //         height: 1,
                    //         decorationColor:
                    //             Theme.of(context).colorScheme.surface,
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 14.5.sp)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: GradientButton(
                text: EventDetailsScreenConstants.grabPasses,
                onTap: onClick,
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                    ),
              ))
        ],
      ),
    );
  }
}
