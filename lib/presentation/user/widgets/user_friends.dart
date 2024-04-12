import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/user/user_community/user_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/custom_textfield.dart';

class UserFriends extends StatelessWidget {
  const UserFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocConsumer<UserCommunityCubit, UserCommunityState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              controller: state.friendsSearchController,
              isFill: true,
              fillColor: themeData.scaffoldBackgroundColor.withOpacity(.4),
              hintText: AppConstants.search,
              hintTextStyle: textTheme.bodySmall!
                  .copyWith(fontSize: 1.sp, color: colorScheme.background),
              textStyle: textTheme.bodySmall!
                  .copyWith(fontSize: 15.sp, color: colorScheme.background),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.w),
              onChanged: (value) {
                EasyDebounce.debounce(
                    'user-friends-search', const Duration(milliseconds: 500),
                    () {
                  context.read<UserCommunityCubit>().searchUserFriends(page: 1);
                });
              },
            ),
            state.userFriends.users.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      controller: state.friendsScrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.userFriends.users.length,
                      itemBuilder: (context, index) {
                        final currentUser = state.userFriends.users[index];
                        return GestureDetector(
                          onTap: () {
                            navigator<NavigationService>().navigateTo(
                                UserRoutes.userProfileRoute,
                                queryParams: {
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
                                              color: colorScheme.background,
                                              width: .5.w),
                                          borderRadius:
                                              BorderRadius.circular(50.w),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  CustomImageProvider.getImageUrl(currentUser
                                                          .profileImage, ImageType.profile)),
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
                                            style:
                                                textTheme.bodyMedium!.copyWith(
                                              color: colorScheme.background,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Text(
                                          currentUser.tag?.tag != null
                                              ? currentUser.tag!.tag
                                              : '',
                                          style: textTheme.bodySmall,
                                        )
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
                                                  .read<UserCommunityCubit>()
                                                  .followFriend(
                                                      id: currentUser.id);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 1.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colorScheme
                                                      .primaryContainer),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                      AssetConstants
                                                          .playButtonIcon),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Text(
                                                    ClubProfileScreenConstants
                                                        .follow,
                                                    style: textTheme.bodySmall!
                                                        .copyWith(
                                                            color: colorScheme
                                                                .background),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<UserCommunityCubit>()
                                                  .unFollowFriend(
                                                      id: currentUser.id);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 1.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colorScheme
                                                      .primaryContainer),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  // SvgPicture.asset(
                                                  //     AssetConstants.),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Text(
                                                    ClubProfileScreenConstants
                                                        .following,
                                                    style: textTheme.bodySmall!
                                                        .copyWith(
                                                            color: colorScheme
                                                                .background),
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
                    ),
                  )
                : SizedBox(
                    height: 40.h,
                  ),
            state.isFriendsFetching
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
            SizedBox(
              height: 5.h,
            ),
          ],
        );
      },
    );
  }
}
