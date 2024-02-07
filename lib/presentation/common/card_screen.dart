import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';

class CardScreen extends StatelessWidget {
  final String? imageurl;
  final double km;
  final DateTime dateTime;
  final String barsName;
  final int price;
  final String bandName;
  final bool isHeartFilled;
  final List<String> imageList = [
    AssetConstants.homeBobsBarImg,
    AssetConstants.homeBobsBarImg,
    AssetConstants.homeBobsBarImg,
    AssetConstants.homeBobsBarImg,
    AssetConstants.homeBobsBarImg,
    AssetConstants.homeBobsBarImg,
  ];

  CardScreen({
    super.key,
    this.imageurl,
    required this.km,
    required this.dateTime,
    required this.barsName,
    required this.price,
    required this.bandName,
    this.isHeartFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: CarouselSlider(
                items: imageList.map((String imageUrl) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    width: 100.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                        width: 200.w,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 100.w / 45.h,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetConstants.homeProfilePictureIcon),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          barsName,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Container(
                      width: 12.h,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.homeFilledLocation,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text(
                              '$km km',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 5.h,
                left: 2.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width: 25.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('MMM dd,yyyy hh:mma')
                                    .format(dateTime),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11.h,
                      ),
                      Image(
                          image: AssetImage(
                        isHeartFilled
                            ? AssetConstants.heartOutlinedIcon
                            : AssetConstants.heartFilledIcon,
                      ))
                    ],
                  ),
                )),
            Positioned(
              bottom: 1.h,
              left: 12.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  dotsCount: imageList.length,
                  position: 0,
                  decorator: DotsDecorator(
                    color: Theme.of(context).colorScheme.onSecondary,
                    activeColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bandName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 38.h),
          child: SvgPicture.asset(
            AssetConstants.homeFilledLocation,
            width: 24,
            height: 24,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetConstants.ticketIcon,
                width: 24,
                height: 24,
              ),
            ),
            Text(
              '₹${price % 1 == 0 ? price.toInt() : price.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
