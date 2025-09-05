import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../infrastructure/extensions/extension.dart';

class MarkerEvent extends StatelessWidget {
  final String title;
  final int eventId;
  final String picture;
  final double distance;

  const MarkerEvent({
    super.key,
    required this.title,
    required this.eventId,
    required this.picture,
    required this.distance
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxHeight: 8.h,
      maxWidth: 7.5.w,
      child: Container(
        height: 8.h,
        width: 7.5.w,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust column size to fit children
          children: [
            Container(
              width: 7.5.w,
              height: 5.5.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Container(
                width: 6.w,
                height: 4.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: CachedNetworkImage(
                  imageUrl: picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 0.5.h), // Add spacing between the two containers
            Center(
              child: Container(
                height: 1.h,
                width: 1.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ).onTap(
        onTap: () {
          navigator<NavigationService>()
              .navigateTo(UserRoutes.eventDetailsRoute, queryParams: {
            //'valueListenerValue': _isMutedNotifier.value.toString(),
            'isVideoMuted': 'true',
            'id': '$eventId',
            'distance':
                '${distance > 1000 ? (distance / 1000).toStringAsFixed(1) : distance.toStringAsFixed(0)}km',
          }).then((value) {
            print(value);
          });
        },
        tooltip: title,
      ),
    );
  }
}
