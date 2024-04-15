import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QrViewer extends StatelessWidget {
  const QrViewer({super.key, required this.bookingReferenceId});

  final String bookingReferenceId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: bookingReferenceId,
        size: 25.h,
        eyeStyle: QrEyeStyle(
          color: Theme.of(context).colorScheme.background,
          eyeShape: QrEyeShape.square,
        ),
        dataModuleStyle: QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
