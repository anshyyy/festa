import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import 'qr_viewer.dart';
import 'transaction_details.dart';

class BookingDescription extends StatelessWidget {
  const BookingDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child:
                    state.showTicketDetails ? TransactionDetails() : QrViewer(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AssetConstants.shareIcon),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // context.read<TicketCubi>().showTicketDetails()
                      },
                      child: GestureDetector(
                        onTap: () => context
                            .read<TicketCubit>()
                            .showTransactionDetails(),
                        child: Container(
                          height: 4.5.h,
                          width: 4.5.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: !state.showTicketDetails
                                ? SvgPicture.asset(
                                    AssetConstants.arrowRight,
                                  )
                                : SvgPicture.asset(
                                    AssetConstants.arrowLeft,
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
