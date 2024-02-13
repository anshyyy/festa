import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class TicketHistoryTile extends StatelessWidget {
  final String eventPoster;
  final String eventTitle;
  final String artist;
  final String duration;
  final Color? dominantColor;

  const TicketHistoryTile({
    super.key,
    required this.eventPoster,
    required this.eventTitle,
    required this.artist,
    required this.duration,
    this.dominantColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.2.h, vertical: 1.2.h),
      margin: EdgeInsets.only(bottom: 1.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: dominantColor ?? Theme.of(context).primaryColor, width: .5.w),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).scaffoldBackgroundColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    height:18.w,
                    width: 18.w,
                    child: CachedNetworkImage(
                      imageUrl: eventPoster,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 3.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  Text(artist),
                  Text(duration)
                ],
              ),
            ],
          ),
          SvgPicture.asset(AssetConstants.arrowRight)
        ],
      ),
    );
  }
}
