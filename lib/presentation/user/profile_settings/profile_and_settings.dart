import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/auth/profile/profile_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/delete_ac_modal.dart';
import '../../widgets/snackbar_alert.dart';
import 'widgets/setting_tile.dart';

class ProfileAndSettingsScreen extends StatelessWidget {
  const ProfileAndSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileState.initial(
          appStateNotifier: appStateNotifier, serverUrl: appConfig.serverUrl)),
      child: const ProfileAndSettingsScreenConsumer(),
    );
  }
}

class ProfileAndSettingsScreenConsumer extends StatelessWidget {
  const ProfileAndSettingsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.isLogout && state.responseMsg.isNotEmpty) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.responseMsg,
          );

          context.read<ProfileCubit>().emitFromAnywhere(
                state: state.copyWith(
                  isLogout: false,
                  isLoading: false,
                  responseMsg: '',
                ),
              );
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateAfterAuthChange(isAuthorized: false, user: null);
          Future.delayed(const Duration(milliseconds: 100));

          navigator<NavigationService>()
              .navigateTo(AuthRoutes.loginWithPhoneRoute, isClearStack: true);
        } else if (state.isFailure && state.responseMsg.isNotEmpty) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.responseMsg,
          );
          context.read<ProfileCubit>().emitFromAnywhere(
                state: state.copyWith(
                  isFailure: false,
                  responseMsg: '',
                ),
              );
        } else if (state.isAccountDelete &&
            !state.isFailure &&
            state.responseMsg.isNotEmpty) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.responseMsg,
          );
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateAfterAuthChange(
            isAuthorized: false,
          );
          navigator<NavigationService>()
              .navigateTo(AuthRoutes.loginWithPhoneRoute);
        }
      },
      builder: (context, state) {
        final themeData = Theme.of(context);
        // final colorScheme = themeData.colorScheme;
        // final textTheme = themeData.textTheme;

        return Scaffold(
          appBar: CustomAppBar(
              title: ProfileAndSettingsScreenConstants.profileAndSettings,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
              actions: []),
          body: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: state.isLoading,
              blur: 1.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: CustomTextField(
                        controller: state.menuSearchController,
                        width: 90.w,
                        prefixIcon: SvgPicture.asset(
                          AssetConstants.searchIcon,
                          height: 3.5.h,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        keyboardType: TextInputType.text,
                        // height: 8.5.h,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 1.3.h),
                        maxLines: 1,
                        isFill: true,
                        inputWithLabel: false,
                        fillColor: Theme.of(context).colorScheme.surface,
                        hintText: AppConstants.search,
                        hintTextStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                // fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.5.sp),
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                // fontSize: 17.sp,
                                color:
                                    Theme.of(context).colorScheme.background),
                        errorStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),

                        onChanged: (value) => context
                            .read<ProfileCubit>()
                            .onMenuSearch(query: value),
                      ),
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15.w,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              width: .5.w,
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: CachedNetworkImageProvider(
                                                  state.user!.profileImage),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.user!.fullName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                          ),
                                          GestureDetector(
                                            // onTap: () {
                                            //   navigator<NavigationService>().navigateTo(
                                            //       UserRoutes.editProfileRoute);
                                            // },
                                            child: Row(
                                              children: [
                                                Text(
                                                  EditProfileScreenConstants
                                                      .editProfile,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(),
                                                ),
                                                SvgPicture.asset(
                                                    AssetConstants.arrowRight)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   height: 15.w,
                                  //   width: 15.w,
                                  //   decoration: BoxDecoration(
                                  //       color: Theme.of(context)
                                  //           .colorScheme
                                  //           .primaryContainer,
                                  //       borderRadius: BorderRadius.circular(20)),
                                  //   child: QrImageView(
                                  //     data: '76118762418',
                                  //     eyeStyle: QrEyeStyle(
                                  //         color:
                                  //             Theme.of(context).colorScheme.background,
                                  //         eyeShape: QrEyeShape.square),
                                  //     dataModuleStyle: QrDataModuleStyle(
                                  //         color:
                                  //             Theme.of(context).colorScheme.background),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: GestureDetector(
                                onTap: () {
                                  navigator<NavigationService>().navigateTo(
                                      UserRoutes.personalizeExperienceRoute);
                                },
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 4.w),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          opacity: .9,
                                          image: Image.asset(
                                            AssetConstants.personalizeBcg,
                                          ).image),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: .2.w,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ProfileAndSettingsScreenConstants
                                                  .personalizeYourExperience,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Building your profile will increase visibility and recommendations.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(fontSize: 15.5.sp),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      SvgPicture.asset(
                                          AssetConstants.arrowRight)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: OtherConstants.settingsMenu.length,
                                  itemBuilder: (context, index) {
                                    final currentMenu =
                                        OtherConstants.settingsMenu[index];
                                    return SettingTile(
                                        prefixIcon: currentMenu.icon,
                                        label: currentMenu.title,
                                        suffixIcon: AssetConstants.arrowRight,
                                        onTap: currentMenu
                                                .navigationRoute.isEmpty
                                            ? null
                                            : () {
                                                navigator<NavigationService>()
                                                    .navigateTo(currentMenu
                                                        .navigationRoute,
                                                         queryParams: {
                                                    'userId': state.user!.id
                                                        .toString()
                                                  }
                                                        );
                                              });
                                  },
                                ),
                                // SettingTile(
                                //   prefixIcon: AssetConstants.accountSettings,
                                //   label:
                                //       ProfileAndSettingsScreenConstants.accountSettings,
                                //   suffixIcon: AssetConstants.arrowRight,
                                //   onTap: () => navigator<NavigationService>()
                                //       .navigateTo(UserRoutes.accountSettingsRoute),
                                // ),s
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<ProfileCubit>().logout();
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.logout,
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(ProfileAndSettingsScreenConstants
                                            .logout)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.3.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const DeleteAccountModal();
                                        },
                                      ).then((value) {
                                        if (value) {
                                          context
                                              .read<ProfileCubit>()
                                              .deleteAccount();
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.trash,
                                          height: 2.2.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(ProfileAndSettingsScreenConstants
                                            .deleteAccount)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                        state.settingsMenu.isNotEmpty
                            ? Container(
                                height: 100.h,
                                width: 100.h,
                                color: themeData.scaffoldBackgroundColor,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.settingsMenu.length,
                                  itemBuilder: (context, index) {
                                    final currentMenu =
                                        state.settingsMenu[index];
                                    return SettingTile(
                                      prefixIcon: currentMenu.icon,
                                      label: currentMenu.title,
                                      suffixIcon: AssetConstants.arrowRight,
                                      onTap: currentMenu.navigationRoute.isEmpty
                                          ? null
                                          : () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .clearMenuSearch();
                                              navigator<NavigationService>()
                                                  .navigateTo(
                                                      currentMenu
                                                          .navigationRoute,
                                                      queryParams: {
                                                    'userId': state.user!.id
                                                        .toString()
                                                  });
                                            },
                                    );
                                  },
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
