import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/gradient_button.dart';

class FreeBookingScreen extends StatelessWidget {
  const FreeBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Scaffold(
      bottomNavigationBar: Container(
        height: 13.5.h,
        color: colorScheme.surface,
        padding: EdgeInsets.only(top: 5.w, left: 5.w, right: 5.w, bottom: 11.w),
        child: GradientButton(
            text: FreeBookingScreenConstants.gotoTickets,
            textStyle: textTheme.bodySmall!.copyWith(
              color: colorScheme.background,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              navigator<NavigationService>().navigateTo(UserRoutes.mainNavRoute,
              isClearStack: true,
                  queryParams: {'routeIndex': '2'});
            }),
      ),
      appBar: CustomAppBar(
          title: 'Bollywood night 2023',
          leading: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Center(child: SvgPicture.asset(AssetConstants.arrowLeft))),
          actions: const []),
      body: Column(
        children: [
          Container(
            height: 31.h,
            padding: EdgeInsets.symmetric(vertical: 9.w),
            child: Center(
              child: SizedBox(
                
                child: QrImageView(
                  data: '1234567890',
                  eyeStyle: QrEyeStyle(
                      color: colorScheme.background,
                      eyeShape: QrEyeShape.square),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                      color: colorScheme.background,),
                ),
              ),
            ),
          ),
          Container(
            height: 34.5.h,
            width: 78.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FreeBookingScreenConstants.whatHappenNext,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2.h),
                Text(
                  FreeBookingScreenConstants.qrCodeAdded,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 1.h),
                Text(
                  FreeBookingScreenConstants.qrCodeAddedDescription,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall!.copyWith(),
                ),
                SizedBox(height: 2.h),
                Text(
                  FreeBookingScreenConstants.markYourCalendar,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 1.h),
                Text(
                  FreeBookingScreenConstants.markYourCalendarDescription,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall!.copyWith(),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetConstants.shareIcon),
              SizedBox(width: 1.w,),
                  Text(
                  FreeBookingScreenConstants.shareQrWithFriend,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w700),
                ),
            ],
          ),
          SizedBox(height: 2.h,)
        ],
      ),
    );
  }
}
