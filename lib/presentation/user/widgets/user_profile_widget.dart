                                                                                             import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/user/user_profile/user_profile_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/dynamic_link.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/gradient_button.dart';
import 'mutual_followers.dart';
import 'social_reach.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 3.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: .5.w,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    width: .3,
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigator<NavigationService>().navigateTo(
                            UserRoutes.userCommunityScreenRoute,
                            queryParams: {
                              'userId': state.user!.id.toString(),
                              'username':state.user!.fullName,
                            });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            state.user!.fullName,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.background),
                          ),
                          Text(
                              state.user?.tag != null
                                  ? '@${state.user!.tag!.tag}'
                                  : '',
                              style: Theme.of(context).textTheme.bodySmall!),
                          SizedBox(
                            height: 1.h,
                          ),
                        
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: state.user!.description.isEmpty ? 0 : 1.h),
                            child: Text(
                              state.user!.description,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(.7),
                                    fontSize: 14.5.sp,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider(
                            thickness: .1.w,
                            // color: Colors.white,
                          ),
                          MutualFollowers(
                                artistCommunityDto:
                                    state.user?.extraDetailsDto?.followedBy,
                              ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SocialReach(
                              totalParties:
                                  state.user?.extraDetailsDto?.totalParties,
                              totalFollowers:
                                  state.user?.extraDetailsDto?.totalFollowers,
                              totalFriends:
                                  state.user?.extraDetailsDto?.totalFriends)
                        ],
                      ),
                    ),
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
                          color: colorScheme.surface,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(CustomImageProvider.getImageUrl(state.user!.profileImage, ImageType.profile))
                                  )),
                    )
                  ],
                ),
              ),
              appStateNotifier.user!.id != state.userId
                  ? !state.isFollowing
                      ? Positioned(
                          top: 1.5.h,
                          right: 4.5.w,
                          child: GradientButton(
                            width: 23.w,
                            height: 4.h,
                            text: ClubProfileScreenConstants.follow,
                            onTap: () {
                              context
                                  .read<UserProfileCubit>()
                                  .followUser(id: state.userId);
                            },
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color:
                                      Theme.of(context).colorScheme.background,
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
                                  .read<UserProfileCubit>()
                                  .unFollowUser(id: state.userId);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.w),
                              decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer
                                      .withOpacity(.2),
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
                          ))
                  : const SizedBox(),
              Positioned(
                top: 1.h,
                left: 2.w,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                            // color: colorS/cheme.surface,
                                            width: 100.w,
                                            height: 100.h,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 12.w,
                                                    height: .5.h,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondaryContainer,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text('Scan the QR code',
                                                      style: themeData
                                                          .textTheme.bodyLarge!
                                                          .copyWith(
                                                              color: colorScheme
                                                                  .background)),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),

                                                  Container(
                                                    color: themeData.scaffoldBackgroundColor,
                                                    width: 50.w,
                                                    height: 50.w,
                                                    child: QrImageView(
                                                      data: DynamicLinkUtil
                                                          .generateLink(
                                                              AppConstants.user,
                                                              state.user!.id
                                                                  .toString()),
                                                      eyeStyle: QrEyeStyle(
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .secondaryContainer,
                                                          eyeShape: QrEyeShape
                                                              .square),
                                                      dataModuleStyle:
                                                          QrDataModuleStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondaryContainer,
                                                        dataModuleShape:
                                                            QrDataModuleShape
                                                                .square,
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
                                                            color: colorScheme
                                                                .background,
                                                            width: .1.w),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h,
                                                            horizontal: 3.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 5.5.w,
                                                          backgroundImage: CachedNetworkImageProvider(
                                                              CustomImageProvider
                                                                  .getImageUrl(
                                                                      state.user
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
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                state.user
                                                                        ?.fullName ??
                                                                    '',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: themeData
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                  color: colorScheme
                                                                      .background,
                                                                  fontSize:
                                                                      16.5.sp,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: .5.h,
                                                              ),
                                                              Text(
                                                                state.user?.tag !=
                                                                        null
                                                                    ? '@${state.user?.tag?.tag}'
                                                                    : '',
                                                                style: themeData
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                        color: colorScheme
                                                                            .background
                                                                            .withOpacity(
                                                                                .7),
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
                          AppConstants.user, state.userId.toString()),
                      eyeStyle: QrEyeStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          eyeShape: QrEyeShape.square),
                      dataModuleStyle: QrDataModuleStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
