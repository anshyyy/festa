import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/highlight/highlight_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class UserImageCarousel extends StatefulWidget {
  final List<HighlightDto> highlights;
  const UserImageCarousel({super.key, required this.highlights});

  @override
  _UserImageCarouselState createState() => _UserImageCarouselState();
}

class _UserImageCarouselState extends State<UserImageCarousel> {
  int currentPage = 0; // Track the current active page

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.highlights.length,
          itemBuilder: (context, imageIndex, realIndex) {
            final asset = widget.highlights[imageIndex];

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //   Colors.grey.withOpacity(0.7),
                  //   BlendMode.dstIn,
                  // ),
                  image: CachedNetworkImageProvider(
                    CustomImageProvider.getImageUrl(
                        asset.url, ImageType.other),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 70.h,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeInOutBack,
            autoPlay: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index; // Update the active page
              });
            },
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(widget.highlights.length, (dotIndex) {
                return Padding(
                  padding: EdgeInsets.all(.3.w),
                  child: Container(
                    height: 1.5.h,
                    width: 1.3.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dotIndex == currentPage // Compare with the current page
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
