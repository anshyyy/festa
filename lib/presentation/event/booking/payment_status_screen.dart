import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/booking/payment_status_cubit/payment_status_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/extensions/number_extension.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/gradient_button.dart';

class PaymentStatusScreen extends StatelessWidget {
  final bool isPaymentSuccess;
  final bool isPaymentPending;
  final int numberOfTickets;
  final int eventId;
  final double totalAmount;
  const PaymentStatusScreen({
    super.key,
    required this.isPaymentSuccess,
    required this.numberOfTickets,
    required this.eventId,
    required this.totalAmount,
    required this.isPaymentPending,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => PaymentStatusCubit(PaymentStatusState.initial(
        serverUrl: appConfig.serverUrl,
        eventId: eventId,
        numberOfTickets: numberOfTickets,
        totalAmount: totalAmount,
        isPaymentSuccess: isPaymentSuccess,
        isPaymentPending: isPaymentPending,
      ))
        ..init(),
      child: const PaymentStatusConsumer(),
    );
  }
}

class PaymentStatusConsumer extends StatelessWidget {
  const PaymentStatusConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return BlocConsumer<PaymentStatusCubit, PaymentStatusState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const SizedBox()
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 70.h,
                          padding: EdgeInsets.only(
                              top: 18.5.w, left: 4.w, right: 4.w),
                          decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 9.h,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            height: 100.h,
                                            width: 15.5.w,
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                     CustomImageProvider.getImageUrl(state.event?.coverImage, ImageType.other)))),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          state.event?.name ?? '',
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp,
                                                  color:
                                                      colorScheme.background),
                                        ),
                                        Text(
                                          state.totalAmount == 0
                                              ? 'Free'
                                              : state.totalAmount
                                                  .toIndianRupeeString(),
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp,
                                                  color:
                                                      colorScheme.background),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Divider(
                                thickness: .07.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.5.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              state.isPaymentPending
                                                  ? AssetConstants.alertIcon
                                                  : state.isPaymentSuccess
                                                      ? AssetConstants
                                                          .circledTickFilledGreen
                                                      : AssetConstants
                                                          .circledCloseFilledRed,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              state.isPaymentPending
                                                  ? 'Pending'
                                                  : state.isPaymentSuccess
                                                      ? 'Successful'
                                                      : 'Failed',
                                              style: themeData
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: colorScheme
                                                          .background,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.5.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Number of tickets',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.5.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          state.numberOfTickets.toString(),
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.5.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          StringExtension.formatDateTimeLong(
                                              DateTime.parse(
                                                  state.event!.startDate)),
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                     Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Note',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.5.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'You payment status is pending, please check again after few minutes',
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Text(
                                    //       'Payment Method',
                                    //       style: themeData.textTheme.bodySmall!.copyWith(
                                    //         fontWeight: FontWeight.w600,
                                    //         fontSize: 15.5.sp,
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       height: 1.h,
                                    //     ),
                                    //     Container(
                                    //       height: 13.5.h,
                                    //       padding: EdgeInsets.symmetric(
                                    //           horizontal: 4.5.w, vertical: 4.w),
                                    //       decoration: BoxDecoration(
                                    //         color: themeData.scaffoldBackgroundColor,
                                    //         borderRadius: BorderRadius.circular(20),
                                    //       ),
                                    //       child: Row(
                                    //         children: [
                                    //           Container(
                                    //             height: 22.w,
                                    //             width: 22.w,
                                    //             // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.w),
                                    //             decoration: BoxDecoration(
                                    //               color: colorScheme.surface,
                                    //               borderRadius: BorderRadius.circular(15),
                                    //             ),
                                    //             child: Center(
                                    //               child: CircleAvatar(
                                    //                 radius: 6.w,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             width: 5.w,
                                    //           ),
                                    //           Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             mainAxisAlignment: MainAxisAlignment.center,
                                    //             children: [
                                    //               Text(
                                    //                 'Visa',
                                    //                 style: themeData.textTheme.bodyMedium!
                                    //                     .copyWith(
                                    //                   color: colorScheme.background,
                                    //                   fontWeight: FontWeight.w600,
                                    //                 ),
                                    //               ),
                                    //               const Text(
                                    //                 'Ending with 3092',
                                    //               )
                                    //             ],
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     SizedBox(height: 1.5.h,),
                                    //   ],
                                    // )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: themeData.scaffoldBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              state.isPaymentSuccess || state.isPaymentPending
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomOutlinedButton(
                                          text: 'View tickets',
                                          width: 27.w,
                                          height: 4.h,
                                          onTap: () {
                                            navigator<NavigationService>()
                                                .navigateTo(
                                                    UserRoutes.mainNavRoute,
                                                    isClearStack: true,
                                                    queryParams: {
                                                  'routeIndex': '2'
                                                });
                                          },
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        GradientButton(
                                          text: 'Home',
                                          onTap: () {
                                            navigator<NavigationService>()
                                                .navigateTo(
                                                    UserRoutes.mainNavRoute,
                                                    isClearStack: true,
                                                    queryParams: {
                                                  'routeIndex': '0'
                                                });
                                          },
                                          height: 4.h,
                                          width: 27.w,
                                          textStyle: themeData
                                              .textTheme.bodySmall!
                                              .copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GradientButton(
                                          text: 'Try again',
                                          onTap: () {},
                                          height: 4.h,
                                          width: 27.w,
                                          textStyle: themeData
                                              .textTheme.bodySmall!
                                              .copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Follow to receive notifications on new events',
                                style: themeData.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigator<NavigationService>().navigateTo(
                                      UserRoutes.clubProfileRoute,
                                      queryParams: {
                                        'id':
                                            state.event!.pub!.id.toString(),
                                      });
                                },
                                child: Container(
                                  width: 68.w,
                                  height: 9.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color:
                                          colorScheme.surface.withOpacity(.3),
                                      border: Border.all(
                                        width: .1.w,
                                        color: colorScheme.secondaryContainer,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5.5.w,
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                       CustomImageProvider.getImageUrl(state.event?.pub?.logo, ImageType.profile)),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.event?.pub
                                                            ?.fullName ??
                                                        '',
                                                    style: themeData
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      color: colorScheme
                                                          .background,
                                                      fontSize: 16.5.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: .5.h,
                                                  ),
                                                  // Text(
                                                  //   '100+ events',
                                                  //   style: themeData.textTheme.bodySmall!
                                                  //       .copyWith(
                                                  //           color: colorScheme.background
                                                  //               .withOpacity(.7),
                                                  //           fontWeight: FontWeight.w600),
                                                  // ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(
                                          AssetConstants.arrowRight)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
