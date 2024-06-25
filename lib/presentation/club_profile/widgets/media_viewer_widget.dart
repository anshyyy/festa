import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../application/club_profile/media_viewer/media_viewer_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class MediaViewerWidget extends StatelessWidget {
  final String type;
  final String url;
  final int pubId;
  const MediaViewerWidget(
      {super.key, required this.type, required this.url, required this.pubId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => MediaViewerCubit(MediaViewerState.initial(
        pubId: pubId,
        serverUrl: appConfig.serverUrl,
        url: url,
        type: type,
      ))
        ..init(),
      child: MediaViewerWidgetConsumer(type: type, url: url),
    );
  }
}

class MediaViewerWidgetConsumer extends StatelessWidget {
  const MediaViewerWidgetConsumer({
    super.key,
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<MediaViewerCubit, MediaViewerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Stack(children: [
                  type == MediaType.IMAGE
                      ? PhotoView(
                          imageProvider: CachedNetworkImageProvider(
                              CustomImageProvider.getImageUrl(
                                  url, ImageType.other)))
                      : !state.isLoading &&
                              state.videoPlayerController != null &&
                              state.videoPlayerController!.value.isInitialized
                          ? GestureDetector(
                              onTap: () {
                                if (state.isPlaying) {
                                  context.read<MediaViewerCubit>().pause();
                                } else {
                                  context.read<MediaViewerCubit>().play();
                                }
                              },
                              child: Center(
                                child: AspectRatio(
                                    aspectRatio: state.videoPlayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(
                                        state.videoPlayerController!)),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                  if (type != MediaType.IMAGE &&
                      !state.isPlaying)
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.48,
                      left: MediaQuery.of(context).size.width * 0.45,
                      child: GestureDetector(
                        onTap: () {
                          context.read<MediaViewerCubit>().play();
                        },
                        child: SvgPicture.asset(
                          AssetConstants.mediaPlayIcon,
                          width: 10.w,
                        ),
                      ),
                    ),
                  Positioned(
                      top: 16.w,
                      child: SizedBox(
                        width: 100.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    navigator<NavigationService>().goBack();
                                    context
                                        .read<MediaViewerCubit>()
                                        .closePlayer();
                                  },
                                  child: SvgPicture.asset(
                                      AssetConstants.arrowLeft)),
                              // SvgPicture.asset(AssetConstants.hamBurgerMenu),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 5.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        width: 100.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 3.w,
                                        foregroundImage:
                                            CachedNetworkImageProvider(
                                                CustomImageProvider.getImageUrl(
                                                    state.pub?.logo,
                                                    ImageType.other)),
                                      ),
                                      SizedBox(width: 2.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.pub!.fullName,
                                            style: textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        colorScheme.background),
                                          ),
                                          Text(
                                            '@${state.pub?.tag?.tag ?? ''}',
                                            style:
                                                textTheme.bodySmall!.copyWith(
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    state.pub!.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: .7.w, horizontal: 1.5.w),
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: colorScheme.background
                                            .withOpacity(.1),
                                        borderRadius:
                                            BorderRadius.circular(50.w)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.locationIcon,
                                          height: 4.w,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            state.pub!.location!.vicinity,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.bodySmall!
                                                .copyWith(
                                                    fontSize: 13.5.sp,
                                                    color:
                                                        colorScheme.background),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            // Column(
                            //   children: [
                            //     SvgPicture.asset(
                            //         AssetConstants.heartOutlinedIcon),
                            //     SizedBox(
                            //       height: 4.h,
                            //     ),
                            //     SvgPicture.asset(AssetConstants.shareIcon),
                            //   ],
                            // ),
                          ],
                        ),
                      ))
                ]),
              );
      },
    );
  }
}

// class VideoPlayerWidget extends StatelessWidget {
//   final String url;
//   const VideoPlayerWidget({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VideoPlayerCubit(
//         VideoPlayerState.initial(
//           url: url,
//         ),
//       )..init(),
//       child: const VideoPlayerConsumer(),
//     );
//   }
// }

// class VideoPlayerConsumer extends StatelessWidget {
//   const VideoPlayerConsumer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
//       listener: (context, state) {
//         
//       },
//       builder: (context, state) {
//         return state.videoPlayerController.value.isInitialized
//             ? GestureDetector(
//                 // onLongPress: (){
//                 //   context.read<VideoPlayerCubit>().pause();
//                 // },
//                 child: Center(
//                   child: AspectRatio(
//                       aspectRatio:
//                           state.videoPlayerController.value.aspectRatio,
//                       child: VideoPlayer(state.videoPlayerController)),
//                 ),
//               )
//             : const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
