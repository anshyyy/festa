import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/gradient_button.dart';

class PastTicketHistory extends StatelessWidget {
  final BookedTicketDetailsDto ticket;
  final bool isRecent;
  const PastTicketHistory({super.key, required this.ticket,required this.isRecent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ticket.eventDetails.name,
        scaffoldBackgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(.02),
        leading: GestureDetector(
          onTap: () => navigator<NavigationService>().goBack(),
          child: Center(
            child: SvgPicture.asset(
              AssetConstants.closeIcon,
              width: 7.w,
            ),
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
              height: 18.h,
              width: 82.75.w,
              child: Row(
                children: [
                  Container(
                    height: 18.h,
                    width: 28.42.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                ticket.eventDetails.coverImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.grey.withOpacity(0.3),
                        )),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    children: [
                      SizedBox(
                          width: 50.66.w,
                          child: Text(
                            ticket.eventDetails.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.px,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      SizedBox(
                          width: 50.66.w,
                          child: Text(
                            ticket.eventDetails.address?.city ?? "Bangalore",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.px,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                          width: 50.66.w,
                          child: Text(
                            StringExtension.formatDateString(
                                ticket.eventDetails.startDate),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.px,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                          width: 50.66.w,
                          child: Text(
                            StringExtension.formatTimeRange(
                                ticket.eventDetails.startDate,
                                ticket.eventDetails.endDate ?? ""),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.px,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction ID',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500),
                ),
                Text(
                  ticket.transactionId,
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Payment Method',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500),
                ),
                Text(
                  ticket.paymentMethod,
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Booking Reference ID',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500),
                ),
                Text(
                  ticket.id.toString(),
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500),
                    ),
                    Text(
                      '₹${ticket.paymentAmount}',
                      style: TextStyle(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            if(isRecent)
            GradientButton(
                text: 'Write A Review',
                onTap: () {
                  navigator<NavigationService>()
                      .navigateTo(UserRoutes.reviewScreen, queryParams: {
                    'eventName': ticket.eventDetails.name,
                    'eventTime':
                        '${StringExtension.formatDateString(ticket.eventDetails.startDate)} ${StringExtension.formatTimeRange(ticket.eventDetails.startDate, ticket.eventDetails.endDate ?? "")}'
                  });
                }),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
