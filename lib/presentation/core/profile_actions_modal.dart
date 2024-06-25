import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import 'agree_to_block_modal.dart';
import 'agree_to_unfollow_modal.dart';
import 'profile_action_tile.dart';
import 'report_modal.dart';

class ProfileActionsModal extends StatelessWidget {
  final String profileName;
  final String profileId;
  final String profileType;
  final bool isFollowing;
  final bool isBlocked;
  final Function(bool)? onTapFollowOrUnfollow;
  final Function(bool)? onTapBlockOrUnBlock;

  const ProfileActionsModal({
    super.key,
    this.profileId = '',
    this.profileType = '',
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
              if (!isBlocked && isFollowing)
                ProfileActionTile(
                  prefixIcon: SvgPicture.asset(
                    AssetConstants.closeIcon,
                    height: 6.w,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AgreeToUnfollowModalSheet(name: profileName);
                        }).then((value) {
                      if (value != null) {
                        // unfollow
                        onTapFollowOrUnfollow!(true);
                      }
                    });
                  },
                  title: 'Unfollow',
                ),
              ProfileActionTile(
                onTap: () {
                  if (!isBlocked) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AgreeToBlock(
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
                  isBlocked
                      ? AssetConstants.followIcon
                      : AssetConstants.userBlock,
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
                        return ReportModalSheet(
                          id: profileId,
                          name: profileName,
                          type: profileType,
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
