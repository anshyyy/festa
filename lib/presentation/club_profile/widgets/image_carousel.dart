import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, imageIndex, realIndex) {
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  // autoPlay: true,
                  height: 60.h,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOutBack,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context.read<ClubProfileCubit>().onCarouselChange(index: index);
                  },
                )),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      3,
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
