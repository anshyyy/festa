import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../widgets/custom_appbar.dart';
import 'widgets/accountPrivacyModalSheet.dart';

class AccountPrivacyScreen extends StatelessWidget {
  const AccountPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: AccountSettingScreenConstants.accountPrivacy,
        leading: GestureDetector(
          onTap: () {
            navigator<NavigationService>().goBack();
          },
          child: Center(
            child: SvgPicture.asset(AssetConstants.arrowLeft),
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AccountPrivacyScreenConstants.privateAccount,
                  style: textTheme.bodyMedium!.copyWith(
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background),
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              const AccountPrivacyModalSheet());
                    },
                    child: SvgPicture.asset(AssetConstants.accountSettings)),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              AccountPrivacyScreenConstants.accountPrivacyDescription,
              style: textTheme.bodySmall!.copyWith(
                fontSize: 15.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
