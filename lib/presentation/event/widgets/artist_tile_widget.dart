
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class ArtistTile extends StatelessWidget {
  final String artistName;
  final String username;
  final String? profilePhoto;
  const ArtistTile({
    super.key, required this.artistName, required this.username, this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 5.w,
                backgroundColor: Colors.white,
                foregroundImage: profilePhoto==null ? Image.asset(AssetConstants.defaultProfileImage, fit: BoxFit.cover,).image : CachedNetworkImageProvider(profilePhoto!),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artistName,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                  Text(
                    username,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        // fontSize: 17.sp
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
          height: 4.5.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            'Follow',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.background,
                ),
          )),
        )
      ],
    );
  }
}

