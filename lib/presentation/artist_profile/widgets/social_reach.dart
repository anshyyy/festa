import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/extensions/string_extension.dart';

class SocialReach extends StatelessWidget {
  final int totalParties;
  final int totalFollowers;
  final int totalFriends;
  final int totalFootFall;
  const SocialReach(
      {super.key,
      required this.totalParties,
      required this.totalFollowers,
      required this.totalFriends, required this.totalFootFall});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(.1),
          border: Border.all(
              color: Theme.of(context).colorScheme.background, width: .1.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: StringExtension.formatAmount(totalParties),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background)),
                TextSpan(
                    text: ' Parties',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.background))
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: StringExtension.formatAmount(totalFollowers),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background)),
                TextSpan(
                    text: ' Followers',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.background))
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: StringExtension.formatAmount(totalFriends),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background)),
                TextSpan(
                    text: ' Friends',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.background))
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: StringExtension.formatAmount(totalFootFall),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background)),
                TextSpan(
                    text: ' Footfall',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.background))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
