
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import 'event_option_tile.dart';
import 'follow_artist_modalsheet.dart';

class EventOptionsModalSheet extends StatelessWidget {
  final List<ArtistProfileDto> artists;
  const EventOptionsModalSheet({
    super.key, required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            EventOptionsTile(
              prefixIcon: SvgPicture.asset(
                AssetConstants.followIcon,
                height: 5.w,
              ),
              onTap: () {
                navigator<NavigationService>().goBack();
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>  FollowArtistsModalSheet(artists: artists,));
              },
              title: EventDetailsScreenConstants.followArtists,
              suffixIcon: SvgPicture.asset(
                AssetConstants.arrowRight,
              ),
            ),
            EventOptionsTile(
                prefixIcon: SvgPicture.asset(
                  AssetConstants.addToCalendar,
                  height: 5.w,
                ),
                title: EventDetailsScreenConstants.addToCalendar),
            // EventOptionsTile(title: EventDetailsScreenConstants.shareEvent),
            EventOptionsTile(
                prefixIcon: SvgPicture.asset(
                  AssetConstants.gradientReport,
                  height: 5.w,
                ),
                title: EventDetailsScreenConstants.report),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
