import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color gradientColor1;
  final Color gradientColor2;
  final double height;
  final double width;
  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.5.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: gradientColor1.withOpacity(.3),
              offset: const Offset(2, 2),
              blurRadius: 50,
            ),
            BoxShadow(
              color: gradientColor2.withOpacity(.3),
              offset: const Offset(-2, -2),
              blurRadius: 50,
            ),
          ],
          gradient: LinearGradient(
              colors: [gradientColor1, gradientColor2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
