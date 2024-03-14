import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';

class MediaGridViewer extends StatelessWidget {
  final List<String> images;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final List<QuiltedGridTile> quiltedPattern;
  const MediaGridViewer(
      {super.key,
      required this.images,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.quiltedPattern});

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
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: GridView.custom(
                  // shrinkWrap: true,
                  controller: state.scrollController,
                  scrollDirection: Axis.vertical,
                  // physics:  const NeverScrollableScrollPhysics() ,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: mainAxisSpacing ?? 0,
                    crossAxisSpacing: crossAxisSpacing ?? 0,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: quiltedPattern,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: state.assets.length,
                    (context, index) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      state.assets[index].url),
                                  fit: BoxFit.cover)),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
