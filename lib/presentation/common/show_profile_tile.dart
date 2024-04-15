import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';

class ShortProfileTile extends StatelessWidget {
  final ArtistProfileDto artist;
  final Function()?   onTap;
  const ShortProfileTile({
    super.key,
    required this.artist,
    this.onTap,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.w),
        margin: EdgeInsets.only(right: 3.w),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: const Color(0xff323232))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 4.w,
              backgroundImage: CachedNetworkImageProvider(CustomImageProvider.getImageUrl(artist.profileImage, ImageType.profile)),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  artist.fullName,
                  style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5.sp),
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
