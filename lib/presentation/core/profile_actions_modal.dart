import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../event/widgets/event_option_tile.dart';

class ProfileActionsModal extends StatelessWidget {
  const ProfileActionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 3.h,
        ),
        EventOptionsTile(
          prefixIcon: SvgPicture.asset(
            AssetConstants.followIcon,
            height: 5.w,
          ),
          onTap: () {},
          title: 'Follow',
          suffixIcon: SvgPicture.asset(
            AssetConstants.arrowRight,
          ),
        ),
        EventOptionsTile(
            onTap: () {},
            prefixIcon: SvgPicture.asset(
              AssetConstants.addToCalendar,
              height: 5.w,
            ),
            title: 'Block'),
        // EventOptionsTile(title: EventDetailsScreenConstants.shareEvent),
        EventOptionsTile(
            onTap: () {},
            prefixIcon: SvgPicture.asset(
              AssetConstants.gradientReport,
              height: 5.w,
            ),
            title: 'Report'),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
