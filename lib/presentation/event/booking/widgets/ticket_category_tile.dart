import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/booking/booking_cubit.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../infrastructure/event/dtos/event_ticket_category/event_ticket_category_dto.dart';
import '../../../widgets/gradient_button.dart';

class TicketCategory extends StatelessWidget {
  final EventTicketCategoryDto eventTicketCategory;

  const TicketCategory(
      {super.key, required this.eventTicketCategory,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        
      },
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
                  Text(
                    eventTicketCategory.name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5.sp),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text(
                    '₹${eventTicketCategory.price}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                  ),
                ],
              ),
              eventTicketCategory.currentTicketsCount == 0
                  ? GradientButton(
                      text: 'Add',
                      onTap: (){
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
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: (){
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
                              eventTicketCategory.currentTicketsCount.toString(),
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
                          onTap: (){
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
                    )
            ],
          ),
        );
      },
    );
  }
}
