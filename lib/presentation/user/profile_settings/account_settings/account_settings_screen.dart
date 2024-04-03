import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../application/user/account_settings_cubit/account_settings_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/extensions/string_extension.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../widgets/custom_appbar.dart';
import '../widgets/setting_tile.dart';

class AccountSettingScreen extends StatelessWidget {
  final int userId;
  const AccountSettingScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => AccountSettingsCubit(AccountSettingsState.initial(
          serverUrl: appConfig.serverUrl, userId: userId)),
      child: const AccountSettingScreenConsumer(),
    );
  }
}

class AccountSettingScreenConsumer extends StatelessWidget {
  const AccountSettingScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSettingsCubit, AccountSettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final AppStateNotifier appStateNotifier =
            Provider.of<AppStateNotifier>(context);
        final user = appStateNotifier.user;
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: CustomAppBar(
                  title: ProfileAndSettingsScreenConstants.accountSettings,
                  leading: GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft),
                    ),
                  ),
                  actions: const [],
                ),
                body: Column(
                  children: [
                    SettingTile(
                      prefixIcon: AssetConstants.emailIcon,
                      label: AccountSettingScreenConstants.accountPrivacy,
                      suffixIcon: AssetConstants.arrowRight,
                      detail: user!.isPrivateAccount ? 'Private' : 'Public',
                      onTap: () => navigator<NavigationService>().navigateTo(
                          UserRoutes.accountPrivacyRoute,
                          queryParams: {
                            'isPrivateAccount': user.isPrivateAccount.toString()
                          }),
                    ),
                    SettingTile(
                      prefixIcon: AssetConstants.emailIcon,
                      label: AccountSettingScreenConstants.email,
                      suffixIcon: AssetConstants.arrowRight,
                      detail: user.email,
                      onTap: () => navigator<NavigationService>().navigateTo(
                        UserRoutes.emailScreenRoute,
                      ),
                    ),
                    SettingTile(
                        prefixIcon: AssetConstants.mobileIcon,
                        label: AccountSettingScreenConstants.phone,
                        suffixIcon: AssetConstants.arrowRight,
                        detail: user.phoneNumber,
                        onTap: () {
                          //    navigator<NavigationService>().navigateTo(
                          //   UserRoutes.phoneScreenRoute,
                          // );
                        }),
                    SettingTile(
                      prefixIcon: AssetConstants.usernameIcon,
                      label: AccountSettingScreenConstants.username,
                      suffixIcon: AssetConstants.arrowRight,
                      detail: user.tag != null ? '@${user.tag!.tag}' : '',
                      onTap: () => navigator<NavigationService>().navigateTo(
                          UserRoutes.usernameSettingsScreenRoute,
                          queryParams: {
                            'username': user.tag != null ? user.tag!.tag : '',
                          }),
                    ),
                    SettingTile(
                      prefixIcon: AssetConstants.candleIcon,
                      label: AccountSettingScreenConstants.dateOfBirth,
                      suffixIcon: AssetConstants.arrowRight,
                      detail: StringExtension.formatDateTimeNormal(
                          DateTime.parse(user.dob)),
                      onTap: () => navigator<NavigationService>().navigateTo(
                          UserRoutes.dateOfBirthSettingsScreenRoute,
                          queryParams: {'dob': user.dob}),
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
      },
    );
  }
}
