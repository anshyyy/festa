import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_community/artist_community_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import 'artist_followers.dart';
import 'artist_friends.dart';

class ArtistCommunity extends StatelessWidget {
  final int artistId;
  final String fullName;
  const ArtistCommunity(
      {super.key, required this.artistId, required this.fullName});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ArtistCommunityCubit(
        ArtistCommunityState.initial(
          artistId: artistId,
          serverUrl: appConfig.serverUrl,
          artistName: fullName,
        ),
      )..init(),
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
        
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: state.artistName,
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

