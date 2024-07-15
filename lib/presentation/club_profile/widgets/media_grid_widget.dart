import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class MediaGridViewer extends StatelessWidget {
  
  const MediaGridViewer(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.assets.isEmpty
            ? Container(
                height: 100.h,
                width: 100.w,
                color: Theme.of(context).colorScheme.surface,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetConstants.noPostsBannerImage),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'No Posts yet',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              )
            : Container(
                  color: Theme.of(context).colorScheme.surface,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: GridView.custom(
                    padding: EdgeInsets.zero,
                    // shrinkWrap: true,
                    controller: state.scrollController,
                    scrollDirection: Axis.vertical,
                    // physics:  const NeverScrollableScrollPhysics() ,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.5.w,
                      crossAxisSpacing: 1.h,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: const [
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: state.assets.length,
                        (context, index) =>
                            GestureDetector(
                              onTap: () {
                                      navigator<NavigationService>().navigateTo(
                                          UserRoutes.mediaViewerWidgetScreen,
                                          queryParams: {
                                            'type': state.assets[index].type,
                                            'url': state.assets[index].url,
                                            'pubId':state.clubId.toString(),
                                            'currentIndex': index.toString(),
                                            'assets':state.assets.map((asset) => asset.url).join(','),
                                          });
                                    },
                              child: state.assets[index].type != MediaType.VIDEO
                                  ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                CustomImageProvider.getImageUrl(state.assets[index].url, ImageType.other)),
                                            fit: BoxFit.cover)),
                                  )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        state.assets[index].thumbnail,
                                        fit: BoxFit.cover,
                                      )),
                            )),
                  ),
                ),
            );
      },
    );
  }
}
