import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/number_extension.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/helpers/generic_helpers.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import 'show_profile_tile.dart';

class EventCard extends StatefulWidget {
  final EventDto event;
  final bool isLiked;
  final bool isInListing;
  final String distance;
  final void Function()? onLike;
  final Function()? loadData;
  const EventCard(
      {super.key,
      required this.event,
      this.distance = '',
      this.onLike,
      this.loadData,
      this.isInListing = false,
      required this.isLiked});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int index = 0;

  void init({required String url}) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // final colorScheme = themeData.colorScheme;
    // final textTheme = themeData.textTheme;
    final eventFullName = widget.event.name;
    final words = eventFullName.split(' ');
    final eventTitle = words.isEmpty
        ? 'Unknown'
        : words.length >= 2
            ? words.length == 2
                ? '${words[0]} ${words[1]}'
                : '${words[0]} ${words[1]} ...'
            : words[0];

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CarouselSlider.builder(
            //     itemCount: widget.event.assets.length +
            //         (widget.event.coverImage.isNotEmpty ? 1 : 0),
            //     itemBuilder: (context, imageIndex, realIndex) {
            //       final index = imageIndex -
            //           (widget.event.coverImage.isNotEmpty ? 1 : 0);
            //       return Container(
            //         foregroundDecoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           gradient: LinearGradient(
            //             colors: [
            //               Colors.black.withOpacity(.8),
            //               Colors.transparent,
            //               Colors.transparent,
            //               Colors.black.withOpacity(.8)
            //             ],
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //             stops: const [0, 0.4, 0.6, 1],
            //           ),
            //         ),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           image: DecorationImage(
            //             fit: BoxFit.cover,
            //             image: NetworkImage(
            //               imageIndex == 0 &&
            //                       widget.event.coverImage.isNotEmpty
            //                   ? widget.event.coverImage
            //                   : widget.event.assets[index].url,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     options: CarouselOptions(
            //       autoPlay: false,
            //       height: 105.w,
            //       enlargeCenterPage: true,
            //       autoPlayCurve: Curves.easeInOutBack,
            //       viewportFraction: 1,
            //       enableInfiniteScroll: false,
            //       onPageChanged: (index, reason) {
            //         Future.delayed(const Duration(milliseconds: 300))
            //             .then((value) {
            //           setState(() {
            //             this.index = index;
            //           });
            //         });
            //       },
            //     )),
            SizedBox(
              height: 100.w,
              child: PageView.builder(
                itemCount: widget.event.assets.length +
                    (widget.event.coverImage.isNotEmpty ? 1 : 0),
                itemBuilder: (context, imageIndex) {
                  final index = imageIndex == 0
                      ? imageIndex
                      : imageIndex -
                          (widget.event.coverImage.isNotEmpty ? 1 : 0);

                  return Container(
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(.8)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0.4, 0.6, 1],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          imageIndex == 0 && widget.event.coverImage.isNotEmpty
                              ? CustomImageProvider.getImageUrl(
                                  widget.event.coverImage, ImageType.other)
                              : CustomImageProvider.getImageUrl(
                                  widget.event.assets[index].url,
                                  ImageType.other),
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.isInListing ? eventTitle : eventFullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.background,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(GenericHelpers().getDynamicLink(
                        AppConstants.event, widget.event.id.toString()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: SvgPicture.asset(AssetConstants.shareIcon),
                  ),
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
                  children: widget.event.artists
                      .map((e) => ShortProfileTile(
                          onTap: () {
                            navigator<NavigationService>().navigateTo(
                                UserRoutes.artistProfileScreenRoute,
                                queryParams: {
                                  'id': e.id.toString()
                                }).then((value) {
                              if (widget.loadData != null) {
                                widget.loadData!();
                              }
                            });
                          },
                          artist: e,
                          themeData: themeData))
                      .toList(),
                ),
              ),
            ),
            // if (widget.event.address != null)
            SizedBox(
              height: 1.5.h,
            ),
            // if (widget.event.address != null)
            //   Row(
            //     children: [
            //       SvgPicture.asset(
            //         AssetConstants.locationIcon,
            //       ),
            //       SizedBox(
            //         width: 2.w,
            //       ),
            //       Expanded(
            //         child: Text(
            //           widget.event.address!.vicinity,
            //           overflow: TextOverflow.ellipsis,
            //           style: themeData.textTheme.bodySmall!.copyWith(
            //               fontWeight: FontWeight.w400,
            //               color: Theme.of(context).colorScheme.background),
            //         ),
            //       )
            //     ],
            //   ),
            // SizedBox(
            //   height: 1.h,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AssetConstants.durationIcon,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.srcIn)),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      StringExtension.formatDateTimeLong(
                          DateTime.parse(widget.event.startDate)),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                if (widget.event.pub != null)
                  Row(
                    children: [
                      SvgPicture.asset(AssetConstants.startIcon,
                          colorFilter: ColorFilter.mode(
                              themeData.colorScheme.surfaceTint,
                              BlendMode.srcIn)),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        widget.event.pub!.averageRating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ],
                  )
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      '${widget.event.priceRangeStart.toIndianRupeeString()}${widget.event.priceRangeEnd != null ? ' - ${widget.event.priceRangeEnd!.toIndianRupeeString()}' : ''}',
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    )
                  ],
                ),
                getExpenseRating(rating: widget.event.id)
              ],
            ),
            !widget.isInListing
                ? Column(
                    children: [
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.locationIcon,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.event.address!.vicinity,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.event.distance <= 0
                                ? widget.distance
                                : '${widget.event.distance > 1000 ? (widget.event.distance / 1000).toStringAsFixed(1) : widget.event.distance.toStringAsFixed(0)}km',
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: themeData.colorScheme.background,
                              fontWeight: FontWeight.w600,
                              // fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox(),
            // widget.event.categories.isNotEmpty
            //     ? Container(
            //       margin: EdgeInsets.only(bottom: 4.w),
            //       child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: widget.event.categories.map((e) {
            //               return Container(
            //                 margin: EdgeInsets.symmetric(horizontal: .7.w),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 2.5.w, vertical: 1.5.w),
            //                 decoration: BoxDecoration(
            //                     color: colorScheme.surface,
            //                     borderRadius: BorderRadius.circular(10.w)),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                       height: 2.5.w,
            //                       width: 2.5.w,
            //                       decoration: BoxDecoration(
            //                           shape: BoxShape.circle,
            //                           border: Border.all(
            //                               color: colorScheme.background)),
            //                     ),
            //                     SizedBox(
            //                       width: 2.w,
            //                     ),
            //                     Text(
            //                       e.name,
            //                       style: textTheme.bodySmall!.copyWith(
            //                           color: colorScheme.background,
            //                           fontSize: 14.sp,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             }).toList(),
            //           ),
            //         ),
            //     )
            //     : const SizedBox()
          ],
        ),
        SizedBox(
          height: 105.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.event.pub != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                navigator<NavigationService>().navigateTo(
                                    UserRoutes.clubProfileRoute,
                                    queryParams: {
                                      'id': widget.event.pub!.id.toString()
                                    });
                              },
                              child: CircleAvatar(
                                radius: 4.5.w,
                                backgroundImage: CachedNetworkImageProvider(
                                    CustomImageProvider.getImageUrl(
                                        widget.event.pub?.coverImageUrl ?? '',
                                        ImageType.profile)),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      navigator<NavigationService>().navigateTo(
                                          UserRoutes.clubProfileRoute,
                                          queryParams: {
                                            'id':
                                                widget.event.pub!.id.toString()
                                          });
                                    },
                                    child: Text(
                                      widget.event.pub!.fullName,
                                      style: themeData.textTheme.bodyMedium!
                                          .copyWith(
                                              color: themeData
                                                  .colorScheme.background,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.5.sp),
                                    ),
                                  ),
                                  Text(
                                    widget.event.address?.vicinity ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: themeData.colorScheme.background,
                                    ),
                                  ),
                                  //   Text(
                                  //     widget.event.address?.vicinity ?? '',
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     style: themeData.textTheme.bodySmall!
                                  //         .copyWith(
                                  //       fontWeight: FontWeight.w400,
                                  //       fontSize: 14.sp,
                                  //       color: themeData.colorScheme.background,
                                  //     ),
                                  //   ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.isInListing
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: .35.h),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(50.w)),
                              child: Row(
                                children: [
                                  Text(
                                    widget.event.distance <= 0
                                        ? widget.distance
                                        : '${widget.event.distance > 1000 ? (widget.event.distance / 1000).toStringAsFixed(1) : widget.event.distance.toStringAsFixed(0)}km',
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      color: themeData.colorScheme.background,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : GestureDetector(
                              onTap: widget.onLike,
                              child: SvgPicture.asset(
                                widget.isLiked
                                    ? AssetConstants.heartFilledIcon
                                    : AssetConstants.heartOutlinedIcon,
                                width: 6.w,
                                height: 6.w,
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
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // if (widget.event.startDate.isNotEmpty)
                        //   Container(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 2.w, vertical: .5.h),
                        //     decoration: BoxDecoration(
                        //         color: themeData.colorScheme.primaryContainer,
                        //         borderRadius: BorderRadius.circular(50.w)),
                        //     child: Text(
                        //       StringExtension.formatDateTimeLong(
                        //           DateTime.parse(widget.event.startDate)),
                        //       style: themeData.textTheme.bodySmall!.copyWith(
                        //         color: themeData.colorScheme.background,
                        //         fontWeight: FontWeight.w600,
                        //         // fontSize: 14.sp,
                        //       ),
                        //     ),
                        //   )
                        // else
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                            widget.event.assets.length +
                                (widget.event.coverImage.isNotEmpty ? 1 : 0),
                            (dotIndex) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .6.w),
                                  child: Container(
                                    height: 1.7.h,
                                    width: 1.7.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: index == dotIndex
                                            ? Theme.of(context)
                                                .colorScheme
                                                .background
                                            : Theme.of(context)
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
    );
  }

  SvgPicture getExpenseRating({required int rating}) {
    switch (rating) {
      case 1:
        return SvgPicture.asset(
          AssetConstants.expenseRating1,
          height: 2.5.w,
        );
      case 2:
        return SvgPicture.asset(
          AssetConstants.expenseRating2,
          height: 2.5.w,
        );
      case 3:
        return SvgPicture.asset(
          AssetConstants.expenseRating3,
          height: 2.5.w,
        );
      case 4:
        return SvgPicture.asset(
          AssetConstants.expenseRating4,
          height: 2.5.w,
        );
      case 5:
        return SvgPicture.asset(
          AssetConstants.expenseRating5,
          height: 2.5.w,
        );
      default:
        return SvgPicture.asset(
          AssetConstants.expenseRating1,
          height: 2.5.w,
        );
    }
  }
}

// class EventCardShimmer extends StatelessWidget {
//   const EventCardShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return Padding(
//       padding: EdgeInsets.only(bottom: 1.h),
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               CarouselSlider.builder(
//                   itemCount: 2,
//                   itemBuilder: (context, imageIndex, realIndex) {
//                     return Container(
//                       color: Colors.white,
//                     );
//                   },
//                   options: CarouselOptions(
//                     autoPlay: false,
//                     height: 100.w,
//                     enlargeCenterPage: true,
//                     autoPlayCurve: Curves.easeInOutBack,
//                     viewportFraction: 1,
//                     enableInfiniteScroll: false,
//                     onPageChanged: (index, reason) {},
//                   )),
//               SizedBox(
//                 height: 1.h,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ShortProfileTileShimmer(themeData: themeData),
//                     ShortProfileTileShimmer(themeData: themeData),
//                     ShortProfileTileShimmer(themeData: themeData),
//                     ShortProfileTileShimmer(themeData: themeData),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
