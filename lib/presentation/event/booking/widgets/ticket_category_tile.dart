import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/booking/booking_cubit.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../infrastructure/event/dtos/event_ticket/event_ticket.dart';
import '../../../../infrastructure/event/dtos/event_ticket_category/event_ticket_category_dto.dart';
import '../../../widgets/gradient_button.dart';

class TicketCategory extends StatelessWidget {
  final EventTicketDto eventTicketCategory;

  const TicketCategory({
    super.key,
    required this.eventTicketCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var res = await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 0.5.h,
                                      width: 15.w,
                                      margin: EdgeInsets.only(
                                          top: 1.h, bottom: 2.5.h),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  ]),
                              Center(
                                  child: Column(children: [
                                Text(
                                  eventTicketCategory.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.5.sp),
                                ),
                                Text(
                                  '₹${eventTicketCategory.price + eventTicketCategory.coverCharge}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ])),
                              SizedBox(height: 1.h),
                              Text(
                                eventTicketCategory.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.5.sp),
                              ),
                              Spacer(),
                              GradientButton(
                                  text: "Add Ticket",
                                  onTap: () {
                                    navigator<NavigationService>()
                                        .goBack(responseObject: {
                                      'add': true,
                                    });
                                  }),
                              SizedBox(
                                height: 4.h,
                              )
                            ],
                          ),
                        ),
                      );
                      if (res != null && res['add'] == true) {
                        context
                            .read<BookingCubit>()
                            .addTickets(id: eventTicketCategory.id);
                      }
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              eventTicketCategory.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.5.sp),
                            ),
                            SizedBox(width: 1.w),
                            // InkWell(
                            //     onTap: () async {
                            //       //show bottom sheet
                            //     },
                            //     child: Padding(
                            //       padding: EdgeInsets.only(top: 0.0.h),
                            //       child: SvgPicture.asset(
                            //         AssetConstants.infoIcon,
                            //         height: 2.h,
                            //       ),
                            //     ))
                          ]),
                          SizedBox(
                            height: .5.h,
                          ),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              '${eventTicketCategory.description}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              eventTicketCategory.currentTicketsCount == 0
                  ? GradientButton(
                      text:
                          '₹${eventTicketCategory.price + eventTicketCategory.coverCharge}',
                      onTap: () {
                        context
                            .read<BookingCubit>()
                            .addTickets(id: eventTicketCategory.id);
                      },
                      height: 4.h,
                      width: 27.w,
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<BookingCubit>()
                                    .removeTickets(id: eventTicketCategory.id);
                              },
                              child: SvgPicture.asset(
                                AssetConstants.removeTicketIcon,
                                height: 3.h,
                              ),
                            ),
                            SizedBox(
                              width: 9.w,
                              child: Center(
                                child: Text(
                                  eventTicketCategory.currentTicketsCount
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                      ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<BookingCubit>()
                                    .addTickets(id: eventTicketCategory.id);
                              },
                              child: SvgPicture.asset(
                                AssetConstants.addTicketIcon,
                                height: 3.h,
                              ),
                            ),
                          ],
                        ),
                        eventTicketCategory.currentTicketsCount == 0
                            ? SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.only(top: 0.5.h),
                                child: Text(
                                  '₹${eventTicketCategory.price + eventTicketCategory.coverCharge} each',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                      ],
                    )
            ],
          ),
        );
      },
    );
  }
}
