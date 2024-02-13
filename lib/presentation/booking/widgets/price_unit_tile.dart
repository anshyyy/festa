import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PriceUnit extends StatelessWidget {
  final String title;
  final String detail;
  const PriceUnit({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                )),
        Text(detail,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600,
                   fontSize: 15.sp,
                )),
      ],
    );
  }
}
