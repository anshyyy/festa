import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_community/artist_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class ArtistFriends extends StatelessWidget {
  const ArtistFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocConsumer<ArtistCommunityCubit, ArtistCommunityState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ListView.builder(
          controller: state.friendsScrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.artistFriends!.users.length,
          itemBuilder: (context, index) {
            final currentUser = state.artistFriends!.users[index];
            return GestureDetector(
              onTap: () {
                navigator<NavigationService>()
                    .navigateTo(UserRoutes.userProfileRoute, queryParams: {
                  'userId': currentUser.id.toString(),
                });
              },
              child: Padding(
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
                                  image: CachedNetworkImageProvider(CustomImageProvider.getImageUrl(currentUser.profileImage, ImageType.profile)),
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
                              currentUser.tag?.tag != null
                                  ? currentUser.tag!.tag
                                  : '',
                              style: textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                    appStateNotifier.user!.id == currentUser.id
                        ? const SizedBox()
                        : !currentUser.isFollowing
                            ? GestureDetector(
                                onTap: () {
                                  context
                                      .read<ArtistCommunityCubit>()
                                      .followFriend(id: currentUser.id);
                                },
                                child: Container(
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
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  context
                                      .read<ArtistCommunityCubit>()
                                      .unFollowFriend(id: currentUser.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorScheme.primaryContainer),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        ClubProfileScreenConstants.following,
                                        style: textTheme.bodySmall!.copyWith(
                                            color: colorScheme.background),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
