import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
import '../../infrastructure/core/enum/media_type.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import 'show_profile_tile.dart';

class EventCard extends StatefulWidget {
  final EventDto event;
  final bool isLiked;
  final bool isInListing;
  final String distance;
  final String vKey;

  final void Function()? onLike;
  final Function()? loadData;
  const EventCard(
      {super.key,
      required this.vKey,
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
  int pageIndex = 0;
  bool initPlayer = false;
  bool isVideoLoading = false;
  bool isPlaying = false;
  bool isMute = false;

  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.event.assets[0].type == MediaEnum.video.name) {
      initVideoPlayer(videoUrl: widget.event.assets[0].url, isAutoPlay: false)
          .then((value) {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
    super.dispose();
  }

  Future initVideoPlayer(
      {required String videoUrl, bool isAutoPlay = false}) async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await videoPlayerController!.initialize();
    initPlayer = false;
    isPlaying = false;
      if (isMute) {
      videoPlayerController!.setVolume(0.0);
    }

      setState(() {});

    if (isAutoPlay) {
      togglePlayPause();
    }

  
    videoPlayerController!.addListener(
      () {
        if (!videoPlayerController!.value.isPlaying &&
            videoPlayerController!.value.isInitialized &&
            (videoPlayerController!.value.duration ==
                videoPlayerController!.value.position)) {
          setState(() {});
        }

        if (videoPlayerController!.value.isPlaying) {
          isPlaying = true;
          setState(() {});
        } else {
          isPlaying = false;
          setState(() {});
        }
      },
    );
  }

  void togglePlayPause({bool isPlay = true}) {
    if (isPlay) {
      if (videoPlayerController!.value.position.inSeconds >=
          videoPlayerController!.value.duration.inSeconds) {
        videoPlayerController!.seekTo(Duration.zero);
      }
      isVideoLoading = true;
      videoPlayerController!.play();
      isPlaying = true;
    } else {
      // pause video
      videoPlayerController!.pause();
      isPlaying = false;
    }
    isVideoLoading = false;
    setState(() {});
  }

  void toggleMuteUnmute() {
    if (isMute) {
      videoPlayerController!.setVolume(1.0);
      isMute = false;
    } else {
      videoPlayerController!.setVolume(0.0);
      isMute = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final eventFullName = widget.event.name;
    final words = eventFullName.split(' ');
    final eventTitle = words.isEmpty
        ? 'Unknown'
        : words.length >= 2
            ? words.length == 2
                ? '${words[0]} ${words[1]}'
                : '${words[0]} ${words[1]} ...'
            : words[0];

    return VisibilityDetector(
      key: Key(widget.vKey),
      onVisibilityChanged: (info) {
        if (widget.event.assets[pageIndex].type == MediaEnum.video.name &&
            videoPlayerController != null) {
          var visiblePercentage = info.visibleFraction * 100;
          if (visiblePercentage <= 50 && isPlaying) {
            togglePlayPause(isPlay: false);
          } else if (visiblePercentage >= 50 && !isPlaying) {
            togglePlayPause();
          }
        }
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: ExpandablePageView.builder(
                        itemCount: widget.event.assets.length,
                        onPageChanged: (value) {
                          setState(() {
                            pageIndex = value;
                          });
                          if (videoPlayerController != null) {
                            togglePlayPause(isPlay: false);
                          }
                          if (widget.event.assets[value].type ==
                              MediaEnum.video.name) {
                            initPlayer = true;
                            initVideoPlayer(
                              videoUrl: widget.event.assets[value].url,
                              isAutoPlay: true,
                            );
                          }
                        },
                        itemBuilder: (context, index) {
                          return widget.event.assets[index].type ==
                                  MediaEnum.video.name
                              ? initPlayer || videoPlayerController == null
                                  ? const VideoShimmer()
                                  : videoPlayerController!.value.isInitialized
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (widget.isInListing) {
                                                  navigator<NavigationService>()
                                                      .navigateTo(
                                                          UserRoutes
                                                              .eventDetailsRoute,
                                                          queryParams: {
                                                        'id': widget.event.id
                                                            .toString(),
                                                        'distance':
                                                            '${widget.event.distance > 1000 ? (widget.event.distance / 1000).toStringAsFixed(1) : widget.event.distance.toStringAsFixed(0)}km',
                                                      }).then((value) {});
                                                } else {
                                                  togglePlayPause(
                                                    isPlay: !isPlaying,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: AspectRatio(
                                                  aspectRatio: 4 / 5,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: VideoPlayer(
                                                        videoPlayerController!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (!widget.isInListing &&
                                                !isPlaying)
                                              Positioned(
                                                bottom: null,
                                                left: null,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    togglePlayPause(
                                                        isPlay: !isPlaying);
                                                  },
                                                  child: Center(
                                                    child: CircleAvatar(
                                                      radius: 8.w,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .shadow
                                                              .withOpacity(0.5),
                                                      child: Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color: Colors.white,
                                                        size: 12.w,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        )
                                      : const VideoShimmer()
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: AspectRatio(
                                        aspectRatio: 4 / 5,
                                        child: Image.network(
                                            CustomImageProvider.getImageUrl(
                                                widget.event.assets[index].url,
                                                ImageType.other))),
                                  ),
                                );
                        }),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.5.h, horizontal: 4.w),
                      width: 95.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.event.assets[pageIndex].type ==
                                      MediaEnum.video.name &&
                                  widget.isInListing
                              ? GestureDetector(
                                  onTap: () {
                                    togglePlayPause(isPlay: !isPlaying);
                                  },
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 3.5.w,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.shadow,
                                      child: Icon(
                                        isPlaying
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 4.5.w,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 4.5.w,
                                  height: 3.h,
                                ),
                          widget.event.assets.length <= 1
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...List.generate(
                                        widget.event.assets.length,
                                        (dotIndex) => Padding(
                                              padding: dotIndex ==
                                                      widget.event.assets
                                                              .length -
                                                          1
                                                  ? EdgeInsets.zero
                                                  : EdgeInsets.only(
                                                      right: 1.2.w),
                                              child: Container(
                                                height: 2.w,
                                                width: 2.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: pageIndex == dotIndex
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .background
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .secondaryContainer),
                                              ),
                                            )),
                                  ],
                                ),
                          widget.event.assets[pageIndex].type ==
                                      MediaEnum.video.name &&
                                  isPlaying
                              ? GestureDetector(
                                  onTap: () {
                                    toggleMuteUnmute();
                                  },
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 3.5.w,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.shadow,
                                      child: Icon(
                                        isMute
                                            ? Icons.volume_off_rounded
                                            : Icons.volume_up_rounded,
                                        color: Colors.white,
                                        size: 4.5.w,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 4.5.w,
                                  height: 3.h,
                                ),
                        ],
                      ),
                    ),
                  )
                ],
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
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
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
            ],
          ),
          SizedBox(
            height: 105.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.event.pub != null)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                                        navigator<NavigationService>()
                                            .navigateTo(
                                                UserRoutes.clubProfileRoute,
                                                queryParams: {
                                              'id': widget.event.pub!.id
                                                  .toString()
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
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: themeData.colorScheme.background,
                                      ),
                                    ),
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
                                    color:
                                        themeData.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(50.w)),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.event.distance <= 0
                                          ? widget.distance
                                          : '${widget.event.distance > 1000 ? (widget.event.distance / 1000).toStringAsFixed(1) : widget.event.distance.toStringAsFixed(0)}km',
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
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
                        children: [],
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

class VideoShimmer extends StatelessWidget {
  const VideoShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!.withOpacity(0.15),
        highlightColor: Colors.grey[400]!.withOpacity(0.15),
        child: Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
