import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_community/club_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../widgets/custom_textfield.dart';

class ClubCommunity extends StatelessWidget {
  final int clubId;
  const ClubCommunity({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ClubCommunityCubit(ClubCommunityState.initial(
          clubId: clubId, serverUrl: appConfig.serverUrl))
        ..init(),
      child: const ClubCommunityConsumer(),
    );
  }
}

class ClubCommunityConsumer extends StatelessWidget {
  const ClubCommunityConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<ClubCommunityCubit, ClubCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      dividerHeight: 0,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 2.w),
                      labelColor: colorScheme.background,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Text(
                            '${state.pubFollowers.totalCount} Followers',
                            style: textTheme.bodySmall!.copyWith(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '${state.pubFriends.totalCount} friends',
                            style: textTheme.bodySmall!.copyWith(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    CustomTextField(
                      isFill: true,
                      fillColor:
                          themeData.scaffoldBackgroundColor.withOpacity(.4),
                      hintText: AppConstants.search,
                      hintTextStyle: textTheme.bodySmall!.copyWith(
                          fontSize: 1.sp, color: colorScheme.background),
                      textStyle: textTheme.bodySmall!.copyWith(
                          fontSize: 15.sp, color: colorScheme.background),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 2.5.w),
                    ),
                    const Expanded(
                        child: TabBarView(
                      children: [
                        ClubFollowers(),
                        ClubFriends(),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ClubFollowers extends StatelessWidget {
  const ClubFollowers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<ClubCommunityCubit, ClubCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            state.pubFollowers.users.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      controller: state.followersScrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.pubFollowers.users.length,
                      itemBuilder: (context, index) {
                        final currentUser = state.pubFollowers.users[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 14.w,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.background,
                                            width: .5.w),
                                        borderRadius:
                                            BorderRadius.circular(50.w),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                currentUser.profileImage.isEmpty
                                                    ? 'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'
                                                    : currentUser.profileImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(currentUser.fullName,
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(
                                        '',
                                        style: textTheme.bodySmall,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 1.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorScheme.primaryContainer),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.playButtonIcon),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      ClubProfileScreenConstants.follow,
                                      style: textTheme.bodySmall!.copyWith(
                                          color: colorScheme.background),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                :  SizedBox(height: 40.h,),
            state.isFollowersFetching
                ? const Center(
                child: CircularProgressIndicator(),
                                  )
                : SizedBox(),
                SizedBox(height: 5.h,),
          ],
        );
      },
    );
  }
}

class ClubFriends extends StatelessWidget {
  const ClubFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<ClubCommunityCubit, ClubCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            state.pubFriends.users.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      controller: state.friendsScrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.pubFriends.users.length,
                      itemBuilder: (context, index) {
                        final currentUser = state.pubFriends.users[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 14.w,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorScheme.background,
                                            width: .5.w),
                                        borderRadius:
                                            BorderRadius.circular(50.w),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                currentUser.profileImage.isEmpty
                                                    ? 'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'
                                                    : currentUser.profileImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(currentUser.fullName,
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(
                                        '',
                                        style: textTheme.bodySmall,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 1.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorScheme.primaryContainer),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.playButtonIcon),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      ClubProfileScreenConstants.follow,
                                      style: textTheme.bodySmall!.copyWith(
                                          color: colorScheme.background),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                :  SizedBox(height: 40.h,),
            state.isFriendsFetching
                ? const Center(
                child: CircularProgressIndicator(),
                                  )
                : const SizedBox(),
                SizedBox(height: 5.h,),
          ],
        );
      },
    );
  }
}
