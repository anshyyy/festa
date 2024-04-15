import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/account_privacy/account_privacy_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../widgets/custom_appbar.dart';
import 'widgets/account_privacy_modal_sheet.dart';

class AccountPrivacyScreen extends StatelessWidget {
  final bool isPrivateAccount;
  const AccountPrivacyScreen({super.key, required this.isPrivateAccount});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => AccountPrivacyCubit(AccountPrivacyState.initial(
          serverUrl: appConfig.serverUrl, isPrivate: isPrivateAccount)),
      child: AccountPrivacyScreenConsumer(
        textTheme: textTheme,
        colorScheme: colorScheme,
      ),
    );
  }
}

class AccountPrivacyScreenConsumer extends StatelessWidget {
  const AccountPrivacyScreenConsumer({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountPrivacyCubit, AccountPrivacyState>(
      listener: (context, state) {
        
        if (state.isSuccess && !state.isFailure) {
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateUser(
            user: state.user,
          );
        }
      },
      builder: (context, state) {
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
            actions: const [],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        // context
                        //     .read<AccountPrivacyCubit>()
                        //     .switchAccount(isPrivate: !state.isPrivate);
                        !state.isPrivate
                            ? showModalBottomSheet(
                                context: context,
                                builder: (context) => AccountPrivacyModalSheet(
                                  isPrivate: state.isPrivate,
                                  title: AccountPrivacyScreenConstants
                                      .switchToPrivate,
                                  onPressed: () {},
                                  buttonText: AccountPrivacyScreenConstants
                                      .switchToPrivateBtnText,
                                  warnings: [
                                    AccountPrivacyScreenConstants
                                        .onlyFollowersCanSee,
                                    AccountPrivacyScreenConstants
                                        .thisWontChange,
                                    AccountPrivacyScreenConstants
                                        .youCanAlwaysGoPublic,
                                  ],
                                ),
                              ).then((value) {
                                final bool isPrivate = value ?? state.isPrivate;

                                context
                                    .read<AccountPrivacyCubit>()
                                    .switchAccount(isPrivate: isPrivate);
                              })
                            : showModalBottomSheet(
                                context: context,
                                builder: (context) => AccountPrivacyModalSheet(
                                  isPrivate: state.isPrivate,
                                  title: AccountPrivacyScreenConstants
                                      .switchToPublic,
                                  onPressed: () {},
                                  buttonText: AccountPrivacyScreenConstants
                                      .switchToPublicBtnText,
                                  warnings: [
                                    AccountPrivacyScreenConstants
                                        .anyoneCanSeeYourProfile,
                                    AccountPrivacyScreenConstants
                                        .thisWontChange,
                                    AccountPrivacyScreenConstants
                                        .youCanAlwaysGoPrivate,
                                  ],
                                ),
                              ).then((value) {
                                final bool isPrivate = value ?? state.isPrivate;
                                context
                                    .read<AccountPrivacyCubit>()
                                    .switchAccount(isPrivate: isPrivate);
                              });
                      },
                      // onTap: () {
                      // },
                      child: AnimatedContainer(
                        height: 2.9.h,
                        width: 10.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: .7.w, vertical: .7.w),
                        alignment: state.isPrivate
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: state.isPrivate
                                  ? [colorScheme.primary, colorScheme.secondary]
                                  : [
                                      colorScheme.secondaryContainer
                                          .withOpacity(.5),
                                      colorScheme.secondaryContainer
                                          .withOpacity(.5)
                                    ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                        child: Container(
                          width: 5.w,
                          height: 2.7.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorScheme.background),
                        ),
                      ),
                    ),
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
      },
    );
  }
}
