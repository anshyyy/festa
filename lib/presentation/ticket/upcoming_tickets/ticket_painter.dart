import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TicketPainter extends CustomPainter {
  final Color gradientColor1;
  final Color borderColor;
  // final Color gradientColor2;
  const TicketPainter({required this.gradientColor1, required this.borderColor, });

  static const _cornerGap = 20.0;
  static final double _cutoutRadius = 2.6.h;
  static final double _cutoutDiameter = _cutoutRadius * 2;

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = maxHeight - maxHeight * .6;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius - 1.w;
    double dottedLineStartX = _cutoutRadius;
    final double dottedLineEndX = maxWidth - _cutoutRadius;
    double dashWidth = 1.57.w;
    double dashSpace = dashWidth;
    double dottedLineStartX2 = _cutoutRadius + dashSpace;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [gradientColor1,gradientColor1.withOpacity(.7), Colors.black.withOpacity(0)],
        stops: const [0, .5,1]
      ).createShader(
          Rect.fromPoints(const Offset(0.0, 00.0), Offset(size.width, size.height)));
    // ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = borderColor
      ..strokeWidth = .5;

    var path = Path();
    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX-1.5.w) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY + 1.5.w),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }

    while (dottedLineStartX2 < dottedLineEndX - 1.5.w) {
      canvas.drawLine(
        Offset(dottedLineStartX2, dottedLineY),
        Offset(dottedLineStartX2 + dashWidth, dottedLineY + 1.5.w),
        paintDottedLine,
      );
      dottedLineStartX2 += dashWidth + dashSpace;
    }
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
