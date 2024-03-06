import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'widgets/artist_profile.dart';
import 'widgets/media_viewer_tabs.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArtistProfileScreenConsumer();
  }
}

class ArtistProfileScreenConsumer extends StatelessWidget {
  const ArtistProfileScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                // const ImageCarousel(),
                
                SizedBox.expand(
                  child: DraggableScrollableSheet(
                    initialChildSize: .5,
                    minChildSize: .5,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: const Column(
                            children: [
                             ArtistProfile(),
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
  }
}
