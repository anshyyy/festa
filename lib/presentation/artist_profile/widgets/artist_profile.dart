import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/dynamic_link.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/gradient_button.dart';
import 'mutual_followers.dart';
import 'social_reach.dart';
// import 'mutual_followers.dart';
// import 'social_reach.dart';

class ArtistProfile extends StatelessWidget {
  const ArtistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeData = Theme.of(context);
        final colorScheme = themeData.colorScheme;
        final textTheme = themeData.textTheme;

        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(.85),
                          // border: Border.all(
                          //   color: Theme.of(context).colorScheme.secondaryContainer,
                          //   width: .3,
                          // ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              state.artistProfile?.fullName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                            ),
                            Text('@${state.artistProfile?.tag?.tag ?? ''}',
                                style: Theme.of(context).textTheme.bodySmall!),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              state.artistProfile?.description ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: state.artistProfile!.categories
                                  .map((current) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: .1.w,
                                          color: colorScheme.background
                                              .withOpacity(.5)),
                                      borderRadius:
                                          BorderRadius.circular(50.w)),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: colorScheme.background,
                                        radius: 1.5.w,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        current.name,
                                        style: textTheme.bodySmall!.copyWith(
                                            color: colorScheme.background,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            Divider(
                              thickness: .1.w,
                              // color: Colors.white,
                            ),
                            GestureDetector(
                              onTap: () {
                                navigator<NavigationService>().navigateTo(
                                    UserRoutes.artistCommunityScreenRoute,
                                    queryParams: {
                                      'artistId': state.artistId.toString(),
                                      'artistName':
                                          state.artistProfile!.fullName,
                                    });
                              },
                              child: Column(
                                children: [
                                  MutualFollowers(
                                    artistCommunityDto: state.artistProfile!
                                        .extraDetailsDto!.followedBy,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SocialReach(
                                    totalParties: state.artistProfile!
                                        .extraDetailsDto!.totalParties,
                                    totalFollowers: state.artistProfile!
                                        .extraDetailsDto!.totalFollowers,
                                    totalFriends: state.artistProfile!
                                        .extraDetailsDto!.totalFriends,
                                    totalFootFall: state.artistProfile!
                                        .extraDetailsDto!.totalFootFall,
                                  ),
                                ],
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
                              color:
                                  colorScheme.primaryContainer.withOpacity(1),
                              border: Border.all(width: 1, color: Colors.white),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      CustomImageProvider.getImageUrl(
                                          state.artistProfile!.profileImage,
                                          ImageType.profile)))),
                        ),
                      ],
                    ),
                  ),
                  // state.isFollowing
                  //     ? Positioned(
                  //         top: 1.5.h,
                  //         right: 4.5.w,
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             showModalBottomSheet(
                  //                 context: context,
                  //                 isScrollControlled: true,
                  //                 builder: (context) {
                  //                   return AgreeToUnfollowModalSheet(
                  //                     name: state.artistProfile!.fullName,
                  //                     textTheme: textTheme,
                  //                     colorScheme: colorScheme,
                  //                   );
                  //                 }).then((value) {
                  //               if (value != null) {
                  //                 context
                  //                     .read<ArtistCubit>()
                  //                     .followUnfollowArtist();
                  //               }
                  //             });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 3.w, vertical: 2.w),
                  //             decoration: BoxDecoration(
                  //                 color: colorScheme.secondaryContainer
                  //                     .withOpacity(.2),
                  //                 borderRadius: BorderRadius.circular(2.w)),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   'Following',
                  //                   style: Theme.of(context)
                  //                       .textTheme
                  //                       .bodySmall
                  //                       ?.copyWith(
                  //                         fontSize: 14.sp,
                  //                         color: Theme.of(context)
                  //                             .colorScheme
                  //                             .background,
                  //                         fontWeight: FontWeight.w600,
                  //                       ),
                  //                 ),
                  //                 // SizedBox(
                  //                 //   width: 1.w,
                  //                 // ),
                  //                 // SvgPicture.asset(AssetConstants.arrowDown)
                  //               ],
                  //             ),
                  //           ),
                  //         ))
                  //     : Positioned(
                  //         top: 1.5.h,
                  //         right: 4.5.w,
                  //         child: GradientButton(
                  //           width: 23.w,
                  //           height: 4.h,
                  //           text: 'Follow',
                  //           onTap: () {
                  //             context
                  //                 .read<ArtistCubit>()
                  //                 .followUnfollowArtist();
                  //           },
                  //           textStyle: Theme.of(context)
                  //               .textTheme
                  //               .bodySmall
                  //               ?.copyWith(
                  //                 fontSize: 14.sp,
                  //                 color:
                  //                     Theme.of(context).colorScheme.background,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //         ),
                  //       ),
                  Positioned(
                    top: 1.h,
                    left: 2.w,
                    child: SizedBox(
                      height: 15.h,
                      width: 15.w,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 12.w,
                                        height: .5.h,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text('Scan the QR code',
                                          style: themeData.textTheme.bodyLarge!
                                              .copyWith(
                                                  color:
                                                      colorScheme.background)),
                                      SizedBox(
                                        height: 1.h,
                                      ),

                                      Container(
                                        color: Colors.black,
                                        width: 50.w,
                                        height: 50.w,
                                        child: QrImageView(
                                          data: DynamicLinkUtil.generateLink(
                                              AppConstants.user,
                                              state.artistProfile!.id
                                                  .toString()),
                                          eyeStyle: QrEyeStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer,
                                              eyeShape: QrEyeShape.square),
                                          dataModuleStyle: QrDataModuleStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            dataModuleShape:
                                                QrDataModuleShape.square,
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 3.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              radius: 5.5.w,
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                      CustomImageProvider
                                                          .getImageUrl(
                                                              state
                                                                  .artistProfile
                                                                  ?.profileImage,
                                                              ImageType
                                                                  .profile)),
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
                                                    state.artistProfile
                                                            ?.fullName ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: themeData
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      color: colorScheme
                                                          .background,
                                                      fontSize: 16.5.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: .5.h,
                                                  ),
                                                  Text(
                                                    state.artistProfile?.tag !=
                                                            null
                                                        ? '@${state.artistProfile?.tag?.tag}'
                                                        : '',
                                                    style: themeData
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            color: colorScheme
                                                                .background
                                                                .withOpacity(
                                                                    .7),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                        child: QrImageView(
                          data: DynamicLinkUtil.generateLink(
                              AppConstants.artist, state.artistId.toString()),
                          eyeStyle: QrEyeStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              eyeShape: QrEyeShape.square),
                          dataModuleStyle: QrDataModuleStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              dataModuleShape: QrDataModuleShape.square),
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



class AgreeToUnfollowModalSheet extends StatelessWidget {
  const AgreeToUnfollowModalSheet({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.name,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 5.w,
          right: 5.w),
      // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Text(
            'Are you sure you want to unfollow?',
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Unfollowing $name means that you won\'t see any of their posts, events, or updates in your feed. However, you can still visit their profile to view their posts.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomOutlinedButton(
            text: 'Yes',
            height: 6.h,
            onTap: () {
              navigator<NavigationService>().goBack(responseObject: true);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GradientButton(
            text: 'Cancel',
            onTap: () {
              navigator<NavigationService>().goBack();
            },
            textStyle: textTheme.bodySmall!.copyWith(
              fontSize: 15.5.sp,
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
            ),
            height: 5.5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
