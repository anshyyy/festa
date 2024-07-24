import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/booking/booking_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import 'widgets/ticket_category_tile.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/number_extension.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../widgets/gradient_button.dart';

class BookTicketScreen extends StatelessWidget {
  final int eventId;
  const BookTicketScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) =>
          BookingCubit(BookingState.initial(serverUrl: appConfig.serverUrl))
            ..fetchEventDetails(id: eventId),
      child: const BookTicketScreenConsumer(),
    );
  }
}

class BookTicketScreenConsumer extends StatelessWidget {
  const BookTicketScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) async {
        if (state.isBookingSuccess && !state.isBookingFailure) {
          await navigator<NavigationService>().navigateTo(
              UserRoutes.paymentDetailsRoute,
              arguments: state.bookingDetails);
          context.read<BookingCubit>().emitFromAnywhere(
                  state: state.copyWith(
                isBookingSuccess: false,
              ));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const Scaffold(body: SizedBox())
              : Scaffold(
                  bottomNavigationBar: BottomBookingBar(
                    startDate: state.event!.startDate,
                    priceRangeStart: state.event!.priceRangeStart,
                    onClick: () {
                      context.read<BookingCubit>().createBooking();
                    },
                  ),
                  appBar: CustomAppBar(
                      title: 'Select Tickets',
                      leading: GestureDetector(
                          onTap: () {
                            navigator<NavigationService>().goBack();
                          },
                          child: Center(
                              child:
                                  SvgPicture.asset(AssetConstants.arrowLeft,  width: 7.w))),
                      actions: const []),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            ...state.event!.eventTicketCategories.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(top:5,bottom: 5),
                                child: TicketCategory(
                                  eventTicketCategory: e,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
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
  final double? priceRangeEnd;
  const BottomBookingBar(
      {super.key,
      this.onClick,
      required this.startDate,
      required this.priceRangeStart,
      this.priceRangeEnd});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 12.5.h,
          width: 100.w,
          padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.5.h),
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
                      height: state.isBookingEnabled ? 1.h : 0,
                    ),
                    state.isBookingEnabled
                        ? Row(
                            children: [
                              Text(
                                  state.totalPrice == 0
                                      ? 'Free'
                                      : state.totalPrice.toIndianRupeeString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 16.sp)),
                              SizedBox(
                                width: 1.w,
                              ),
                              // Text(priceRangeEnd?.toIndianRupeeString() ?? '',
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .bodyMedium!
                              //         .copyWith(
                              //             decoration:
                              //                 TextDecoration.lineThrough,
                              //             decorationThickness: .5.w,
                              //             decorationColor: Theme.of(context)
                              //                 .colorScheme
                              //                 .surface,
                              //             fontWeight: FontWeight.w600,
                              //             fontSize: 14.5.sp)),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: GradientButton(
                    text: EventDetailsScreenConstants.grabPasses,
                    onTap: onClick,
                    isEnabled: state.isBookingEnabled,
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          color: state.isBookingEnabled
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(.5),
                          fontWeight: FontWeight.w600,
                        ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
