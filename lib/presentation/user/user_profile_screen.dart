// ignore_for_file: unused_local_variable

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
import '../widgets/custom_outlined_button.dart';
import 'widgets/user_profile_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const UserProfileScreenConsumer();
  }
}

class UserProfileScreenConsumer extends StatelessWidget {
  const UserProfileScreenConsumer({
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
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const UserShimmer()
              : Stack(
                  children: [
                    Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                            color:
                                colorScheme.secondaryContainer.withOpacity(.3)),
                        child: Stack(
                          children: [
                            state.coverImage != null &&
                                    state.coverImage!.isNotEmpty
                                ? SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: CachedNetworkImage(
                                      imageUrl: CustomImageProvider.getImageUrl(
                                          state.coverImage, ImageType.other),
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
                            appStateNotifier.user!.id != state.userId
                                ? const SizedBox()
                                : SafeArea(
                                    child: GestureDetector(
                                      onTap: () {
                                        navigator<NavigationService>()
                                            .navigateTo(
                                          UserRoutes.profileAndSettingsRoute,
                                        )
                                            .then((value) {
                                          context
                                              .read<UserProfileCubit>()
                                              .fetchUserDetails(
                                                  id: state.userId);
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.w, top: 1.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SvgPicture.asset(AssetConstants
                                                    .hamBurgerMenu,width: 7.w),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        )),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UserProfile(),
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
                        : const SizedBox()
                  ],
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
