import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final bool isTabScreen;
  final Function(int)? onTabChange;
  const CustomBottomNav({
    super.key,
    this.isTabScreen = true,
    required this.onTabChange,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier = Provider.of(context);
    return Container(
      height: Platform.isAndroid ? 9.5.h : 12.h,
      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.4),
      child: SafeArea(
        child: Container(
          width: 80.w,
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
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (isTabScreen) {
                    onTabChange!(0);
                  } else {
                    navigator<NavigationService>().navigateTo(
                      UserRoutes.mainNavRoute,
                      queryParams: {'routeIndex': '0'},
                      isClearStack: true,
                    );
                  }
                },
                child: SizedBox(
                  width: 12.w,
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(AssetConstants.homeFilled,
                            colorFilter: ColorFilter.mode(
                                currentIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                BlendMode.srcIn)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 12.w,
                          height: .3.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              color: currentIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (isTabScreen) {
                    onTabChange!(2);
                  } else {
                    navigator<NavigationService>().navigateTo(
                      UserRoutes.mainNavRoute,
                      queryParams: {
                        'routeIndex': '2',
                      },
                      isClearStack: true,
                    );
                  }
                },
                child: SizedBox(
                  width: 12.w,
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(AssetConstants.ticketsIcon,
                            colorFilter: ColorFilter.mode(
                                currentIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                BlendMode.srcIn)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 12.w,
                          height: .3.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              color: currentIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (isTabScreen) {
                    onTabChange!(3);
                  } else {
                    navigator<NavigationService>().navigateTo(
                      UserRoutes.mainNavRoute,
                      queryParams: {'routeIndex': '3'},
                      isClearStack: true,
                    );
                  }
                },
                child: SizedBox(
                  width: 12.w,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 3.h,
                          width: 3.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: currentIndex == 3
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                              borderRadius: BorderRadius.circular(50.w),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      CustomImageProvider.getImageUrl(
                                          appStateNotifier.user!.profileImage,
                                          ImageType.profile)))),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 12.w,
                          height: .3.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              color: currentIndex == 3
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
  }
}
