import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/gradient_button.dart';

class AgreeToBlock extends StatelessWidget {
  const AgreeToBlock({
    super.key,

    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 5.w,
          right: 5.w),
      // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Text(
            'Are you sure you want to Block?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            '$name means that they won’t be able to message you or find your profile or content on Festa, You can unblock them at any time in settings.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomOutlinedButton(
            text: 'Yes',
            height: 6.h,
            onTap: () {
              navigator<NavigationService>().goBack(responseObject: true);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GradientButton(
            text: 'Cancel',
            onTap: () {
              navigator<NavigationService>().goBack();
            },
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15.5.sp,
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w600,
            ),
            height: 5.5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}