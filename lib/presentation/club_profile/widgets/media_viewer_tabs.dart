import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import 'events_calendar_builder.dart';
import 'media_grid_widget.dart';

// normal way
class MediaViewerTabs extends StatelessWidget {
  const MediaViewerTabs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return SizedBox(
          height: 90.h,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Theme.of(context).colorScheme.background,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.background,
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.bodySmall!.copyWith(),
                  tabs: const [
                    Tab(
                      child: Text('Photos'),
                    ),
                    Tab(
                      child: Text('Events'),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    const MediaGridViewer(),
                    EventsCalendarBuilder(
                      clubId: state.clubId,
                    )
                  ]),
                )
              ],
            ),
          ),
        );
      },
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
