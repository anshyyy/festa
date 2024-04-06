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

  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
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
                            initialChildSize: .47,
                            minChildSize: .47,
                            builder: (context, scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  child: const Column(
                                    children: [
                                      ClubProfile(),
                                      // MediaGrid(),
                                      MediaViewerTabs(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                       
                      ],
                    ),
        );
      },
    );
  }
}
