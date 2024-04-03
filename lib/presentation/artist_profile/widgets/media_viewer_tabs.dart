import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_music/artist_music_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/constants/asset_constants.dart';

class MediaViewerTabs extends StatelessWidget {
  final int artistId;
  const MediaViewerTabs({super.key, required this.artistId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ArtistMusicCubit(ArtistMusicState.initial(
          serverUrl: appConfig.serverUrl, artistId: artistId))
        ..init(),
      child: const MediaViewerTabsConsumer(),
    );
  }
}

class MediaViewerTabsConsumer extends StatelessWidget {
  const MediaViewerTabsConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: DefaultTabController(
        length: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              //  dividerHeight: 0,
              // indicatorPadding: EdgeInsets.symmetric(vertical: 2.w),
              labelColor: Theme.of(context).colorScheme.background,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600),
              unselectedLabelColor: Theme.of(context).colorScheme.background,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodySmall!.copyWith(),
              tabs: const [
                Tab(
                  child: Text('Music'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0),
                  child: const ArtistMusicCollectionWidget(),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                //   child: VideoMediaGrid(images: [],),
                // ),
                // Container()
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ArtistMusicCollectionWidget extends StatelessWidget {
  const ArtistMusicCollectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<ArtistMusicCubit, ArtistMusicState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 3.w),
            shrinkWrap: true,
            itemCount: state.musicList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: colorScheme.surface),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20.w,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.musicList[index].imageUrl,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.musicList[index].name,
                                  style: textTheme.bodySmall!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.background,
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                // Text(
                                //   'Mbah Jacob',
                                //   style: textTheme.bodySmall!.copyWith(
                                //     fontSize: 13.sp,
                                //     fontWeight: FontWeight.w400,
                                //     color: colorScheme.background,
                                //   ),
                                // ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text(
                                  state.musicList[index].length.toString(),
                                  style: textTheme.bodySmall!.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: colorScheme.background,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        state.musicList[index].isLiked
                            ? GestureDetector(
                                onTap: () {
                                  context.read<ArtistMusicCubit>().unLikeMusic(
                                      musicId: state.musicList[index].id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: SvgPicture.asset(
                                    AssetConstants.heartFilledIcon,
                                    height: 2.5.h,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  context.read<ArtistMusicCubit>().likeMusic(
                                      musicId: state.musicList[index].id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: SvgPicture.asset(
                                    AssetConstants.heartOutlinedIcon,
                                    height: 2.5.h,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
