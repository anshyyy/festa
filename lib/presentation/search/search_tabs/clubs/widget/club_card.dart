import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../../domain/core/utils/image_provider.dart';
import '../../../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../../../infrastructure/event/dtos/pub/pub_dto.dart';

class ClubCard extends StatelessWidget {
  final PubDto club;

  const ClubCard({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigator<NavigationService>().navigateTo(UserRoutes.clubProfileRoute,
            queryParams: {'id': club.id.toString()});
      },
      child: SizedBox(
        height: 51.px,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Container(
                height: 51.px,
                width: 51.px,
                // margin: EdgeInsets.only(right: 3.w),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            CustomImageProvider.getImageUrl(
                                club.logo, ImageType.other)))),
              ),
            ),
            SizedBox(
              width: 12.px,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  club.fullName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  club.location?.city??'',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
