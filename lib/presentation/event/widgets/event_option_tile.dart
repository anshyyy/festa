import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventOptionsTile extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;

  const EventOptionsTile({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                prefixIcon ?? const SizedBox(),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            suffixIcon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
