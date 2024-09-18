import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screen_brightness/screen_brightness.dart';

class QrViewer extends StatelessWidget {
  const QrViewer({super.key, required this.bookingReferenceId});
  final String bookingReferenceId;

  Future<void> _setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Store the current brightness
        final currentBrightness = await ScreenBrightness().current;

        // Set brightness to maximum
        await _setBrightness(1.0);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.white,
                  child: QrImageView(
                    data: bookingReferenceId,
                    size: 90.w, // Use 90% of screen width
                    backgroundColor: Colors.white,
                    eyeStyle: const QrEyeStyle(
                      color: Colors.black,
                      eyeShape: QrEyeShape.square,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ).then((_) async {
          // Restore the original brightness when the dialog is closed
          await _setBrightness(currentBrightness);
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: QrImageView(
            data: bookingReferenceId,
            size: 25.h,
            backgroundColor: Colors.white,
            eyeStyle: const QrEyeStyle(
              color: Colors.black,
              eyeShape: QrEyeShape.square,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}