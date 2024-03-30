import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/string_extension.dart';

class SocialReach extends StatelessWidget {
    final int? totalParties;
  final int? totalFollowers;
  final int? totalFriends;
  const SocialReach({super.key, this.totalParties, this.totalFollowers, this.totalFriends});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(.1),
          border: Border.all(
              color: Theme.of(context).colorScheme.background.withOpacity(.5), width: .1.w)),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:  StringExtension.formatAmount(totalParties ?? 0),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Theme.of(context).colorScheme.background)),
                  TextSpan(
                      text: ' ${UserProfileScreenConstants.parties}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.background))
                ],
              ),
            ),
            SizedBox(width: 2.w,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: StringExtension.formatAmount(totalFollowers ?? 0),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Theme.of(context).colorScheme.background)),
                  TextSpan(
                      text: ' ${UserProfileScreenConstants.followers}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                         letterSpacing: -0.5,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.background))
                ],
              ),
            ),
            SizedBox(width: 2.w,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: StringExtension.formatAmount(totalFriends ?? 0),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Theme.of(context).colorScheme.background)),
                  TextSpan(
                      text: ' ${UserProfileScreenConstants.friends}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.background))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
