import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/gradient_button.dart';
import 'mutual_followers.dart';
import 'social_reach.dart';

class ClubProfile extends StatelessWidget {
  const ClubProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: .3,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    state.pub!.fullName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  Text('@${state.pub!.tag!.tag}',
                      style: Theme.of(context).textTheme.bodySmall!),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.locationIcon,
                        height: 2.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: Text(state.pub!.location!.vicinity,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 15.sp,
                                )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    state.pub!.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.background),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetConstants.durationIcon,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            '10:00 AM - 12:30 PM',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetConstants.startIcon,
                            color: Colors.yellow[800],
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            '${state.pub!.averageRating}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    thickness: .1.w,
                    // color: Colors.white,
                  ),
                  state.pub!.extraDetailsDto!.followedBy.isNotEmpty
                      ? MutualFollowers()
                      : const SizedBox(),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().navigateTo(
                          UserRoutes.clubCommunityScreenRoute,
                          queryParams: {
                            'clubId': state.clubId.toString(),
                          });
                    },
                    child: SocialReach(
                      totalFollowers:
                          state.pub!.extraDetailsDto!.totalFollowers,
                      totalFriends: state.pub!.extraDetailsDto!.totalFriends,
                      totalParties: state.pub!.extraDetailsDto!.totalParties,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -5.h,
              child: Column(
                children: [
                  Container(
                    height: 20.w,
                    width: 20.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(state.pub?.logo ?? ''))),
                  ),
                ],
              ),
            ),
            !state.isFollowing
                ? Positioned(
                    top: 1.5.h,
                    right: 4.5.w,
                    child: GradientButton(
                      width: 23.w,
                      height: 4.h,
                      text: ClubProfileScreenConstants.follow,
                      onTap: () {
                        context
                            .read<ClubProfileCubit>()
                            .followUnfollowPub(pubId: state.pub!.id.toString());
                      },
                      textStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  )
                : Positioned(
                    top: 1.5.h,
                    right: 4.5.w,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<ClubProfileCubit>()
                            .followUnfollowPub(pubId: state.pub!.id.toString());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        decoration: BoxDecoration(
                            color:
                                colorScheme.secondaryContainer.withOpacity(.2),
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Following',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            SvgPicture.asset(AssetConstants.arrowDown)
                          ],
                        ),
                      ),
                    )),
            Positioned(
              top: 1.h,
              left: 2.w,
              child: SizedBox(
                height: 15.h,
                width: 15.w,
                child: QrImageView(
                  data: '1234567890',
                  eyeStyle: QrEyeStyle(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      eyeShape: QrEyeShape.square),
                  dataModuleStyle: QrDataModuleStyle(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
