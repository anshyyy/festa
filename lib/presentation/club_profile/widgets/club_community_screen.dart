import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_community/club_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../widgets/custom_textfield.dart';
import 'club_followers.dart';
import 'club_friends.dart';

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

