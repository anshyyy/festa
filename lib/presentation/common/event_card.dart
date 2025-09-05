import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/number_extension.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/helpers/generic_helpers.dart';
import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/auth/dtos/user_dto.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../../infrastructure/core/enum/media_type.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../widgets/gradient_button.dart';
import 'show_profile_tile.dart';

class EventCard extends StatefulWidget {
  final EventDto event;
  final bool isLiked;
  final bool isInListing;
  final String distance;
  final String vKey;
  final bool isVideoMute;
  final ValueNotifier<bool> isMutedNotifier;

  final void Function()? onLike;
  final void Function()? onMute;
  final Function()? loadData;
  const EventCard(
      {super.key,
      required this.vKey,
      required this.event,
      required this.isMutedNotifier,
      this.distance = '',
      this.onLike,
      this.onMute,
      this.loadData,
      this.isInListing = false,
      this.isVideoMute = false,
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

  List<Map<String, String>> tags = [
    {'emoji': '🎛️', 'name': 'EDM'},
    {'emoji': '👠', 'name': 'Ladies night'},
    {'emoji': '🎭', 'name': 'Themed parties'},
    {'emoji': '🎸', 'name': 'Rock'},
    {'emoji': '💿', 'name': 'DJ'},
    {'emoji': '🎙️', 'name': 'Bands & Jams'},
    {'emoji': '🤖', 'name': 'Techno'},
    {'emoji': '🎬', 'name': 'Telugu'},
    {'emoji': '💃', 'name': 'Bolly Nights'},
  ];

  @override
  void initState() {

    super.initState();
      
    isMute = widget.isVideoMute;
    if (widget.event.assets[0].type == MediaEnum.video.name) {
      initVideoPlayer(videoUrl: widget.event.assets[0].url, isAutoPlay: false)
          .then((value) {
        setState(() {});
      });
    }
    widget.isMutedNotifier.addListener(_updateMuteState);
  }

  void _updateMuteState() {
    if (videoPlayerController != null) {
      videoPlayerController!.setVolume(widget.isMutedNotifier.value ? 0 : 1);
    }
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
    widget.isMutedNotifier.removeListener(_updateMuteState);

    super.dispose();
  }

  Future initVideoPlayer(
      {required String videoUrl, bool isAutoPlay = false}) async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await videoPlayerController!.initialize();
    initPlayer = false;
    isPlaying = false;
    print("controller mute ${isMute}");
    if (isMute) {
      videoPlayerController!.setVolume(0.0);
    } else {
      videoPlayerController!.setVolume(1.0);
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

        if (videoPlayerController!.value.position ==
            videoPlayerController!.value.duration) {
          videoPlayerController!.seekTo(Duration.zero);
          videoPlayerController!.play();
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
      videoPlayerController!.pause();
      isPlaying = false;
    }
    isVideoLoading = false;
    setState(() {});
  }

  void toggleMuteUnmute() {
    // if (widget.isInListing) {
    //   widget.onMute!();
    // }
    if (isMute) {
      videoPlayerController!.setVolume(1.0);
      isMute = false;
    } else {
      videoPlayerController!.setVolume(0.0);
      isMute = true;
    }
    setState(() {});
  }

  void toggleMuteUnmuteForValueListener(bool muted) {
    if (widget.isInListing) {
      widget.onMute!();
    }
    if (muted) {
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
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return VisibilityDetector(
      key: Key(widget.vKey),
      onVisibilityChanged: (info) {
        if (widget.event.assets[pageIndex].type == MediaEnum.video.name &&
            videoPlayerController != null) {
          var visiblePercentage = info.visibleFraction * 100;
          if (visiblePercentage <= 50 && isPlaying) {
            // print("this is playing1");
            togglePlayPause(isPlay: false);
          } else if (visiblePercentage >= 50 && !isPlaying) {
            //  print("this is playing2");
           togglePlayPause();
          }
        }
      },

      child: Container(
        padding: EdgeInsets.only(
            left: 6,
            right: 6,
            top: 8,
            bottom: widget.isInListing ? 3.25.h : 1.2.h),
        decoration: BoxDecoration(
            // gradient:
            //     LinearGradient(colors: [Color(0xff3C3E46), Color(0xff12141B)],
            //     begin:Alignment.topCenter,
            //     end: Alignment.bottomCenter

            //     ),
            color: !widget.isInListing
                ? Colors.transparent
                : const Color(0xff0B0F0E),
            borderRadius: BorderRadius.circular(25.px)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 100.w,
                      child: PageView.builder(
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
                          return AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: widget.event.assets[index].type ==
                                        MediaEnum.video.name
                                    ? _buildVideoContent(index)
                                    : _buildImageContent(index),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        //  height: 4.h,

                        padding: EdgeInsets.only(
                            left: 1.5.h,
                            right: widget.isInListing ? 1.8.h : 0,
                            bottom: 2.h),
                        width: 95.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //play pause button
                            widget.isInListing
                                ? SizedBox()
                                : widget.event.assets[pageIndex].type ==
                                            MediaEnum.video.name &&
                                        widget.isInListing
                                    ? GestureDetector(
                                        onTap: () {
                                          togglePlayPause(isPlay: !isPlaying);
                                        },
                                        child: Center(
                                          child: CircleAvatar(
                                            radius: 3.5.w,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .shadow,
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

                            //page indicator
                            widget.event.assets.length <= 1
                                ? const SizedBox()
                                : Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                          right: 0.7.w),
                                                  child: Container(
                                                    height: 1.5.w,
                                                    width: 1.5.w,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: pageIndex ==
                                                                dotIndex
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
                                  ),

                            // mute button
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: widget.event.assets[pageIndex].type ==
                                  MediaEnum.video.name &&
                              isPlaying
                          ? ValueListenableBuilder(
                              valueListenable: widget.isMutedNotifier,
                              builder: (context, isMuted, child) {
                                return GestureDetector(
                                  onTap: () {
                                    if (widget.isInListing) {
                                      toggleMuteUnmuteForValueListener(isMute);
                                    } else {
                                      toggleMuteUnmute();
                                    }
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    height: 12.5.h,
                                    width: 12.5.h,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 3.5.w,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                          child: Icon(
                                            widget.isInListing
                                                ? (isMuted
                                                    ? Icons.volume_off_rounded
                                                    : Icons.volume_up_rounded)
                                                : (isMute
                                                    ? Icons.volume_off_rounded
                                                    : Icons.volume_up_rounded),
                                            color: Colors.white,
                                            size: 4.5.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : SizedBox(
                              width: 4.5.w,
                              height: 3.h,
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
                    // if (widget.isInListing)
                    //   SizedBox(
                    //     width: 1.w,
                    //   ),

                    Padding(
                        padding: EdgeInsets.only(
                            left: widget.isInListing ? 1.5.h : 0.5.h),
                        child: SizedBox(
                          width: 80.w,
                          child: Text(
                            StringExtension.capitalize(eventFullName),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.bodyMedium!.copyWith(
                              color: themeData.colorScheme.background,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),

                    //       if (widget.isInListing)
                    //       Column(children: [
                    //       SizedBox(height: 0.8.h,),
                    //       GradientButton(
                    //           height: 28,
                    //           width: 104,
                    //           text: "Grab Passes",
                    //           textStyle: TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w600,
                    //             color: Theme.of(context).colorScheme.background
                    //           ),
                    //           onTap: () {}),]
                    // ),
                    // if (widget.isInListing) Spacer(),
                    if (!widget.isInListing) ...[
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          AnalyticsService()
                              .logEvent(eventName: 'share_event', paras: {
                            'event_id': widget.event.id.toString(),
                          });

                 

                          String formattedMessage =
                              GenericHelpers().formatEventShareMessage(
                            eventName: widget.event.name,
                            artists: widget.event.artists,
                            eventDateTime: DateTime.parse(widget.event.startDate),
                            eventLocation: widget.event.address!.vicinity,
                            eventCategory: AppConstants.event,
                            eventId: widget.event.id.toString(),
                          );
                         

                          Share.share(formattedMessage);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: SvgPicture.asset(AssetConstants.shareIcon),
                        ),
                      ),
                      SizedBox(
                        width: 2.5.w,
                      )
                    ]
                  ],
                ),

                SizedBox(height: 0.3.h),
                if (!widget.isInListing)
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.event.artists
                            .map((e) => ShortProfileTile(
                                onTap: () {
                                  AnalyticsService().logEvent(
                                      eventName: 'view_artist',
                                      paras: {
                                        'artist_id': e.id.toString(),
                                      });

                                  if (e.socialMediaLinks != null &&
                                      e.socialMediaLinks!.isNotEmpty) {
                                    if (e.socialMediaLinks!.length == 1) {
                                      _launchUrl(
                                          e.socialMediaLinks!.values.first);
                                    } else {
                                      _showSocialMediaBottomSheet(
                                          context, e.socialMediaLinks!);
                                    }
                                  } else {
                                    // Handle case when there are no social media links
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'No social media links available')),
                                    );
                                  }
                                },
                                artist: e,
                                themeData: themeData))
                            .toList(),
                      ),
                    ),
                  ),
                if (!widget.isInListing)
                  SizedBox(
                    height: 1.h,
                  ),
                // if (widget.event.address != null)
                // SizedBox(
                //   height: 1.5.h,
                // ),
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
                        if (widget.event.pub != null) SizedBox()
                        // Row(
                        //   children: [
                        //     SvgPicture.asset(AssetConstants.startIcon,
                        //         colorFilter: ColorFilter.mode(
                        //             themeData.colorScheme.surfaceTint,
                        //             BlendMode.srcIn)),
                        //     SizedBox(
                        //       width: 1.w,
                        //     ),
                        //     Text(
                        //       widget.event.pub!.averageRating.toStringAsFixed(1),
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodySmall!
                        //           .copyWith(
                        //               color:
                        //                   Theme.of(context).colorScheme.background),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    // SizedBox(
                    //   height: 1.5.h,
                    // ),

                    // getExpenseRating(rating: widget.event.id)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.isInListing)
                      SizedBox(
                        width: 2.w,
                      ),
                    Expanded(
                      child: Row(children: [
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
                              StringExtension.formatDateTimeLongNew(
                                  DateTime.parse(widget.event.startDate)),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        //price
                        SizedBox(width: 15.w),
                      ]),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   width: 1.w,
                            // ),
                            // SvgPicture.asset(
                            //   AssetConstants.ticketIcon,
                            // ),
                            SizedBox(
                              width: 2.w,
                            ),
                            // Text(
                            //   'From ${widget.event.priceRangeStart.toIndianRupeeString()}',

                            //${widget.event.priceRangeEnd != null ? ' - ${widget.event.priceRangeEnd!.toIndianRupeeString()}' : ''}',
                            // style: themeData.textTheme.bodySmall!.copyWith(
                            //   fontWeight: FontWeight.w600,
                            //   color: Theme.of(context).colorScheme.background,
                            // ),
                            //  )
                          ],
                        ),
                        SizedBox(
                          width: 3.w,
                        )
                      ],
                    )
                  ],
                ),
                if (widget.isInListing)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 2.w,
                        runSpacing: 2.w,
                        children: List.generate(
                          widget.event.categories.length,
                          (index) => GestureDetector(
                            onTap: () {
                              // Handle tag tap if needed
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 0.5.h,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                border: Border.all(
                                    width: .2.w,
                                    color: const Color(0xff373737)),
                                borderRadius: BorderRadius.circular(50.w),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${_getEmoji(widget.event.categories[index])} ${widget.event.categories[index].name}',
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                //TODO
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
                                    SizedBox(
                                      height: 22,
                                      child: SvgPicture.asset(
                                        AssetConstants.locationIcon,
                                      ),
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
                              SizedBox(
                                width: 2.4.w,
                              )
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
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
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
                                    AnalyticsService().logEvent(
                                        eventName: 'view_club',
                                        paras: {
                                          'club_id':
                                              widget.event.pub!.id.toString(),
                                        });

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
                                            widget.event.pub?.logo ?? "",
                                            // widget.event.pub?.coverImageUrl ?? '',
                                            ImageType.profile)),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      navigator<NavigationService>().navigateTo(
                                          UserRoutes.clubProfileRoute,
                                          queryParams: {
                                            'id':
                                                widget.event.pub!.id.toString()
                                          });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            AnalyticsService().logEvent(
                                                eventName: 'view_club',
                                                paras: {
                                                  'club_id': widget
                                                      .event.pub!.id
                                                      .toString(),
                                                });
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
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: themeData
                                                .textTheme.bodyMedium!
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
                                            color: themeData
                                                .colorScheme.background,
                                          ),
                                        ),
                                      ],
                                    ),
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
                                      color: themeData
                                          .colorScheme.primaryContainer
                                          .withOpacity(0.6),
                                      borderRadius:
                                          BorderRadius.circular(50.w)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          AssetConstants.locationIcon),
                                      Text(
                                        widget.event.distance <= 0
                                            ? widget.distance
                                            : '${widget.event.distance > 1000 ? (widget.event.distance / 1000).toStringAsFixed(1) : widget.event.distance.toStringAsFixed(0)}km',
                                        style: themeData.textTheme.bodySmall!
                                            .copyWith(
                                          color:
                                              themeData.colorScheme.background,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 0.h),
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
      ),

      //todo
    );
  }

  String _getEmoji(dynamic category) {
    if (category.emoji != null && category.emoji.isNotEmpty) {
      return category.emoji;
    } else {
      final matchingTag = tags.firstWhere(
        (tag) => tag['name']?.toLowerCase() == category.name.toLowerCase(),
        orElse: () => {'emoji': '🎉'}, // Default emoji if no match found
      );
      return matchingTag['emoji']!;
    }
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

  Widget _buildVideoContent(int index) {
    if (initPlayer || videoPlayerController == null) {
      return const VideoShimmer();
    } else if (videoPlayerController!.value.isInitialized) {
      return Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(videoPlayerController!),
          _buildGradientOverlay(),
        ],
      );
    } else {
      return const VideoShimmer();
    }
  }

  Widget _buildImageContent(int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: CustomImageProvider.getImageUrl(
            widget.event.assets[index].url,
            ImageType.other,
          ),
          fit: BoxFit.cover,
        ),
        _buildGradientOverlay(),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
          stops: [0.4, 1.0],
        ),
      ),
    );
  }

  void _showSocialMediaBottomSheet(
      BuildContext context, Map<String, String> links) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 2.h),
              
              // Title
              Text(
                'Artist Profiles',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              
              // Social media links
              ...links.entries.map(
                (entry) {
                  String url = entry.value;
                  if (url.startsWith('@')) url = url.substring(1);
                  String username = url.split('/').last;
                  if (username.isEmpty) {
                    username = url.split('/')[url.split('/').length - 2];
                  }
                  
                  return Container(
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                      ),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
                          ),
                        ),
                        child: _getSocialMediaIcon(entry.key),
                      ),
                      title: Text(
                        username,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, 
                                     size: 16, 
                                     color: Theme.of(context).colorScheme.onBackground),
                      onTap: () {
                        Navigator.pop(context);
                        _launchUrl(url);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        );
      },
    );
  }

  Widget _getSocialMediaIcon(String platform) {

    final iconPath = AssetConstants.socialMediaIcons[platform.toLowerCase()];
   
    if (iconPath != null) {
      if (iconPath.endsWith('.svg')) {
        return SvgPicture.asset(iconPath, width: 24, height: 24);
      } else {
        return Image.asset(iconPath, width: 24, height: 24);
      }
    }
    return Icon(Icons.link); // Fallback icon
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
      aspectRatio: 2 / 3,
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
