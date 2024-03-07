import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/main_nav/main_nav_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/constants/asset_constants.dart';

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
          height: Platform.isAndroid ? 10.h : 10.2.h,
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.4),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.h),
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.5)),
              margin: EdgeInsets.only(
                left: 8.w,
                top: 2.h,
                right: 8.w,
                bottom: Platform.isAndroid ? 2.h : 0,
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              height: 27,
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
                  // GestureDetector(
                  //   // onTap: () {
                  //   //   context.read<MainNavCubit>().onIndexChange(index: 1);
                  //   // },
                  //   child: SizedBox(
                  //     width: 8.w,
                  //     height: 100.h,
                  //     child: Stack(
                  //       children: [
                  //         Center(
                  //           child: SvgPicture.asset(
                  //             AssetConstants.communityIcon,
                  //             color: state.currentIndex == 1
                  //                 ? Theme.of(context).primaryColor
                  //                 : Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: 0,
                  //           child: AnimatedContainer(
                  //             duration: const Duration(milliseconds: 200),
                  //             width: 8.w,
                  //             height: .3.h,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: const BorderRadius.vertical(
                  //                   top: Radius.circular(10),
                  //                 ),
                  //                 color: state.currentIndex == 1
                  //                     ? Theme.of(context).primaryColor
                  //                     : Colors.transparent),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      context.read<MainNavCubit>().onIndexChange(index: 2);
                    },
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
                                  : Theme.of(context).colorScheme.onSecondary,
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
                      context.read<MainNavCubit>().onIndexChange(index: 3);
                    },
                    child: SizedBox(
                      width: 7.w,
                      height: 100.h,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 3.5.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: state.currentIndex == 3 ?Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondaryContainer),
                              borderRadius: BorderRadius.circular(50.w),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      appStateNotifier.user!.profileImage))),
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
                                  color: state.currentIndex == 3
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
