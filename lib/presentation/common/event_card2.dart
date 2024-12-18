import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesh/mesh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/extensions/number_extension.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../../infrastructure/core/enum/media_type.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';

class EventCard2 extends StatefulWidget {
  final EventDto event;
  final bool isLiked;
  final bool isInListing;
  final String distance;
  final String vKey;
  final double height;
  final bool isVideoMute;
  final ValueNotifier<bool> isMutedNotifier;

  final void Function()? onLike;
  final void Function()? onMute;
  final Function()? loadData;
  const EventCard2(
      {super.key,
      required this.vKey,
      required this.event,
      required this.isMutedNotifier,
      this.height = 65,
      this.distance = '',
      this.onLike,
      this.onMute,
      this.loadData,
      this.isInListing = false,
      this.isVideoMute = false,
      required this.isLiked});

  @override
  State<EventCard2> createState() => _EventCard2State();
}

class _EventCard2State extends State<EventCard2> {
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
    print("is video mute ${widget.isVideoMute}");
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
    if (isMute) {
      videoPlayerController!.setVolume(0.0);
    } else {
      videoPlayerController!.setVolume(1.0);
    }

    setState(() {});

    if (isAutoPlay) {
      togglePlayPause();
    }
    // print("is playing ${isPlaying}");

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
          height: widget.height.h,
          width: 100.w,
          decoration: BoxDecoration(
            //color: Colors.blue, // You can change this color
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 65.h,
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
                    return SoftEdgeBlur(
                      edges: [
                        EdgeBlur(
                          type: EdgeType.bottomEdge,
                          size: 120, // Increased size for smoother transition
                          sigma:30,
                          tintColor: Colors.black.withOpacity(0.2),
                          controlPoints: [
                            ControlPoint(
                              position: 0.7,
                              type: ControlPointType.visible,
                            ),
                            ControlPoint(
                              position: 1,
                              type: ControlPointType.transparent,
                            )
                          ],
                        )
                      ],
                      child: AspectRatio(
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
                                : _buildImageContent(index, widget.isInListing),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    // Main content with blur

                    Container(
                      height: 11.5.h, //110
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.4),
                          ],
                          stops: [0.0, 0.2, 0.5, 0.7, 1.0],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              SizedBox(
                                width: 80.w,
                                child: Text(
                                  widget.event.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 19.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.background,
                                  ),
                                ),
                              ),
                            //  SizedBox(height: .5.h),
                              Text(
                                StringExtension.formatDateForNewEventCard(
                                    widget.event.startDate),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      colorScheme.background.withOpacity(0.8),
                                ),
                              ),
                              SizedBox(height: .5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text(
                                      "${widget.event.priceRangeStart.toIndianRupeeString()}",
                                      style: TextStyle(
                                        color: colorScheme.background,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 65.w,
                                      child: Text(
                                        " onwards, (${widget.event.coverChargeEnabled ? 'Cover Charge Applicable' : 'Free'})",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.5.sp,
                                          fontWeight: FontWeight.w500,
                                          color: colorScheme.background
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(height: .5.h),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.isInListing)
                                Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: SvgPicture.asset(
                                      AssetConstants.roundRight,
                                      width: 30,
                                    ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 110,
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
                                //  print("is mute ${isMute}");
                                toggleMuteUnmute();
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 12.5.h,
                              width: 12.5.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    widget.isInListing
                                        ? (isMuted
                                            ? AssetConstants.muteFillIcon
                                            : AssetConstants.unmuteFillIcon)
                                        : (isMute
                                            ? AssetConstants.muteFillIcon
                                            : AssetConstants.unmuteFillIcon),
                                    color: Colors.white,
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
              ),
              Positioned(
                bottom: 100,
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
                                    print("is playingMain ${isPlaying}");
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

                      //page indicator
                      widget.event.assets.length <= 1
                          ? const SizedBox()
                          : Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                      widget.event.assets.length,
                                      (dotIndex) => Padding(
                                            padding: dotIndex ==
                                                    widget.event.assets.length -
                                                        1
                                                ? EdgeInsets.zero
                                                : EdgeInsets.only(right: 2.0.w),
                                            child: Container(
                                              height: 1.9.w,
                                              width: 1.9.w,
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
                            ),

                      // mute button
                    ],
                  ),
                ),
              ),
              if (widget.isInListing)
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 105.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.event.pub != null)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          child: CircleAvatar(
                                            radius: 4.5.w,
                                            backgroundImage: CachedNetworkImageProvider(
                                                CustomImageProvider.getImageUrl(
                                                    widget.event.pub?.logo ??
                                                        "",
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
                                              navigator<NavigationService>()
                                                  .navigateTo(
                                                      UserRoutes
                                                          .clubProfileRoute,
                                                      queryParams: {
                                                    'id': widget.event.pub!.id
                                                        .toString()
                                                  });
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
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
                                                    navigator<
                                                            NavigationService>()
                                                        .navigateTo(
                                                            UserRoutes
                                                                .clubProfileRoute,
                                                            queryParams: {
                                                          'id': widget
                                                              .event.pub!.id
                                                              .toString()
                                                        });
                                                  },
                                                  child: Text(
                                                    widget.event.pub!.fullName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: themeData
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            color: themeData
                                                                .colorScheme
                                                                .background,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16.5.sp),
                                                  ),
                                                ),
                                                Text(
                                                  widget.event.address
                                                          ?.vicinity ??
                                                      '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: themeData
                                                      .textTheme.bodySmall!
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
                                ]),
                          )
                      ],
                    ),
                  ),
                )
              
            ],
          ),
        )

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

  Widget _buildImageContent(int index, bool isInListing) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Transform.scale(
          scaleX: isInListing ? 1.2 : 1.2, // Adjust this value to control zoom level (1.0 is normal size)
          child: CachedNetworkImage(
            imageUrl: CustomImageProvider.getImageUrl(
              widget.event.assets[index].url,
              ImageType.other,
            ),
            fit: BoxFit
                .cover, // This will ensure it fills the space while maintaining aspect ratio
          ),
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
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.3),
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
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.1),
                      ),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.2),
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
