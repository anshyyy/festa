// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../application/user/user_profile/user_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/dynamic_link.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../core/profile_actions_modal.dart';
import '../widgets/custom_outlined_button.dart';
import 'widgets/user_profile_widget.dart';

class OtherUserProfileScreen extends StatelessWidget {
  final int userId;
  const OtherUserProfileScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => UserProfileCubit(UserProfileState.initial(
          serverUrl: appConfig.serverUrl, appStateNotifier: appStateNotifier))
        ..initOtherUserProfile(userId: userId),
      child: const OtherUserProfileScreenConsumer(),
    );
  }
}

class OtherUserProfileScreenConsumer extends StatelessWidget {
  const OtherUserProfileScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);

    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: state.isLoading
                ? const UserShimmer()
                : Stack(
                    children: [
                      Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer
                                  .withOpacity(.3)),
                          child: Stack(
                            children: [
                              state.coverImage != null &&
                                      state.coverImage!.isNotEmpty
                                  ? SizedBox(
                                      height: 100.h,
                                      width: 100.w,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            CustomImageProvider.getImageUrl(
                                                state.coverImage,
                                                ImageType.other),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : appStateNotifier.user!.id != state.userId
                                      ? const SizedBox()
                                      : Center(
                                          child: CustomOutlinedButton(
                                            onTap: () {
                                              context
                                                  .read<UserProfileCubit>()
                                                  .onSelectCoverImage();
                                            },
                                            text: UserProfileScreenConstants
                                                .uploadYourHighlight,
                                            textStyle:
                                                textTheme.bodySmall!.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: colorScheme.background,
                                            ),
                                            width: 35.w,
                                            height: 4.h,
                                          ),
                                        ),
                              SafeArea(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      appStateNotifier.user!.id != state.userId
                                          ? const SizedBox()
                                          : GestureDetector(
                                              onTap: () {
                                                navigator<NavigationService>()
                                                    .navigateTo(
                                                  UserRoutes
                                                      .profileAndSettingsRoute,
                                                )
                                                    .then((value) {
                                                  context
                                                      .read<UserProfileCubit>()
                                                      .fetchUserDetails(
                                                          id: state.userId);
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                      AssetConstants
                                                          .hamBurgerMenu),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         const Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: UserProfile(),
                          ),
                          SizedBox(height: 3.h,)
                        ],
                      ),
                      // state.qrExpandedView
                      1 == 2
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      height: 50.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: colorScheme.surface,
                                          border: Border.all(
                                            color: colorScheme.background,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.w)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.w),
                                      child: Center(
                                        child: QrImageView(
                                          data: DynamicLinkUtil.generateLink(
                                              AppConstants.user,
                                              state.userId.toString()),
                                          eyeStyle: QrEyeStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer,
                                              eyeShape: QrEyeShape.square),
                                          dataModuleStyle: QrDataModuleStyle(
                                              dataModuleShape:
                                                  QrDataModuleShape.square,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),

                      Positioned(
                        top: 8.h,
                        left: 5.w,
                        child: SizedBox(
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    navigator<NavigationService>().goBack();
                                  },
                                  child: SvgPicture.asset(
                                    AssetConstants.arrowLeft,
                                    width: 7.w,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return ProfileActionsModal(
                                          profileId: state.userId.toString(),
                                          profileType: 'user',
                                          profileName: state.user!.fullName,
                                          isBlocked: state.isBlocked,
                                          isFollowing: state.isFollowing,
                                          onTapBlockOrUnBlock: (val) {
                                            navigator<NavigationService>()
                                                .goBack(responseObject: {
                                              'key': 'blockOrUnblock',
                                              'val': val,
                                            });
                                          },
                                          onTapFollowOrUnfollow: (val) {
                                            navigator<NavigationService>()
                                                .goBack(responseObject: {
                                              'key': 'followOrUnfollow',
                                              'val': val,
                                            });
                                          },
                                        );
                                      },
                                    ).then((value) {
                                      if (value == null) return;

                                      if (value['key'] == 'followOrUnfollow') {
                                        if (value['val']) {
                                          context
                                              .read<UserProfileCubit>()
                                              .unFollowUser(id: state.userId);
                                        }
                                      } else if (value['key'] ==
                                          'blockOrUnblock') {
                                        if (value['val']) {
                                          context
                                              .read<UserProfileCubit>()
                                              .blockUser();
                                        } else {
                                          context
                                              .read<UserProfileCubit>()
                                              .unblockUser();
                                        }
                                      }
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    AssetConstants.hamBurgerMenu,
                                    width: 7.w,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      if (state.isBlocked)
                        Positioned(
                            top: 13.h,
                            child: SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: ClipRect(
                                  child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  color: Colors.black.withOpacity(0.1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          '${state.user!.fullName} is blocked!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                                fontSize: 18.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ))
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class UserShimmer extends StatelessWidget {
  const UserShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
// final textTheme = themeData.textTheme;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: 1.h,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: .5.w,
                    ),
                    Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: .5.w,
                    ),
                    Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.w)),
                ),
                Positioned(
                  top: -5.h,
                  // left: 40.w,
                  child: Center(
                    child: Container(
                      height: 20.w,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                              width: 1, color: colorScheme.background),
                          shape: BoxShape.circle),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
