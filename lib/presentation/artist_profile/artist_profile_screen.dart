import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/artist/artist_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../user/user_profile_screen.dart';
import '../user/widgets/user_profile_widget.dart';
import 'widgets/artist_profile.dart';
import 'widgets/media_viewer_tabs.dart';

class ArtistProfileScreen extends StatelessWidget {
  final int artistId;
  const ArtistProfileScreen({super.key, required this.artistId});

  @override
  Widget build(BuildContext context) {
    final appconfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ArtistCubit(ArtistState.initial(
          artistId: artistId, serverUrl: appconfig.serverUrl))
        ..init(),
      child: const ArtistProfileScreenConsumer(),
    );
  }
}

class ArtistProfileScreenConsumer extends StatelessWidget {
  const ArtistProfileScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading ? 
            UserShimmer()
          : Scaffold(
            body: Stack(
              children: [
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
                              const ArtistProfile(),
                              // MediaGrid(),
                              MediaViewerTabs(
                                artistId: state.artistId,
                              ),
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

class UserShimmer extends StatelessWidget {
  const UserShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
final colorScheme = themeData.colorScheme;
final textTheme = themeData.textTheme;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: 1.h,
            // ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Column(
                  children: [
                    Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: .5.w,),
                     Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: .5.w,),

                     Container(
                      height: .5.w,
                      width: 3.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            
                      Spacer(),
            Stack(
              clipBehavior: Clip.none,
               alignment: Alignment.center,
              children: [
                Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.w)
                  ),
                ),
                Positioned(
                  top: -5.h,
                  // left: 40.w,
                  child: Center(
                    child: Container(
                    height: 20.w,
                      width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 1, color: colorScheme.background),
                      shape: BoxShape.circle
                    ),
                  ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
