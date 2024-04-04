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


