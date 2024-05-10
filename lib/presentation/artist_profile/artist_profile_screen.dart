// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/artist/artist_cubit.dart';
import '../../application/report/report_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../core/profile_action_tile.dart';
import '../main_nav/bottom_nav.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_button.dart';
import 'widgets/artist_profile.dart';
import 'widgets/media_viewer_tabs.dart';

class ArtistProfileScreen extends StatelessWidget {
  final int artistId;
  const ArtistProfileScreen({super.key, required this.artistId});

  @override
  Widget build(BuildContext context) {
    final appconfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ArtistCubit(ArtistState.initial(
          artistId: artistId, serverUrl: appconfig.serverUrl))
        ..init(),
      child: const ArtistProfileScreenConsumer(),
    );
  }
}

class ArtistProfileScreenConsumer extends StatelessWidget {
  const ArtistProfileScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const UserShimmer()
              : Scaffold(
                  bottomNavigationBar: CustomBottomNav(
                      onTabChange: (v) {},
                      isTabScreen: false,
                      currentIndex:
                          Provider.of<AppStateNotifier>(context, listen: false)
                                  .menuIndex ??
                              0),
                  body: Stack(
                    children: [
                      Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  state.artistProfile!.coverImage,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox.expand(
                        child: DraggableScrollableSheet(
                          initialChildSize: .5,
                          minChildSize: .5,
                          controller: state.dragController,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                                controller: scrollController,
                                child: Container(
                                    margin: EdgeInsets.only(top: 5.h),
                                    child: Column(children: [
                                      AnimatedContainer(
                                        curve: Curves.bounceInOut,
                                        duration: const Duration(seconds: 4),
                                        child: state.isAtTop
                                            ? Container(
                                                alignment: Alignment.center,
                                                width: 100.w,
                                                height: 0.h,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                              )
                                            : const ArtistProfile(),
                                      ),
                                      // MediaGrid(),
                                      MediaViewerTabs(
                                        artistId: state.artistId,
                                      ),
                                    ])));
                          },
                        ),
                      ),
                      Positioned(
                        top: 6.5.h,
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
                                child: Center(
                                    child: SvgPicture.asset(
                                        AssetConstants.arrowLeft,
                                        width: 7.w)),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return ProfileActionsModal(
                                          profileName:
                                              state.artistProfile!.fullName,
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
                                        context
                                            .read<ArtistCubit>()
                                            .followUnfollowArtist();
                                      } else if (value['key'] ==
                                          'blockOrUnblock') {
                                        context
                                            .read<ArtistCubit>()
                                            .blockOrUnblockArtist(
                                                isBlock: value['val']);
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
                            top: 11.h,
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
                                          '${state.artistProfile!.fullName} is blocked!',
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
    final textTheme = themeData.textTheme;

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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileActionsModal extends StatelessWidget {
  final String profileName;
  final String profileId;
  final bool isFollowing;
  final bool isBlocked;
  final Function(bool)? onTapFollowOrUnfollow;
  final Function(bool)? onTapBlockOrUnBlock;

  const ProfileActionsModal({
    super.key,
    this.profileId = '',
    this.onTapFollowOrUnfollow,
    this.onTapBlockOrUnBlock,
    this.isFollowing = false,
    this.isBlocked = false,
    this.profileName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                height: 1.5.h,
              ),
              Text(
                profileName,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              if (!isBlocked)
                ProfileActionTile(
                  prefixIcon: SvgPicture.asset(
                    isFollowing
                        ? AssetConstants.closeIcon
                        : AssetConstants.followIcon,
                    height: 6.w,
                  ),
                  onTap: () {
                    if (isFollowing) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return AgreeToUnfollowModalSheet(
                                textTheme: Theme.of(context).textTheme,
                                colorScheme: Theme.of(context).colorScheme,
                                name: profileName);
                          }).then((value) {
                        if (value != null) {
                          // unfollow
                          onTapFollowOrUnfollow!(true);
                        }
                      });
                    } else {
                      onTapFollowOrUnfollow!(false);
                    }
                  },
                  title: isFollowing ? 'Unfollow' : 'Follow',
                ),
              ProfileActionTile(
                onTap: () {
                  if (!isBlocked) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AgreeToBlock(
                            textTheme: Theme.of(context).textTheme,
                            colorScheme: Theme.of(context).colorScheme,
                            name: profileName,
                          );
                        }).then((value) {
                      if (value != null) {
                        //block
                        onTapBlockOrUnBlock!(true);
                      }
                    });
                  } else {
                    onTapBlockOrUnBlock!(false);
                  }
                },
                prefixIcon: SvgPicture.asset(
                  AssetConstants.userBlock,
                  height: 6.w,
                ),
                title: isBlocked ? 'Unblock' : 'Block',
              ),
              ProfileActionTile(
                onTap: () {
                  navigator<NavigationService>().goBack();
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ReportArtistModalSheet(
                          id: profileId,
                          name: profileName,
                        );
                      });
                },
                prefixIcon: SvgPicture.asset(
                  AssetConstants.gradientReport,
                  height: 6.w,
                ),
                title: 'Report',
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AgreeToUnfollowModalSheet extends StatelessWidget {
  const AgreeToUnfollowModalSheet({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.name,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 5.w,
          right: 5.w),
      // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Text(
            'Are you sure you want to unfollow?',
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Unfollowing $name means that you won\'t see any of their posts, events, or updates in your feed. However, you can still visit their profile to view their posts.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomOutlinedButton(
            text: 'Yes',
            height: 6.h,
            onTap: () {
              navigator<NavigationService>().goBack(responseObject: true);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GradientButton(
            text: 'Cancel',
            onTap: () {
              navigator<NavigationService>().goBack();
            },
            textStyle: textTheme.bodySmall!.copyWith(
              fontSize: 15.5.sp,
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
            ),
            height: 5.5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

class ReportArtistModalSheet extends StatelessWidget {
  final String name;
  final String id;

  const ReportArtistModalSheet(
      {super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ReportCubit(ReportState.initial(
        serverUrl: appConfig.serverUrl,
        id: id,
        name: name,
      ))
        ..initReportUser(),
      child: const ReportArtistModalSheetConsumer(),
    );
  }
}

class AgreeToBlock extends StatelessWidget {
  const AgreeToBlock({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.name,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 5.w,
          right: 5.w),
      // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Text(
            'Are you sure you want to Block?',
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            '$name means that they won’t be able to message you or find your profile or content on Festa, You can unblock them at any time in settings.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomOutlinedButton(
            text: 'Yes',
            height: 6.h,
            onTap: () {
              navigator<NavigationService>().goBack(responseObject: true);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GradientButton(
            text: 'Cancel',
            onTap: () {
              navigator<NavigationService>().goBack();
            },
            textStyle: textTheme.bodySmall!.copyWith(
              fontSize: 15.5.sp,
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
            ),
            height: 5.5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

class ReportUserModalSheet extends StatelessWidget {
  final String name;
  final String id;

  const ReportUserModalSheet({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ReportCubit(ReportState.initial(
        serverUrl: appConfig.serverUrl,
        id: id,
        name: name,
      ))
        ..initReportArtist(),
      child: const ReportArtistModalSheetConsumer(),
    );
  }
}

class ReportArtistModalSheetConsumer extends StatelessWidget {
  const ReportArtistModalSheetConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Fluttertoast.showToast(
            msg: 'Your report submitted successfully!',
            backgroundColor: Colors.green,
            gravity: ToastGravity.CENTER,
          );
          navigator<NavigationService>().goBack();

          context
              .read<ReportCubit>()
              .emitFromAnywhere(state: state.copyWith(isSuccess: false));
        } else if (state.isFailure) {
          context
              .read<ReportCubit>()
              .emitFromAnywhere(state: state.copyWith(isFailure: false));

          Fluttertoast.showToast(
            msg: 'Failed to submit report, Please try again!',
            backgroundColor: Colors.red,
            gravity: ToastGravity.CENTER,
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 5.w,
              right: 5.w),
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Container(
                  width: 12.w,
                  height: .5.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              Text(
                'Report something that doesn’t look right',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                isFill: true,
                controller: state.reportDescController,
                maxLines: 3,
                fillColor: Theme.of(context).colorScheme.onSecondaryContainer,
                hintText: DeleteAccountScreenConstants.typeHere,
                hintTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(.6),
                    ),
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
                onChanged: (value) {
                  context.read<ReportCubit>().emitFromAnywhere(
                      state: state.copyWith(isEnableSubmit: value.isNotEmpty));
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetConstants.incogIcon,
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Text(
                      'We don’t ${state.name} let know who reported them.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              state.isLoading
                  ? Center(
                      child: SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : GradientButton(
                      text: 'Submit',
                      onTap: () {
                        context.read<ReportCubit>().onSubmit();
                      },
                      isEnabled: state.isEnableSubmit && !state.isLoading,
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 15.5.sp,
                                color: !state.isEnableSubmit && !state.isLoading
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                    : Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                      height: 5.5.h,
                    ),
              SizedBox(
                height: .5.h,
              ),
              if (!state.isLoading)
                MaterialButton(
                  minWidth: 100.w,
                  onPressed: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Text(
                    AccountPrivacyScreenConstants.cancel,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
