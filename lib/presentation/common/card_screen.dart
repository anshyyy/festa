import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../domain/core/constants/asset_constants.dart';

class CardScreen extends StatelessWidget {
  final String? imageurl;
  final double km;
  final DateTime dateTime;
  final String barsName;
  final int price;
  final String bandName;
  final String time;
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
    required this.time,
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
              padding: EdgeInsets.symmetric(vertical: 2.h),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Container(
                      width: 9.h,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.homeFilledLocation,
                              width: 9,
                              height: 10,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text(
                              '$km' 'km',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
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
                bottom: 4.h,
                left: 2.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width: 21.h,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('MMM dd,yyyy hh:mma')
                                    .format(dateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Image(
                          image: AssetImage(
                        !isHeartFilled
                            ? AssetConstants.heartOutlinedIcon
                            : AssetConstants.heartFilledIcon,
                      ))
                    ],
                  ),
                )),
            Positioned(
              bottom: 2.h,
              left: 18.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  dotsCount: imageList.length,
                  position: 0,
                  decorator: DotsDecorator(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      activeColor: Theme.of(context).colorScheme.background,
                      size: const Size(6, 6),
                      activeSize: const Size(6, 6),
                      spacing: const EdgeInsets.all(2)),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bandName,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.background, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40.h),
          child: SvgPicture.asset(
            AssetConstants.homeFilledLocation,
            height: 16,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetConstants.ticketIcon,
                height: 16,
              ),
            ),
            Text(
              '₹${price % 1 == 0 ? price.toInt() : price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetConstants.clockIcon,
                height: 16,
              ),
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
