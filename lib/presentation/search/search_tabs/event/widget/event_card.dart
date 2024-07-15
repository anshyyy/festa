import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/extensions/string_extension.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../../domain/core/utils/image_provider.dart';
import '../../../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../../../infrastructure/event/dtos/event/event_dto.dart';

class EventCard extends StatelessWidget {
  final EventDto event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        navigator<NavigationService>()
            .navigateTo(UserRoutes.eventDetailsRoute, queryParams: {
          'id': event.id.toString(),
          'distance':
              '${event.distance > 1000 ? (event.distance / 1000).toStringAsFixed(1) : event.distance.toStringAsFixed(0)}km',
        }).then((value) {});
      },
      child: SizedBox(
        height: 99.px,
        width: size.width,
        child: Row(
          children: [
            Container(
              height: 99.px,
              width: 99.px,
              margin: EdgeInsets.only(right: 3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          CustomImageProvider.getImageUrl(
                              event.coverImage, ImageType.other)))),
            ),
            SizedBox(
              width: 4.px,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 228.px,
                    child: Text(
                      event.name.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: 5.sp,
                ),
                Row(children: [
                  SvgPicture.asset(
                    AssetConstants.durationIcon,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    StringExtension.formatDateTimeLongNew(
                        DateTime.parse(event.startDate)),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ]),
                Row(children: [
                  SvgPicture.asset(
                    AssetConstants.locationIcon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    event.vicinity,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  )
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
