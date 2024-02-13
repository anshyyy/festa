import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreTile extends StatelessWidget {
  final String? label;
  final String? svgIcon;
  const ExploreTile({super.key, this.label, this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            label != null
                ? Text(
                    label!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                  )
                : const SizedBox(),
            SizedBox(
              width: 0.5.h,
            ),
            svgIcon != null
                ? SvgPicture.asset(
                    svgIcon!,
                    height: 8,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}