import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/booking/payment_details_cubit/payment_details_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/number_extension.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/gradient_button.dart';
import '../core/book_tickets.dart';
import 'widgets/price_unit_tile.dart';

class PaymentDetails extends StatelessWidget {
  final dynamic arguments;
  const PaymentDetails({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => PaymentDetailsCubit(
        PaymentDetailsState.initial(
          eventBookingDetails: arguments,
          serverUrl: appConfig.serverUrl,
          razorPayApiKey: appConfig.razorPayApiKey,
          user: appStateNotifier.user!,
        ),
      )..init(),
      child: const PaymentDetailsConsumer(),
    );
  }
}

class PaymentDetailsConsumer extends StatelessWidget {
  const PaymentDetailsConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentDetailsCubit, PaymentDetailsState>(
      listener: (context, state) {
        if (state.isPaymentFailure ||
            state.isPaymentSuccess ||
            state.isPaymentPending) {
          navigator<NavigationService>().navigateTo(
            UserRoutes.paymentStatusScreenRoute,
            queryParams: {
              'eventId': state.event!.id.toString(),
              'isPaymentSuccess': state.isPaymentSuccess.toString(),
              'isPaymentPending': state.isPaymentPending.toString(),
              'totalAmount': state.totalAmount.toString(),
              'numberOfTickets':
                  state.eventBookingDetails.numberOfTickets.toString(),
            },
            isClearStack: true,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const Scaffold(body: SizedBox())
              : Scaffold(
                  bottomNavigationBar: TicketBookingWidget(
                    startDate: state.event!.startDate,
                    priceRangeStart: state.totalAmount,
                    onClick: () {
                      context.read<PaymentDetailsCubit>().onBookingPayment();
                    },
                  ),
                  appBar: CustomAppBar(
                      title: 'Payment Details',
                      leading: GestureDetector(
                          onTap: () {
                            navigator<NavigationService>().goBack();
                          },
                          child: Center(
                              child:
                                  SvgPicture.asset(AssetConstants.arrowLeft))),
                      actions: const []),
                  body: SafeArea(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                        SizedBox(
                          height: 2.h,
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'Choose your payment method',
                        //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //           fontWeight: FontWeight.w600,
                        //           color: Theme.of(context).colorScheme.background),
                        //     ),
                        //     SizedBox(
                        //       height: 1.2.h,
                        //     ),
                        //     Container(
                        //       padding:
                        //           EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                        //       height: 12.h,
                        //       decoration: BoxDecoration(
                        //           color: Theme.of(context).colorScheme.surface,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Row(
                        //                 children: [
                        //                   SvgPicture.asset(AssetConstants.upiIcon),
                        //                   SizedBox(
                        //                     width: 3.w,
                        //                   ),
                        //                   Text(
                        //                     'UPI',
                        //                     style: Theme.of(context)
                        //                         .textTheme
                        //                         .bodySmall!
                        //                         .copyWith(
                        //                             fontWeight: FontWeight.w500,
                        //                             fontSize: 15.5.sp,
                        //                             color: Theme.of(context)
                        //                                 .colorScheme
                        //                                 .background),
                        //                   ),
                        //                 ],
                        //               ),
                        //               SvgPicture.asset(AssetConstants.arrowRight),
                        //             ],
                        //           ),
                        //           Divider(
                        //             thickness: .05.w,
                        //             height: 0.w,
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Row(
                        //                 children: [
                        //                   SvgPicture.asset(
                        //                       AssetConstants.debitCreditWalletIcon),
                        //                   SizedBox(
                        //                     width: 3.w,
                        //                   ),
                        //                   Text(
                        //                     'Debit/Credit Card',
                        //                     style: Theme.of(context)
                        //                         .textTheme
                        //                         .bodySmall!
                        //                         .copyWith(
                        //                             fontWeight: FontWeight.w500,
                        //                             fontSize: 15.5.sp,
                        //                             color: Theme.of(context)
                        //                                 .colorScheme
                        //                                 .background),
                        //                   ),
                        //                 ],
                        //               ),
                        //               SvgPicture.asset(AssetConstants.arrowRight),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  )),
                ),
        );
      },
    );
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentDetailsCubit, PaymentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final event = state.event;
        return Container(
          height: 32.w,
          width: 100.w,
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            border: Border.all(
                width: .3.w, color: Theme.of(context).colorScheme.primary),
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
                          imageUrl: CustomImageProvider.getImageUrl(
                              event?.coverImage, ImageType.other)))),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      event?.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Theme.of(context).colorScheme.background),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            StringExtension.formatDateTimeWithDay(
                                DateTime.parse(event?.startDate ?? '')),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(.7),
                                      fontSize: 14.5.sp,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.locationIcon,
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Text(
                            event?.pub?.fullName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(.7),
                                      fontSize: 14.5.sp,
                                    ),
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
      },
    );
  }
}

class PaymentDestributionDetails extends StatelessWidget {
  const PaymentDestributionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentDetailsCubit, PaymentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeData = Theme.of(context);
        final colorScheme = themeData.colorScheme;
        final textTheme = themeData.textTheme;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...state.eventBookingDetails.eventTicketDetails.map((e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name,
                          style: textTheme.bodySmall!.copyWith(
                            color: colorScheme.background,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        PriceUnit(
                            title: 'Ticket Price',
                            detail: e.price.toIndianRupeeString()),
                        SizedBox(
                          height: 1.h,
                        ),
                        PriceUnit(
                            title: 'Quantity',
                            detail: e.noOfTickets.toString()),
                        SizedBox(
                          height: 2.h,
                        ),
                        Divider(
                          thickness: .05.w,
                          height: 0.w,
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.5.sp,
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                      Text(
                        state.totalAmount.toIndianRupeeString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.5.sp,
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomBookingBar extends StatelessWidget {
  final void Function()? onClick;
  final String startDate;
  final double priceRangeStart;
  final double priceRangeEnd;
  const BottomBookingBar(
      {super.key,
      this.onClick,
      required this.startDate,
      required this.priceRangeStart,
      required this.priceRangeEnd});

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
                        '${priceRangeStart.toIndianRupeeString()} ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16.sp)),
                    SizedBox(
                      width: 1.w,
                    ),
                    // Text(priceRangeEnd.toIndianRupeeString(),
                    //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    //         decoration: TextDecoration.lineThrough,
                    //         decorationThickness: .5.w,
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
