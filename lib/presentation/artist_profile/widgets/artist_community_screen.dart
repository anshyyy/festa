import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_community/artist_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../widgets/custom_textfield.dart';

class ArtistCommunity extends StatelessWidget {
  final int artistId;
  const ArtistCommunity({super.key, required this.artistId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ArtistCommunityCubit(ArtistCommunityState.initial(
          artistId: artistId, serverUrl: appConfig.serverUrl))
        ..init(),
      child: const ArtistCommunityConsumer(),
    );
  }
}

class ArtistCommunityConsumer extends StatelessWidget {
  const ArtistCommunityConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<ArtistCommunityCubit, ArtistCommunityState>(
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
                            '${state.artistFollowers?.totalCount ?? 0} Followers',
                            style: textTheme.bodySmall!.copyWith(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '${state.artistFriends?.totalCount ?? 0} Friends',
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
                    Expanded(
                        child: TabBarView(
                      children: [
                        state.isFollowersFetching
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const ArtistFollowers(),
                        state.isFriendsFetching
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const ArtistFriends(),
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

class ArtistFollowers extends StatelessWidget {
  const ArtistFollowers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<ArtistCommunityCubit, ArtistCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          controller: state.followersScrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.artistFollowers!.users.length,
          itemBuilder: (context, index) {
            final currentUser = state.artistFollowers!.users[index];
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
                                color: colorScheme.background, width: .5.w),
                            borderRadius: BorderRadius.circular(50.w),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(currentUser
                                        .profileImage.isEmpty
                                    ? 'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'
                                    : currentUser.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorScheme.primaryContainer),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AssetConstants.playButtonIcon),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          ClubProfileScreenConstants.follow,
                          style: textTheme.bodySmall!
                              .copyWith(color: colorScheme.background),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ArtistFriends extends StatelessWidget {
  const ArtistFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<ArtistCommunityCubit, ArtistCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          controller: state.friendsScrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.artistFollowers!.users.length,
          itemBuilder: (context, index) {
            final currentUser = state.artistFollowers!.users[index];
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
                                color: colorScheme.background, width: .5.w),
                            borderRadius: BorderRadius.circular(50.w),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(currentUser
                                        .profileImage.isEmpty
                                    ? 'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'
                                    : currentUser.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorScheme.primaryContainer),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AssetConstants.playButtonIcon),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          ClubProfileScreenConstants.follow,
                          style: textTheme.bodySmall!
                              .copyWith(color: colorScheme.background),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
