import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/main_nav/main_nav_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier = Provider.of(context);
    return BlocConsumer<MainNavCubit, MainNavState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 11.h,
          color: Colors.transparent,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.h),
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(.5)),
              margin:
                  EdgeInsets.only(left: 8.w, top: 2.h, right: 8.w, bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<MainNavCubit>().onIndexChange(index: 0);
                    },
                    child: SizedBox(
                      width: 8.w,
                      height: 100.h,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.homeFilled,
                              color: state.currentIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 8.w,
                              height: .3.h,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  color: state.currentIndex == 0
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   context.read<MainNavCubit>().onIndexChange(index: 1);
                    // },
                    child: SizedBox(
                      width: 8.w,
                      height: 100.h,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.communityIcon,
                              color: state.currentIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 8.w,
                              height: .3.h,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  color: state.currentIndex == 1
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   context.read<MainNavCubit>().onIndexChange(index: 2);
                    // },
                    child: SizedBox(
                      width: 8.w,
                      height: 100.h,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.ticketsIcon,
                              color: state.currentIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 8.w,
                              height: .3.h,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  color: state.currentIndex == 2
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().navigateTo(UserRoutes.userProfileRoute);
                    },
                    child: CircleAvatar(
                      radius: 3.w,
                      foregroundImage: NetworkImage(appStateNotifier.user!.profileImage),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
