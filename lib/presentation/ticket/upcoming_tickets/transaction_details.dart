import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';

class TransactionDetails extends StatelessWidget {
  final BookedTicketDetailsDto ticketDetails;
  const TransactionDetails({super.key, required this.ticketDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(top: 5.h, left: 2.w, bottom: .5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction ID',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                ticketDetails.transactionId.isEmpty ? '-' : ticketDetails.transactionId,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                ticketDetails.paymentMethod.isEmpty ? '-' : ticketDetails.paymentMethod,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Reference ID',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                ticketDetails.bookingReference.isEmpty ? '-' : ticketDetails.bookingReference,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'ROW',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodySmall!
          //               .copyWith(
          //                 fontWeight: FontWeight.w600,
          //             fontSize: 14.sp,

          //               ),
          //         ),
          //         Text(
          //           '2',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyMedium!
          //               .copyWith(
          //                   fontWeight: FontWeight.w600,
          //                   color: Theme.of(context)
          //                       .colorScheme
          //                       .background,),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       width: 2.w,
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'GATE',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodySmall!
          //               .copyWith(
          //                 fontWeight: FontWeight.w600,
          //             fontSize: 14.sp,

          //               ),
          //         ),
          //         Text(
          //           '08',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyMedium!
          //               .copyWith(
          //                   fontWeight: FontWeight.w600,
          //                   color: Theme.of(context)
          //                       .colorScheme
          //                       .background),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Amount',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                ticketDetails.paymentAmount.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
