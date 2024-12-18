import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';

class NoNotificationsWidget extends StatelessWidget {
  const NoNotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetConstants.heartFilledIcon,
            height: 10.h,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            NotificationsScreenConstants.noNotifications,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 19.5.sp,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
          SizedBox(
            height:1.h,
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              NotificationsScreenConstants.aboutNotifications,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
