import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../widgets/setting_tile.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountSettingScreenConsumer();
  }
}

class AccountSettingScreenConsumer extends StatelessWidget {
  const AccountSettingScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: UserProfileScreenConstants.accountSettings,
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
      body: Column(
        children: [
          SettingTile(
            prefixIcon: AssetConstants.emailIcon,
            label: AccountSettingScreenConstants.accountPrivacy,
            suffixIcon: AssetConstants.arrowRight,
            detail: 'Private',
            onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.accountPrivacyRoute,
            ),
          ),
          SettingTile(
            prefixIcon: AssetConstants.emailIcon,
            label: AccountSettingScreenConstants.email,
            suffixIcon: AssetConstants.arrowRight,
            detail: 'mrpramodjadhav.design.comddddddddddd',
            onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.emailScreenRoute,
            ),
          ),
          SettingTile(
            prefixIcon: AssetConstants.mobileIcon,
            label: AccountSettingScreenConstants.phone,
            suffixIcon: AssetConstants.arrowRight,
            detail: '+91 9987731025',
            onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.phoneScreenRoute,
            ),
          ),
          SettingTile(
            prefixIcon: AssetConstants.usernameIcon,
            label: AccountSettingScreenConstants.username,
            suffixIcon: AssetConstants.arrowRight,
            detail: 'mrpramodjadhav',
            onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.usernameSettingsScreenRoute,
            ),
          ),
          SettingTile(
            prefixIcon: AssetConstants.candleIcon,
            label: AccountSettingScreenConstants.dateOfBirth,
            suffixIcon: AssetConstants.arrowRight,
            detail: '13 May 1997',
            onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.dateOfBirthSettingsScreenRoute,
            ),
          ),
          // SettingTile(
          //   prefixIcon: AssetConstants.lockIcon,
          //   label: AccountSettingScreenConstants.password,
          //   suffixIcon: AssetConstants.arrowRight,
          //   detail: 'Change',
          //   onTap: () {},
          // ),
          SettingTile(
            prefixIcon: AssetConstants.deleteBinIcon,
            label: AccountSettingScreenConstants.deleteAccount,
            suffixIcon: AssetConstants.arrowRight,
             onTap: () => navigator<NavigationService>().navigateTo(
              UserRoutes.deleteAccountScreenRoute,
            ),
          ),
        ],
      ),
    );
  }
}
