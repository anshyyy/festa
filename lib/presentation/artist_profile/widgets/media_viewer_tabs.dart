import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class MediaViewerTabs extends StatelessWidget {
  const MediaViewerTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaViewerTabsConsumer();
  }
}

class MediaViewerTabsConsumer extends StatelessWidget {
  const MediaViewerTabsConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
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
                Tab(
                  child: Text('Videos'),
                ),
                Tab(
                  child: Text('Events'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: ArtistMusicCollectionWidget(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: VideoMediaGrid(images: [],),
                ),
                Container()
              ]),
            )
          ],
        ),
      ),
    );
  }
}


class VideoMediaGrid extends StatelessWidget {
  final List<String> images;
  const VideoMediaGrid({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 3
                  : 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.w / 1.3.w,
        ),
        itemBuilder: (context, position) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  images[position],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '1.4k plays',
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        });
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
    final clubBg =
        'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2535&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: colorScheme.surface),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
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
                                  image: CachedNetworkImageProvider(clubBg),
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
                              'Blandit pallentesque turpis',
                              style: textTheme.bodySmall!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.background,
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              'Mbah Jacob',
                              style: textTheme.bodySmall!.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: colorScheme.background,
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              '02:56s - 04:23s',
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
                    Padding(
                      padding:  EdgeInsets.only(right: 2.w),
                      child: SvgPicture.asset(
                        AssetConstants.heartOutlinedIcon,
                        height: 2.5.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
