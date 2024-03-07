import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';

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
      listener: (context, state) {
      },
      builder: (context, state) {
        return GridView.custom(
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
            childCount: images.length,
            (context, index) => GestureDetector(
            onTap: () => context.read<ClubProfileCubit>().calculateHeight(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        );
      },
    );
  }
}
