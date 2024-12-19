import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CancellationPolicyBottomSheet extends StatelessWidget {
  final String policy;

  const CancellationPolicyBottomSheet({
    super.key, 
    required this.policy,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface.withOpacity(0.99),
            colorScheme.surface.withOpacity(1),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Container(
                height: 0.6.h,
                width: 15.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(100),
                ),
              )
            ]
          ),
          SizedBox(height: 1.h),
          
          // Title
          Text(
            'Cancellation Policy',
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.h),
          
          // Policy content
          Text(
            policy,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              fontSize: 16.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}