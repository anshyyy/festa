import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import 'show_profile_tile.dart';

class EventCard extends StatelessWidget {
  final EventDto event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Stack(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                  itemCount: event.assets.length +
                      (event.coverImage.isNotEmpty ? 1 : 0),
                  itemBuilder: (context, imageIndex, realIndex) {
                    final index =
                        imageIndex - (event.coverImage.isNotEmpty ? 1 : 0);
                    return Container(
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.8, 1],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            imageIndex == 0 && event.coverImage.isNotEmpty
                                ? event.coverImage
                                : event.assets[index].url,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    height: 100.w,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.easeInOutBack,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {},
                  )),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      event.name,
                      style: themeData.textTheme.bodyMedium!.copyWith(
                        color: themeData.colorScheme.background,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: SvgPicture.asset(AssetConstants.shareIcon),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: event.artists
                        .map((e) =>
                            ShortProfileTile(artist: e, themeData: themeData))
                        .toList(),
                  ),
                ),
              ),
              if (event.address != null)
                SizedBox(
                  height: 1.h,
                ),
              if (event.address != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetConstants.locationIcon,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: Text(
                        event.address!.vicinity,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 1.w,
                  ),
                  SvgPicture.asset(
                    AssetConstants.ticketIcon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '${AppConstants.rupees}${event.priceRangeStart.toStringAsFixed(0)}${event.priceRangeEnd != null ? ' - ${event.priceRangeEnd!.toStringAsFixed(0)}' : ''}',
                    style: themeData.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetConstants.durationIcon,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        event.startDate,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ],
                  ),
                  if (event.pub != null)
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetConstants.startIcon,
                          color: Colors.yellow[800],
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          event.pub!.averageRating.toStringAsFixed(1),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                      ],
                    )
                ],
              )
            ],
          ),
          SizedBox(
            height: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (event.pub != null)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4.5.w,
                              backgroundImage: CachedNetworkImageProvider(
                                  event.pub!.coverImageUrl),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.pub!.fullName,
                                  style: themeData.textTheme.bodyMedium!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.background,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.5.sp),
                                ),
                                Text(
                                  event.pub!.userName,
                                  style: themeData.textTheme.bodySmall!
                                      .copyWith(fontSize: 14.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.5.w, vertical: .2.h),
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(50.w)),
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetConstants.locationIcon),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                '${event.distance > 1000 ? (event.distance / 1000).toStringAsFixed(1) : event.distance.toStringAsFixed(0)}km',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: themeData.colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const SizedBox(),
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (event.startDate.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.7.w, vertical: .3.h),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(50.w)),
                              child: Text(
                                event.startDate,
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: themeData.colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          else
                            const SizedBox(),
                          SvgPicture.asset(
                            AssetConstants.heartOutlinedIcon,
                            width: 5.w,
                            height: 5.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                              event.assets.length +
                                  (event.coverImage.isNotEmpty ? 1 : 0),
                              (dotIndex) => Padding(
                                    padding: EdgeInsets.all(.7.w),
                                    child: Container(
                                      height: 1.5.h,
                                      width: 1.5.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Stack(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 2,
                  itemBuilder: (context, imageIndex, realIndex) {
                    return Container(
                      color: Colors.white,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    height: 100.w,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.easeInOutBack,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {},
                  )),
              SizedBox(
                height: 1.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ShortProfileTileShimmer(themeData: themeData),
                    ShortProfileTileShimmer(themeData: themeData),
                    ShortProfileTileShimmer(themeData: themeData),
                    ShortProfileTileShimmer(themeData: themeData),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
