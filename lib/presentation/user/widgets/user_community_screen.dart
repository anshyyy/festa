import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/user/user_community/user_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/custom_appbar.dart';
import 'user_followers.dart';
import 'user_friends.dart';

class UserCommunity extends StatelessWidget {
  final int userId;
  final String username;
  const UserCommunity(
      {super.key, required this.userId, required this.username});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => UserCommunityCubit(UserCommunityState.initial(
          userId: userId, serverUrl: appConfig.serverUrl, username: username))
        ..init(),
      child: const UserCommunityConsumer(),
    );
  }
}

class UserCommunityConsumer extends StatelessWidget {
  const UserCommunityConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<UserCommunityCubit, UserCommunityState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: state.username,
              scaffoldBackgroundColor: colorScheme.surface,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
              actions: const []),
          backgroundColor: colorScheme.surface,
          body: Padding(
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
                    onTap: (value){
                      context.read<UserCommunityCubit>().clearSearch();
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          '${state.userFollowers.totalCount} Followers',
                          style: textTheme.bodySmall!.copyWith(
                              color: colorScheme.background,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Tab(
                        child: Text(
                          '${state.userFriends.totalCount} friends',
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
                  
                  const Expanded(
                      child: TabBarView(
                    children: [
                      UserFollowers(),
                      UserFriends(),
                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
