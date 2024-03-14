import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../application/artist/artist_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_appbar.dart';
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
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
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
              ),
              Positioned(
                        top: 15.w,
                        left: 1.w,
                        child: GestureDetector(
                            onTap: () {
                              navigator<NavigationService>().goBack();
                            },
                            child: Center(
                                child: SvgPicture.asset(
                                    AssetConstants.arrowLeft))),
                      ),
            ],
          ),
        );
      },
    );
  }
}
