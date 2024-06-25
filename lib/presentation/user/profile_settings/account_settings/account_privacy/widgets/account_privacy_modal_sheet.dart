import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../domain/core/configs/injection.dart';
import '../../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../../domain/core/constants/string_constants.dart';
import '../../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../widgets/gradient_button.dart';

class AccountPrivacyModalSheet extends StatelessWidget {
  final bool isPrivate;
  final String title;
  final List<String> warnings;
  final String buttonText;
  final void Function() onPressed;

  const AccountPrivacyModalSheet({
    super.key,
    required this.title,
    required this.warnings,
    required this.onPressed,
    required this.buttonText,
    required this.isPrivate,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Center(
                  child: Text(
                    title,
                    style: textTheme.bodyMedium!
                        .copyWith(color: colorScheme.background),
                  ),
                )),
                GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: SvgPicture.asset(AssetConstants.closeIcon))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            ...warnings.map(
              (message) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetConstants.usernameIcon),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: Text(
                          message,
                          style: textTheme.bodySmall!.copyWith(
                              fontSize: 15.5.sp,
                              color: colorScheme.background.withOpacity(.7)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            GradientButton(
              text: buttonText,
              onTap: () {
                navigator<NavigationService>().goBack(
                  responseObject: !isPrivate,
                );
              },
              textStyle: textTheme.bodySmall!.copyWith(
                fontSize: 15.5.sp,
                color: colorScheme.background,
                fontWeight: FontWeight.w700,
              ),
              height: 5.5.h,
            ),
            SizedBox(
              height: .5.h,
            ),
            MaterialButton(
              onPressed: () {
                navigator<NavigationService>().goBack();
              },
              child: Text(
                AccountPrivacyScreenConstants.cancel,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
