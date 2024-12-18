import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import 'club_menu_screen.dart';
import 'events_calendar_builder.dart';
import 'media_grid_widget.dart';

// normal way
class MediaViewerTabs extends StatelessWidget {
  const MediaViewerTabs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
            height: 90.h,
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: TabBar(
                    
                    controller:
                        state.tabController, // Provide custom TabController
                    labelColor: Theme.of(context).colorScheme.background,
                    indicatorSize: TabBarIndicatorSize.tab,
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
                        child: Text('Gallery'),
                      ),
                      Tab(
                        child: Text('Events'),
                      ),
                      Tab(
                        child: Text('Menu'),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    
                    controller: state
                        .tabController,
                    children: [
                      const MediaGridViewer(),
                      EventsCalendarBuilder(
                        clubId: state.clubId,
                      ),
                      ClubMenuScreen(
                        clubId: state.clubId,
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
