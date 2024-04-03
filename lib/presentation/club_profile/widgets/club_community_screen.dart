import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_community/club_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/custom_appbar.dart';
import 'club_followers.dart';
import 'club_friends.dart';

class ClubCommunity extends StatelessWidget {
  final int clubId;
  final String clubName;
  const ClubCommunity(
      {super.key, required this.clubId, required this.clubName});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ClubCommunityCubit(ClubCommunityState.initial(
        clubId: clubId,
        serverUrl: appConfig.serverUrl,
        clubName: clubName,
      ))
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
          appBar: CustomAppBar(
              title: state.clubName,
              scaffoldBackgroundColor: colorScheme.surface,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
              actions: const []),
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
                      onTap: (value){
context.read<ClubCommunityCubit>().clearSearch();
                      },
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
