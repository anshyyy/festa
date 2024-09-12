import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';

class InfoWidget extends StatelessWidget {

  BookedTicketDetailsDto ticket;


  InfoWidget({super.key,required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left:2.h,right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction ID',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            ticket.transactionId,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(height: 0.8.h,),
           Text(
            'Payment Method',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            ticket.paymentMethod,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(height: 0.7.h,),
           Text(
            'Booking Reference ID',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            ticket.id.toString()??'119880AQ88',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),

          SizedBox(height: 0.8.h,),
          Row(
        
            children: [
              //put seat here if there is 
             
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
            'Total Amount',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            '₹${ticket.paymentAmount}',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
