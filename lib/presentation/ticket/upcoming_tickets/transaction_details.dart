import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.only(top:4.h,left: 2.w, bottom: .5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transaction ID',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          Text(
                            '1198804794001625088',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Method',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                      
                                    ),
                          ),
                          Text(
                            'Dana (089xxxxxx212)',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Reference ID',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,

                                    ),
                          ),
                          Text(
                            '98348',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ROW',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,

                                    ),
                              ),
                              Text(
                                '2',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GATE',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,

                                    ),
                              ),
                              Text(
                                '08',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Amount',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,

                                    ),
                          ),
                          Text(
                            '₹ 3,000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }
}