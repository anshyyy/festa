import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
         
      },
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
                itemCount: state.pub!.assets.length,
                itemBuilder: (context, imageIndex, realIndex) {
              
                  final asset = state.pub!.assets[imageIndex];                  
                  // (asset);
                  // (asset.type);
                  if (asset.type == 'image') {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            CustomImageProvider.getImageUrl(
                                asset.url,
                                ImageType.other),
                          ),
                        ),
                      ),
                    );
                  } else if (asset.type == 'video') {
                    return VideoPlayerWidget(videoUrl: asset.url);
                  }
                  return SizedBox();
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
                  },
                )),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      state.pub!.assets.length,
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

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = 
    
    VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: 16/9,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_controller),
                _ControlsOverlay(controller: _controller),
              ],
            ),
          )
        : Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator()),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.setVolume(0) : controller.setVolume(1);
          },
        ),
      ],
    );
  }
}
