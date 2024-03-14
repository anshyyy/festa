import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../infrastructure/event/dtos/artist/artist_dto.dart';

class ShortProfileTile extends StatelessWidget {
  final ArtistDto artist;
  const ShortProfileTile({
    super.key,
    required this.artist,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigator<NavigationService>().navigateTo(UserRoutes.artistProfileScreenRoute, queryParams: {'artistId':artist.id.toString()}),
      child: Container(
        padding: EdgeInsets.all(2.w),
        margin: EdgeInsets.only(right: 3.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: const Color(0xff323232))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 4.w,
              backgroundImage: CachedNetworkImageProvider(artist.profileImage),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artist.fullName,
                  style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5.sp),
                ),
                Text(
                  '1M+ Followers',
                  style: themeData.textTheme.bodySmall!.copyWith(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShortProfileTileShimmer extends StatelessWidget {
  final ThemeData themeData;

  const ShortProfileTileShimmer({
    super.key,
    required this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      margin: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: .1.w, color: themeData.colorScheme.background)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 4.w,
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loading....',
                style: themeData.textTheme.bodyMedium!.copyWith(
                    color: themeData.colorScheme.background,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.5.sp),
              ),
              Text(
                'Loading....',
                style: themeData.textTheme.bodySmall!.copyWith(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
