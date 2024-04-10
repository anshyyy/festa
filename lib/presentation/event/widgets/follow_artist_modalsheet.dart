import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/event_details/artist_profile/artist_profile_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import 'artist_tile_widget.dart';

class FollowArtistsModalSheet extends StatelessWidget {
  final List<ArtistProfileDto> artists;
  const FollowArtistsModalSheet({
    super.key,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ArtistProfileCubit(ArtistProfileState.initial(
          serverUrl: appConfig.serverUrl, artists: artists)),
      child: FollowArtistsModalSheetConsumer(),
    );
  }
}

class FollowArtistsModalSheetConsumer extends StatelessWidget {
  const FollowArtistsModalSheetConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistProfileCubit, ArtistProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: 12.w,
                height: .5.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    EventDetailsScreenConstants.followArtists,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  GestureDetector(
                      onTap: () {
                        navigator<NavigationService>().goBack();
                      },
                      child: SvgPicture.asset(AssetConstants.closeIcon))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.artists.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: ArtistTile(
                    artist: state.artists[index],
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
