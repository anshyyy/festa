import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
                itemCount: state.assetToDisplay.length,
                itemBuilder: (context, imageIndex, realIndex) {
                  final asset = state.assetToDisplay[imageIndex];
                  return AspectRatio(
                    aspectRatio: 3 / 4,
                    child: asset.type == 'image'
                        ? Container(
                            // https://videos.pexels.com/video-files/17687289/17687289-uhd_1440_2560_30fps.mp4
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  CustomImageProvider.getImageUrl(
                                      asset.url, ImageType.other),
                                ),
                              ),
                            ),
                          )
                        : asset.type == 'video'
                            ? VideoPlayerWidget(
                                isMute: state.isMuted,
                                onTap: () {
                                  context.read<ClubProfileCubit>().toggleMute();
                                },
                                videoUrl: asset.url,
                                isMediaViewerAtTop: state.isAtTop,
                              )
                            : const SizedBox(),
                  );
                },
                options: CarouselOptions(
                  height: 60.h,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOutBack,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context
                        .read<ClubProfileCubit>()
                        .onCarouselChange(index: index);
                    // state.caraouselController.jumpTo(
                    //     state.caraouselController.position.minScrollExtent +
                    //         (index * MediaQuery.of(context).size.width));
                  },
                )),

            // SafeArea(child:SmoothPageIndicator(
            //   effect: ScrollingDotsEffect(),
            //   count: state.assetToDisplay.length,
            //   controller: state.caraouselController,
            // ) ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      state.assetToDisplay.length,
                      (dotIndex) => Padding(
                            padding: EdgeInsets.all(.3.w),
                            child: Container(
                              height: 1.5.h,
                              width: 1.3.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dotIndex == state.currentImageIndex
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                            ),
                          ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isMediaViewerAtTop;
  final void Function() onTap;
  final bool isMute;

  const VideoPlayerWidget(
      {Key? key,
      required this.videoUrl,
      required this.isMute,
      required this.isMediaViewerAtTop,
      required this.onTap})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  static final Map<String, VideoPlayerController> _cachedControllers = {};
  late VideoPlayerController _controller;
  bool _isIconVisible = false;
  Timer? _hideIconTimer;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    try {
      if (_cachedControllers.containsKey(widget.videoUrl)) {
        _controller = _cachedControllers[widget.videoUrl]!;
        await _controller.seekTo(Duration.zero);
      } else {
        _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
        await _controller.initialize();
        _cachedControllers[widget.videoUrl] = _controller;
      }

      _controller.setLooping(true);
      _updateVolume();
      
      if (!widget.isMediaViewerAtTop) {
        await _controller.play();
      }
      
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing video controller: $e');
    }
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _cleanupCurrentVideo();
      _initializeController();
    } else if (oldWidget.isMute != widget.isMute) {
      _updateVolume();
    } else if (oldWidget.isMediaViewerAtTop != widget.isMediaViewerAtTop) {
      _updatePlaybackState();
    }
  }

  void _cleanupCurrentVideo() {
    _controller.pause();
    _controller.setVolume(0);
  }

  void _updatePlaybackState() {
    if (widget.isMediaViewerAtTop) {
      _controller.pause();
      _controller.setVolume(0);
    } else {
      _controller.play();
      _updateVolume();
    }
  }

  void _updateVolume() {
    if (!mounted) return;
    if (widget.isMediaViewerAtTop) {
      _controller.setVolume(0);
    } else {
      _controller.setVolume(widget.isMute ? 0 : 1);
    }
  }

  void _onIconTapped() {
    setState(() {
      _isIconVisible = true; // Make the icon visible when tapped
    });

    // Cancel any existing timer before starting a new one
    _hideIconTimer?.cancel();

    // Hide the icon after 2-3 seconds
    _hideIconTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _isIconVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.pause();
    _hideIconTimer?.cancel();
    // Clear the cache when it gets too large
    if (_cachedControllers.length > 5) {
      for (var controller in _cachedControllers.values) {
        controller.dispose();
      }
      _cachedControllers.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              _ControlsOverlay(
                isVideoMuted: widget.isMute,
                controller: _controller,
                isAtTop: widget.isMediaViewerAtTop,
                onTap: () {
                  widget.onTap();
                  _onIconTapped();
                },
                iconTap: _onIconTapped
              ),
              if (_isIconVisible)
                Positioned(
                  top: 12.5.h,
                  right: 4.w,
                  child: SizedBox(
                    width: 3.h,
                    height: 3.h,
                    child: widget.isMediaViewerAtTop
                        ? SvgPicture.asset(AssetConstants.muteFillIcon,
                            color: Colors.white)
                        : SvgPicture.asset(
                            widget.isMute
                                ? AssetConstants.muteFillIcon
                                : AssetConstants.unmuteFillIcon,
                            color: Colors.white,
                          ),
                  ),
                ),
            ],
          )
        : Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final bool isAtTop;
  final void Function() onTap;
   final void Function() iconTap;
  final bool isVideoMuted;
  const _ControlsOverlay(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.iconTap,
      required this.isVideoMuted,
      required this.isAtTop})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            onTap();
            iconTap();
            if (!isAtTop) {
              controller.setVolume(isVideoMuted ? 0 : 1);
            }
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
