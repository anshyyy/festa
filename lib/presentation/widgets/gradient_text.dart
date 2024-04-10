import 'package:flutter/material.dart';
// background: linear-gradient(180deg, #FF1759 0%, #BF0036 100%);
class GradientText extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final TextStyle textStyle;

  const GradientText(
      {super.key,
      required this.text,
      required this.colors,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(
              Rect.fromLTWH(0, 1, bounds.width, bounds.height),
            ),
            child: Text(text, style: textStyle,),
            );
  }
}
