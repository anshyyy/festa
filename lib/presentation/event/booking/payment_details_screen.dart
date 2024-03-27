import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../core/book_tickets.dart';
import 'widgets/price_unit_tile.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentDetailsConsumer();
  }
}

class PaymentDetailsConsumer extends StatelessWidget {
  const PaymentDetailsConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: TicketBookingWidget(
      //   onClick: (){
      //     navigator<NavigationService>().navigateTo(UserRoutes.bookingDetailsRoute);
      //   },
      // ),
      appBar: CustomAppBar(
          title: 'Payment Details',
          leading: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Center(child: SvgPicture.asset(AssetConstants.arrowLeft))),
          actions: []),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:5.w),
            child: Column(
              children: [
                const EventDetails(),
                SizedBox(
                  height: 1.h,
                ),
                const PaymentDestributionDetails(),
                SizedBox(
                  height: 1.h,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(PaymentScreenConstants.offersAndBenfit),
                //     SizedBox(
                //       height: 1.h,
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(4.w),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Theme.of(context).colorScheme.primaryContainer),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Row(
                //             children: [
                //               SvgPicture.asset(AssetConstants.shareIcon),
                //               SizedBox(
                //                 width: 2.w,
                //               ),
                //               Text(PaymentScreenConstants.applyCoupon),
                //             ],
                //           ),
                //           SvgPicture.asset(AssetConstants.arrowRight)
                //         ],
                //       ),
                //     )
                //   ],
                // )
                SizedBox(height: 2.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose your payment method',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.background),
                    ),
                    SizedBox(height: 1.2.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AssetConstants.upiIcon),
                                  SizedBox(width: 3.w,),
                                  Text('UPI',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5.sp,
                                color: Theme.of(context).colorScheme.background),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(AssetConstants.arrowRight),
                            ],
                          ),
                          Divider(
                        thickness: .05.w,
                        height: 0.w,
                      ),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AssetConstants.debitCreditWalletIcon),
                                  SizedBox(width: 3.w,),
                                  Text('Debit/Credit Card',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5.sp,
                                color: Theme.of(context).colorScheme.background),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(AssetConstants.arrowRight),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.w,
                  width: 100.w,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 100.h,
                  width: 22.5.w,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Bollywood Night 2023',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Theme.of(context).colorScheme.background),
                ),
                Row(
                  children: [
                    Text(
                      'Sat 22 July, 2023',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background.withOpacity(.7),
                            fontSize: 14.5.sp,
                          ),
                    ),
                    SizedBox(width: 2.w,),
                    Text(
                      '12:00 PM',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background.withOpacity(.7),
                            fontSize: 14.5.sp,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetConstants.locationIcon,
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      "Bob's Bar, Banglore",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background.withOpacity(.7),
                            fontSize: 14.5.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDestributionDetails extends StatelessWidget {
  const PaymentDestributionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21.h,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PriceUnit(title: 'Ticket Price', detail: '4999.00'),
                const PriceUnit(title: 'Quantity', detail: '2'),
                const PriceUnit(title: 'Title', detail: '11.00'),
                const PriceUnit(title: 'GST', detail: '200.00'),
                Divider(
                  thickness: .05.w,
                  height: 0.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.5.sp,
                          color: Theme.of(context).colorScheme.background,),
                    ),
                    Text(
                      '10,000.00',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.5.sp,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
