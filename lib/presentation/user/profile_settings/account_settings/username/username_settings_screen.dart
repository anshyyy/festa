import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/username_settings/username_settings_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';

class UsernameSettingsScreen extends StatelessWidget {
  final String username;
  const UsernameSettingsScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => UsernameSettingsCubit(UsernameSettingsState.initial(
          serverUrl: appConfig.serverUrl, username: username)),
      child: const UsernameSettingsScreenConsumer(),
    );
  }
}

class UsernameSettingsScreenConsumer extends StatelessWidget {
  const UsernameSettingsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);

    return BlocConsumer<UsernameSettingsCubit, UsernameSettingsState>(
      listener: (context, state) {
        if (!state.isUsernameUpdateFailure &&
            state.isUsernameUpdateSuccess &&
            state.user != null) {
          appStateNotifier.updateUser(
            user: state.user,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: AccountSettingScreenConstants.username,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft, width: 7.w,))),
              actions: const []),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                  controller: state.usernameInputController,
                  borderLess: true,
                  suffixIcon: state.isLoading
                      ? Image.asset(
                          AssetConstants.bubbleLoader,
                          height: 3.5.h,
                        )
                      : state.isUsernameUpdateSuccess
                          ? SvgPicture.asset(AssetConstants.circledTick,
                              height: 3.h,
                              colorFilter: ColorFilter.mode(
                                  colorScheme.inversePrimary, BlendMode.srcIn))
                          : state.isUsernameUpdateFailure
                              ? SvgPicture.asset(AssetConstants.stopIcon,
                                  height: 3.h,
                                  colorFilter: ColorFilter.mode(
                                      colorScheme.error, BlendMode.srcIn))
                              : GestureDetector(
                                  onTap: () {
                                    context
                                        .read<UsernameSettingsCubit>()
                                        .clearTextField();
                                  },
                                  child: SvgPicture.asset(
                                      AssetConstants.closeIcon)),
                  hintText: UsernameScreenConstants.typeHere,
                  hintTextStyle: textTheme.bodyLarge!.copyWith(
                      color: colorScheme.secondaryContainer.withOpacity(.5)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.w),
                  // isUpload: true,
                  textStyle: textTheme.bodyLarge!
                      .copyWith(color: colorScheme.background),
                  onChanged: (text) {
                    context
                        .read<UsernameSettingsCubit>()
                        .onUsernameChange(text: text);
                  },
                  errorStyle:
                      textTheme.bodySmall!.copyWith(color: colorScheme.error),
                ),
                SizedBox(
                  height: state.hasError ? 2.h : 0,
                ),
                Text(
                  UsernameSettingsScreenConstants.chooseNewUsernameMessage,
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background.withOpacity(.7),
                    fontSize: 15.5.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  UsernameSettingsScreenConstants.usernameCanConsistMessage,
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 15.5.sp,
                    color: colorScheme.background.withOpacity(.7),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  UsernameSettingsScreenConstants.inMostCasesMessage,
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 15.5.sp,
                    color: colorScheme.background.withOpacity(.7),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Spacer(),
                GradientButton(
                  isEnabled: state.isUpdateEnabled,
                  text: UsernameSettingsScreenConstants.updateUsername,
                  onTap: () {
                    context.read<UsernameSettingsCubit>().onUpdateUsername();
                  },
                  // isEnabled: state.usernameInputController.text.isNotEmpty &&
                  //     !state.hasError,
                  textStyle: textTheme.bodySmall!.copyWith(
                    fontSize: 15.5.sp,
                    color: !state.isUpdateEnabled
                        ? colorScheme.secondaryContainer
                        : colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                  height: 5.5.h,
                ),
                SizedBox(
                  height: .5.h,
                ),
                MaterialButton(
                  minWidth: 100.w,
                  onPressed: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Text(
                    UsernameSettingsScreenConstants.cancel,
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
      },
    );
  }
}
