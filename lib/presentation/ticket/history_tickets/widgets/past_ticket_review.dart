import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/extensions/string_extension.dart';
import '../../../../infrastructure/event/dtos/event/event_dto.dart';

class PastTicketReview extends StatelessWidget {
  final EventDto event;
  final VoidCallback onReview;
    final VoidCallback onDetail;
  const PastTicketReview({super.key, required this.event,required this.onReview,required this.onDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
      height: 15.875.h,
      width: 82.75.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: onDetail,
            child: Row(
              children: [
                Container(
                  height: 8.75.h,
                  width: 8.75.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(event.coverImage),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ),
                SizedBox(width: 3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 70.66.w,
                        child: Text(event.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.px,
                                fontWeight: FontWeight.w600))),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(
                        width: 50.66.w,
                        child: Text(
                          event.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(
                        width: 50.66.w,
                        child: Text(
                          StringExtension.formatDateTimeWithTime(event.startDate),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          
          GestureDetector(
            onTap: onReview,
            child: Container(
              height: 4.5.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetConstants.starIcon),
                    Text(
                      ' Tell Us Your Experience',
                      style:
                          TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
