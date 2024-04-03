import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import 'qr_viewer.dart';
import 'transaction_details.dart';

class BookingDescription extends StatelessWidget {
  final BookedTicketDetailsDto ticketDetails;
  const BookingDescription({
    super.key, required this.ticketDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Expanded(
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: state.showTicketDetails
                    ?  TransactionDetails(ticketDetails: ticketDetails,)
                    : const QrViewer(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.shareIcon,
                      height: 6.5.w,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // context.read<TicketCubi>().showTicketDetails()
                      },
                      child: GestureDetector(
                        onTap: () => context
                            .read<TicketCubit>()
                            .showTransactionDetails(id: ticketDetails.id),
                        child: Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: .8,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(
                              seconds: 1,
                            ),
                            child: !state.showTicketDetails
                                ? SvgPicture.asset(
                                    AssetConstants.arrowRight,
                                    height: 4.5.w,
                                  )
                                : SvgPicture.asset(
                                    AssetConstants.arrowLeft,
                                    height: 4.5.w,
                                  ),
                          ),
                        ),
                      ),
                    )
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
