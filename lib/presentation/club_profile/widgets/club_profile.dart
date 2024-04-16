import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../domain/core/utils/dynamic_link.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/gradient_button.dart';
import 'social_reach.dart';

class ClubProfile extends StatelessWidget {
  const ClubProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface.withOpacity(.85),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.5.h,
                      ),
                      SizedBox(
                        width: 65.w,
                        child: Text(
                          state.pub!.fullName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background),
                        ),
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
                              SvgPicture.asset(AssetConstants.durationIcon,
                                  colorFilter: ColorFilter.mode(
                                      colorScheme.inversePrimary, BlendMode.srcIn)),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                state.pub!.openingHours!.openNow
                                    ? 'Open'
                                    : 'Closed',
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
                              SvgPicture.asset(AssetConstants.startIcon,
                                  colorFilter: ColorFilter.mode(
                                      colorScheme.surfaceTint, BlendMode.srcIn)),
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
                        thickness: .05.w,
                        // color: Colors.white,
                      ),
                      // state.pub!.extraDetailsDto!.followedBy.isNotEmpty
                      //     ? MutualFollowers()
                      //     : const SizedBox(),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigator<NavigationService>().navigateTo(
                              UserRoutes.clubCommunityScreenRoute,
                              queryParams: {
                                'clubId': state.clubId.toString(),
                                'clubName': state.pub!.fullName,
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
                            image: CachedNetworkImageProvider(
                                CustomImageProvider.getImageUrl(
                                    state.pub?.logo ?? '',
                                    ImageType.profile)))),
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
              top: 1.5.h,
              left: 2.w,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 12.w,
                                height: .5.h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text('Scan the QR code',
                                  style: textTheme.bodyLarge!
                                      .copyWith(color: colorScheme.background)),
                              SizedBox(
                                height: 1.h,
                              ),

                              SizedBox(
                                width: 50.w,
                                height: 50.w,
                                child: QrImageView(
                                  data: DynamicLinkUtil.generateLink(
                                      AppConstants.pub,
                                      state.clubId.toString()),
                                  eyeStyle: QrEyeStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      eyeShape: QrEyeShape.square),
                                  dataModuleStyle: QrDataModuleStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    dataModuleShape: QrDataModuleShape.square,
                                  ),
                                ),
                              ),

                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: colorScheme.background, width: .1.w),
                              //     borderRadius: BorderRadius.circular(10.w)
                              //   ),
                              //   child: Row(),
                              // )
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: 60.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colorScheme.background,
                                        width: .1.w),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 3.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 5.5.w,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              CustomImageProvider.getImageUrl(
                                                  state.pub?.logo,
                                                  ImageType.profile)),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.pub?.fullName ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: themeData
                                                .textTheme.bodyMedium!
                                                .copyWith(
                                              color: colorScheme.background,
                                              fontSize: 16.5.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Text(
                                            state.pub?.tag != null
                                                ? '@${state.pub?.tag?.tag}'
                                                : '',
                                            style: themeData
                                                .textTheme.bodySmall!
                                                .copyWith(
                                                    color: colorScheme
                                                        .background
                                                        .withOpacity(.7),
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: QrImageView(
                    data: DynamicLinkUtil.generateLink(
                        AppConstants.pub, state.clubId.toString()),
                    eyeStyle: QrEyeStyle(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        eyeShape: QrEyeShape.square),
                    dataModuleStyle: QrDataModuleStyle(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      dataModuleShape: QrDataModuleShape.square,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
