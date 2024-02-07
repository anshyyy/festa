import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class HomeHeader extends StatelessWidget {
  final Function()? onTapSearch;
  final Function()? onTapLocation;
  final Function()? onTapNotification;
  final GlobalKey? showCaseCartKey;
  final String? profileUrl;
  final int? cartItems;
  final int? notifications;

  const HomeHeader({
    Key? key,
    this.profileUrl,
    this.onTapSearch,
    this.cartItems,
    this.onTapLocation,
    this.notifications,
    this.showCaseCartKey,
    this.onTapNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      padding: EdgeInsets.only(
        right: 4.w,
        left: 4.w,
        top: 2.h,
        bottom: 1.5.h,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: onTapLocation,
                      child: Container(
                        width: 7.w,
                        height: 7.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.w),
                          color: Theme.of(context).colorScheme.primary,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              profileUrl!,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: onTapSearch,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            key: showCaseCartKey,
                            AssetConstants.searchIcon,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          if (cartItems != null)
                            Positioned(
                                top: -5,
                                left: -5,
                                child: GestureDetector(
                                  onTap: onTapSearch,
                                  child: CircleAvatar(
                                    radius: 2.6.w,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
                                    child: Text(
                                      cartItems.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: onTapNotification,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(AssetConstants.notificationIcon),
                          if (notifications != null && notifications != 0)
                            Positioned(
                                top: -5,
                                left: -5,
                                child: GestureDetector(
                                  onTap: onTapNotification,
                                  child: CircleAvatar(
                                    radius: 2.6.w,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
                                    child: Text(
                                      notifications.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
