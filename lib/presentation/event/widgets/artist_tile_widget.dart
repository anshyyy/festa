
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.dart';

class ArtistTile extends StatelessWidget {
  final String artistName;
  final String username;
  final String? profilePhoto;
  const ArtistTile({
    super.key, required this.artistName, required this.username, this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<NavigationService>().navigateTo(UserRoutes.artistProfileScreenRoute);
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 5.w,
                  backgroundColor: Colors.white,
                  foregroundImage:CachedNetworkImageProvider(CustomImageProvider.getImageUrl(profilePhoto, ImageType.profile)),
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
      ),
    );
  }
}

