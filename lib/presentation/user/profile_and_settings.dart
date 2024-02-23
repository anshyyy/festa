import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/auth/profile/profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/delete_ac_modal.dart';
import '../widgets/snackbar_alert.dart';

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
              .navigateTo(AuthRoutes.authRoute, isClearStack: true);
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
          Provider.of<AppStateNotifier>(context).updateAfterAuthChange(
            isAuthorized: false,
          );
          navigator<NavigationService>().navigateTo(AuthRoutes.authRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: UserProfileScreenConstants.profileAndSettings,
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: CustomTextField(
                        // controller: state.phoneController,
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

                        // onChanged: (value) => context
                        //     .read<AuthCubit>()
                        //     .onPhoneChange(text: value),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  image: state.user!.profileImage != null
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              state.user!.profileImage),
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              .copyWith(fontSize: 16.sp),
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
                          Container(
                            height: 15.w,
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20)),
                            child: QrImageView(
                              data: '76118762418',
                              eyeStyle: QrEyeStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  eyeShape: QrEyeShape.square),
                              dataModuleStyle: QrDataModuleStyle(
                                  color:
                                      Theme.of(context).colorScheme.background),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: GestureDetector(
                        // onTap: () {
                        //   navigator<NavigationService>()
                        //       .navigateTo(UserRoutes.personalizeExperienceRoute);
                        // },
                        child: Container(
                          width: 100.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.w),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  // image: NetworkImage(
                                  //     'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=2148&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      UserProfileScreenConstants
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
                                          .copyWith(fontSize: 16.sp),
                                    )
                                  ],
                                ),
                              ),
                              SvgPicture.asset(AssetConstants.arrowRight)
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
                        SettingTile(
                          prefixIcon: AssetConstants.accountSettings,
                          label: UserProfileScreenConstants.accountSettings,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.notificationSettings,
                          label: UserProfileScreenConstants.notifications,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.activitiesSettings,
                          label: UserProfileScreenConstants.yourActivities,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.privacySettings,
                          label: UserProfileScreenConstants.privacy,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.blockedSettings,
                          label: UserProfileScreenConstants.blockedUsers,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.heartSettings,
                          label: UserProfileScreenConstants.tellAFriend,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.helpSettings,
                          label: UserProfileScreenConstants.help,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.feedbackSettings,
                          label: UserProfileScreenConstants.feedback,
                          suffixIcon: AssetConstants.arrowRight,
                        ),
                        SettingTile(
                          prefixIcon: AssetConstants.starSettings,
                          label: UserProfileScreenConstants.rateInPlayStore,
                          suffixIcon: AssetConstants.upRightArrows,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                                Text(UserProfileScreenConstants.logout)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.3.w),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const DeleteAccountModal();
                                },
                              ).then((value) {
                                if (value) {
                                  context.read<ProfileCubit>().deleteAccount();
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
                                Text(UserProfileScreenConstants.deleteAccount)
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
              ),
            ),
          ),
        );
      },
    );
  }
}

class SettingTile extends StatelessWidget {
  final String prefixIcon;
  final String label;
  final String suffixIcon;
  const SettingTile({
    super.key,
    required this.prefixIcon,
    required this.label,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.surface,
      child: Container(
        height: 5.h,
        // color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 3.w),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  prefixIcon,
                  height: 3.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.5.sp),
                )
              ],
            ),
            SvgPicture.asset(
              suffixIcon,
              height: 2.5.h,
            )
          ],
        ),
      ),
    );
  }
}
