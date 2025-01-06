import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../infrastructure/core/dtos/cancellation_policy/cancellation_policy.dart';

class CancellationPolicyBottomSheet extends StatelessWidget {
  final CancellationPolicy policy;

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
              ),
            ],
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

          // Intro
          Text(
            policy.intro,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              fontSize: 16.sp,
              height: 1.5,
            ),
          ),
          SizedBox(height: 2.h),

          // Policy Details
          Expanded(
            child: ListView.builder(
              itemCount: policy.policyDetails.length,
              itemBuilder: (context, index) {
                final detail = policy.policyDetails[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 1.5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        detail.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background.withOpacity(0.8),
                          fontSize: 14.sp,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Acknowledgment
          SizedBox(height: 2.h),
          Text(
            policy.acknowledgment,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              fontSize: 14.sp,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),

          // Note
          SizedBox(height: 1.h),
          Text(
            policy.note,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
