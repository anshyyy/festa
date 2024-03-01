import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingTile extends StatelessWidget {
  final String prefixIcon;
  final String label;
  final String suffixIcon;
  final String? detail;
  final void Function() onTap;
  const SettingTile({
    super.key,
    required this.prefixIcon,
    required this.label,
    required this.suffixIcon,
    required this.onTap,
    this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.surface,
      child: Container(
        height: 5.h,
        // color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 3.w),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  prefixIcon,
                  height: 3.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.5.sp),
                ),
              ],
            ),
            SizedBox(width: 20.w,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        detail ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 16.5.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SvgPicture.asset(
                    suffixIcon,
                    height: 2.5.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
