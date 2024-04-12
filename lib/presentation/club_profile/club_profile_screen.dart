import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/club_profile/club_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../main_nav/bottom_nav.dart';
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
      child: ClubProfileScreenConsumer(),
    );
  }
}

// ignore: must_be_immutable
class ClubProfileScreenConsumer extends StatelessWidget {
  ClubProfileScreenConsumer({super.key});
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNav(
            isTabScreen: false,
            onTabChange: (i) {},
            currentIndex: Provider.of<AppStateNotifier>(context,listen: false).menuIndex ?? 0,
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.pub == null
                  ? const Center(
                      child: Text('Data not found'),
                    )
                  : NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        final breakPoint = 30.h;
                        final pixels = scrollController?.position.pixels ?? 0;
                        if (pixels > breakPoint && !state.showHeader) {
                          context.read<ClubProfileCubit>().emitFromAnywhere(
                              state: state.copyWith(showHeader: true));
                        } else if (pixels <= breakPoint && state.showHeader) {
                          context.read<ClubProfileCubit>().emitFromAnywhere(
                              state: state.copyWith(showHeader: false));
                        }
                        return true;
                      },
                      child: Stack(
                        children: [
                         const ImageCarousel(),
                          SizedBox.expand(
                            child: DraggableScrollableSheet(
                              initialChildSize: .47,
                              minChildSize: .47,
                              builder: (context, scrollController) {
                                this.scrollController = scrollController;
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: Container(
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(top: 5.h),
                                    child: const Column(
                                      children: [
                                         ClubProfile(),
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
                    ),
        );
      },
    );
  }
}
