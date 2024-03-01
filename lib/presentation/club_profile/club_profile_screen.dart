import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/club_profile/club_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import 'widgets/club_profile.dart';
import 'widgets/image_carousel.dart';
import 'widgets/media_viewer_tabs.dart';

class ClubProfileScreen extends StatelessWidget {
  final int clubId;
  const ClubProfileScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => ClubProfileCubit(ClubProfileState.initial(
        clubId: clubId,
        apiBaseUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: const ClubProfileScreenConsumer(),
    );
  }
}

class ClubProfileScreenConsumer extends StatelessWidget {
  const ClubProfileScreenConsumer({super.key});

  final String clubBg =
      'https://images.unsplash.com/photo-1570872626485-d8ffea69f463?q=80&w=2535&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.pub == null
                    ? const Center(
                        child: Text('Data not found'),
                      )
                    : Stack(
                        children: [
                          const ImageCarousel(),
                          SizedBox.expand(
                            child: DraggableScrollableSheet(
                              initialChildSize: .5,
                              minChildSize: .5,
                              builder: (context, scrollController) {
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5.h),
                                    child: Column(
                                      children: [
                                        const ClubProfile(),
                                        // MediaGrid(),
                                        MediaViewerTabs(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
          ),
        );
      },
    );
  }
}
