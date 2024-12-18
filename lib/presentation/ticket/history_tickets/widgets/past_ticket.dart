import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../domain/core/extensions/string_extension.dart';
import '../../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';

class PastTicket extends StatelessWidget {
  final BookedTicketDetailsDto ticket;

  const PastTicket({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
      height: 9.875.h,
      width: 82.75.w,

    
      child: Row(
        children: [
          Container(
            height: 8.75.h,
            width: 8.75.h,
            decoration: BoxDecoration(
                image:  DecorationImage(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 70.66.w,
                  child: Text(
                      ticket.eventDetails.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.px,
                          fontWeight: FontWeight.w600))),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                  width: 50.66.w,
                  child: Text(
                     ticket.eventDetails.description,
                     overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                  width: 50.66.w,
                  child: Text(
                    StringExtension.formatDateTimeLongWithYear(
                                  DateTime.parse(ticket.eventDetails.startDate)),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
