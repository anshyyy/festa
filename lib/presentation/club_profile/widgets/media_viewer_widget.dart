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
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../widgets/gradient_button.dart';

class MediaViewerWidget extends StatelessWidget {
  final String type;
  final String url;
  final int pubId;
  final List<AssetDto> assets;
  final int currentIndex;

  const MediaViewerWidget({
    Key? key,
    required this.type,
    required this.url,
    required this.pubId,
    required this.assets,
    required this.currentIndex,
  }) : super(key: key);

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
      child: MediaViewerWidgetConsumer(
        type: type,
        url: url,
        assets: assets,
        currentIndex: currentIndex,
      ),
    );
  }
}

class MediaViewerWidgetConsumer extends StatelessWidget {
  final String type;
  final String url;
  final List<AssetDto> assets;
  final int currentIndex;

  const MediaViewerWidgetConsumer({
    Key? key,
    required this.type,
    required this.url,
    required this.assets,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<MediaViewerCubit, MediaViewerState>(
      listener: (context, state) {
        if (state.videoPlayerController != null && !state.isPlaying) {
          state.videoPlayerController!.pause();
        }
      },
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Stack(
                  children: [
                    _buildPageView(context, state),
                    if (type != MediaType.IMAGE && !state.isPlaying)
                      _buildPlayButton(context),
                    _buildTopBar(context),
                    _buildBottomBar(context, state, colorScheme, textTheme),
                  ],
                ),
              );
      },
    );
  }

  Widget _buildPageView(BuildContext context, MediaViewerState state) {
    return PageView.builder(
      itemCount: assets.length,
      controller: PageController(initialPage: currentIndex),
      onPageChanged: (index) {
        // Dispose of the previous video player and initialize a new one
        context.read<MediaViewerCubit>().onPageChanged(assets[index].url);
      },
      itemBuilder: (context, index) {
        final asset = assets[index];
        final isImage = asset.type == MediaType.IMAGE;

        return isImage
            ? PhotoView(
                imageProvider: CachedNetworkImageProvider(
                  CustomImageProvider.getImageUrl(asset.url, ImageType.other),
                ),
              )
            : _buildVideoPlayer(context, state, asset.url);
      },
    );
  }

  Widget _buildVideoPlayer(
      BuildContext context, MediaViewerState state, String asset) {
    print(state.videoPlayerController);
    if (!state.isLoading &&
        state.videoPlayerController != null &&
        state.videoPlayerController!.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          if (state.isPlaying) {
            context.read<MediaViewerCubit>().pause();
          } else {
            context.read<MediaViewerCubit>().play();
          }
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: state.videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(state.videoPlayerController!),
          ),
        ),
      );
    } else {
      // context.read<MediaViewerCubit>().initilizeVideoAgain(asset);
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildPlayButton(BuildContext context) {
    return Positioned(
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
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
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
                  
                  context.read<MediaViewerCubit>().closePlayer();
                },
                child: SvgPicture.asset(AssetConstants.arrowLeft),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, MediaViewerState state,
      ColorScheme colorScheme, TextTheme textTheme) {
    return Positioned(
      bottom: 5.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        width: 100.w,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPublisherInfo(context, state, textTheme, colorScheme,
                      () {
                    if (state.videoPlayerController != null) {
                      context.read<MediaViewerCubit>().closePlayer();
                    }
                    navigator<NavigationService>().navigateTo(
                        UserRoutes.clubProfileRoute,
                        queryParams: {'id': state.pubId.toString()});
                  }),
                  SizedBox(height: 1.h),
                  InkWell(
                    onTap: () {
                      context.read<MediaViewerCubit>().onTextExpandedToggle();
                    },
                    child: AnimatedContainer(
                      height: state.isExpanded ? 6.h : 2.h,
                      duration: const Duration(milliseconds: 300),
                      child: SingleChildScrollView(
                        child: Text(
                          state.pub!.description,
                          maxLines: state.isExpanded ? null : 1,
                          overflow:
                              state.isExpanded ? null : TextOverflow.ellipsis,
                          style: textTheme.bodySmall!.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  _buildLocationInfo(context, state, textTheme, colorScheme),
                ],
              ),
            ),
            // SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }

  Widget _buildPublisherInfo(BuildContext context, MediaViewerState state,
      TextTheme textTheme, ColorScheme colorScheme, VoidCallback onTap) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 4.w,
                foregroundImage: CachedNetworkImageProvider(
                  CustomImageProvider.getImageUrl(
                      state.pub?.logo, ImageType.other),
                ),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.pub!.fullName,
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background,
                    ),
                  ),
                  Text(
                    '@${state.pub?.tag?.tag ?? ''}',
                    style: textTheme.bodySmall!.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: state.isFollowing
              ? null
              : () {
                  context.read<MediaViewerCubit>().followPub();
                },
          child: Container(
            height: 3.h,
            width: 25.w,
            margin: EdgeInsets.only(left: 2.h, top: 0.2.h),
            decoration: BoxDecoration(
                border: Border.all(color: colorScheme.background, width: 1),
                borderRadius: BorderRadius.circular(1.h)),
            child: Center(
              child: Text(
                state.isFollowing ? 'Following' : 'Follow',
                style:
                    TextStyle(color: colorScheme.background, fontSize: 14.sp),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLocationInfo(BuildContext context, MediaViewerState state,
      TextTheme textTheme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0.w, horizontal: 1.5.w),
      width: 43.w,
      decoration: BoxDecoration(
        color: colorScheme.background.withOpacity(.1),
        borderRadius: BorderRadius.circular(50.w),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetConstants.locationIcon, height: 4.w),
          SizedBox(width: 1.w),
          Expanded(
            child: Text(
              state.pub!.location!.vicinity,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall!.copyWith(
                fontSize: 13.5.sp,
                color: colorScheme.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
