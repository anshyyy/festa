
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 4.5.h,
        width: width ?? 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: .2.w,
              color: Theme.of(context).colorScheme.background,
            )),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}
