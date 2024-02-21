import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final void Function()? onTap;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final Color? fontColor;
  final Color? showColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
    this.isEnabled = true,
    this.gradientColor1,
    this.gradientColor2,
    this.showColor,
    this.fontColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColor1Safe =
        (gradientColor1 ?? Theme.of(context).colorScheme.primary);

    final gradientColor2Safe =
        (gradientColor2 ?? Theme.of(context).colorScheme.secondary);
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: height ?? 6.5.h,
        width: width ?? 100.w,
        decoration: isEnabled
            ? BoxDecoration(
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
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xff373737)),
        child: Center(
          child: Text(text,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: fontColor ??
                            Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w700,
                      )),
        ),
      ),
    );
  }
}
