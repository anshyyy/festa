import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
                itemCount: state.pub!.assets.length,
                itemBuilder: (context, imageIndex, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          CustomImageProvider.getImageUrl(state.pub!.assets[imageIndex].url, ImageType.other),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 60.h,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOutBack,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context
                        .read<ClubProfileCubit>()
                        .onCarouselChange(index: index);
                  },
                )),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      state.pub!.assets.length,
                      (dotIndex) => Padding(
                            padding: EdgeInsets.all(.3.w),
                            child: Container(
                              height: 1.5.h,
                              width: 1.3.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dotIndex == state.currentImageIndex
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                            ),
                          ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
