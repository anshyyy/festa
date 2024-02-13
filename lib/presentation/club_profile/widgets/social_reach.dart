
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SocialReach extends StatelessWidget {
  const SocialReach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
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
                    text: '30 ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    text: '300K ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    text: '300K ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
        ],
      ),
    );
  }
}
