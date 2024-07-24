import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

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
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            '1198804794001625088',
            style: TextStyle(
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(height: 1.h,),
           Text(
            'Payment Method',
            style: TextStyle(
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            'Google Pay 119880488',
            style: TextStyle(
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(height: 1.h,),
           Text(
            'Booking Reference ID',
            style: TextStyle(
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            '119880AQ88',
            style: TextStyle(
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),

          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
            'Seat No.',
            style: TextStyle(
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            '1,2,3',
            style: TextStyle(
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
                ],
              ),
               Column(
                children: [
                   Text(
            'Total Amount',
            style: TextStyle(
                fontSize: 12.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500),
          ),
          Text(
            '₹4000',
            style: TextStyle(
                fontSize: 16.px,
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
