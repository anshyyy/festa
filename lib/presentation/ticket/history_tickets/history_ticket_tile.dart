import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class TicketHistoryTile extends StatelessWidget {
  final String eventPoster;
  final String eventTitle;

  const TicketHistoryTile({
    super.key,
    required this.eventPoster,
    required this.eventTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.2.h, vertical: 1.2.h),
      margin: EdgeInsets.only(bottom: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Theme.of(context).primaryColor,
              width: .4.w),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).scaffoldBackgroundColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      height: 18.w,
                      width: 18.w,
                      child: CachedNetworkImage(
                        imageUrl: CustomImageProvider.getImageUrl(eventPoster, ImageType.other),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.5.sp,
                            color: Theme.of(context).colorScheme.background),
                      ),
                      // Text(
                      //   artist,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodySmall!
                      //       .copyWith(fontSize: 14.5.sp),
                      // ),
                      // SizedBox(height: .5.h,),
                      // Text(
                      //   duration,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodySmall!
                      //       .copyWith(fontSize: 14.5.sp),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AssetConstants.arrowRight)
        ],
      ),
    );
  }
}
