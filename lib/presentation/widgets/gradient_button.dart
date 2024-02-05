import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/color_constants.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final Color? fontColor;
  final Color? showColor;
  final double height;
  final double width;
  const GradientButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      this.gradientColor1,
      this.gradientColor2,
      this.showColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    final gradientColor1Safe =
        (gradientColor2 ?? Theme.of(context).colorScheme.primary);

    final gradientColor2Safe =
        (gradientColor2 ?? Theme.of(context).colorScheme.secondary);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.5.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: showColor ??
                  Theme.of(context).colorScheme.secondary, // Shadow color
              blurRadius: 40, // Blur radius
              offset: const Offset(0, 0), // X,Y offset from the container
            ),
          ],
          gradient: LinearGradient(
              colors: [gradientColor1Safe, gradientColor2Safe],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Text(text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: fontColor ?? Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.w700,
                  )),
        ),
      ),
    );
  }
}
