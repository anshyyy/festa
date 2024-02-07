import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundedArrowButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Function()? onTap;
  final bool? isEnabled;
  final String? contentIcon;
  // final

  const RoundedArrowButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    required this.onTap,
    this.isEnabled,
    this.contentIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 6.h,
        width: width ?? 6.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEnabled! ? Colors.white : Theme.of(context).colorScheme.onBackground,
        ),
        child: Center(
          child: contentIcon != null
              ? SvgPicture.asset(
                  contentIcon.toString(),
                  color: Colors.black,
                  height: 5.h,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
