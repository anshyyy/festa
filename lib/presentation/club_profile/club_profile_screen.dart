import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/club_profile/club_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../core/profile_actions_modal.dart';
import '../main_nav/bottom_nav.dart';
import 'widgets/club_profile.dart';
import 'widgets/image_carousel.dart';
import 'widgets/media_viewer_tabs.dart';

class ClubProfileScreen extends StatelessWidget {
  final int clubId;
  const ClubProfileScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ClubProfileCubit(ClubProfileState.initial(
        clubId: clubId,
        apiBaseUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: ClubProfileScreenConsumer(),
    );
  }
}

class ClubProfileScreenConsumer extends StatefulWidget {
  const ClubProfileScreenConsumer({super.key});

  @override
  _ClubProfileScreenConsumerState createState() =>
      _ClubProfileScreenConsumerState();
}

class _ClubProfileScreenConsumerState extends State<ClubProfileScreenConsumer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    // Initialize the tab using 'this' as the TickerProvider
    context.read<ClubProfileCubit>().initializeTab(this);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        if (state.isAtTop) _animationController.forward();
        if (!state.isAtTop) _animationController.reset();
      },
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const ClubShimmer()
              : state.pub == null
                  ? const Center(child: Text('Data not found'))
                  : Stack(
                      children: [
                        const ImageCarousel(),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Positioned(
                              child: DraggableScrollableSheet(
                                initialChildSize: .57,
                                minChildSize: .57,
                                controller: state.dragController,
                                builder: (context, dragController) {
                                  return SingleChildScrollView(
                                    controller: dragController,
                                    child: Container(
                                      color: Colors.transparent,
                                      margin: EdgeInsets.only(top: 5.h),
                                      child: SafeArea(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 0.5.h),
                                              child: ClubProfile(),
                                            ),
                                            const MediaViewerTabs(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        if (!state.isAtTop)
                          Positioned(
                            top: 6.5.h,
                            left: 5.w,
                            child: SizedBox(
                              width: 90.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      navigator<NavigationService>().goBack();
                                    },
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetConstants.arrowLeft,
                                        width: 7.w,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        context: context,
                                        builder: (context) {
                                          return ProfileActionsModal(
                                            profileType: 'pub',
                                            profileId: state.clubId.toString(),
                                            profileName:
                                                state.pub?.fullName ?? "",
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
                                        if (value['key'] ==
                                            'followOrUnfollow') {
                                          context
                                              .read<ClubProfileCubit>()
                                              .followUnfollowPub(
                                                  pubId: state.clubId,
                                                  isFollowing: state.isFollowing);
                                        } else if (value['key'] ==
                                            'blockOrUnblock') {
                                          context
                                              .read<ClubProfileCubit>()
                                              .blockOrUnblockPub(
                                                  isBlock: value['val']);
                                        }
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      AssetConstants.hamBurgerMenu,
                                      width: 7.w,
                                    ),
                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '${state.pub?.fullName} is blocked!',
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
                                        SizedBox(height: 5.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
        );
      },
    );
  }
}

class ClubShimmer extends StatelessWidget {
  const ClubShimmer({
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
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 10.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            )
          ],
        ),
      ),
    );
  }
}
