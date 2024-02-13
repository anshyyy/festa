import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../application/home/cubit/home_cubit.dart';
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
  final String ratings;
  final String location;
  int selectedImageIndex;

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
    required this.ratings,
    this.selectedImageIndex = 0,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imageList.map((String imageUrl) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 343 / 375,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context.read<HomeCubit>().onCarouseChanged(index: index);
                  },
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
                          width: 18.h,
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
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        SvgPicture.asset(AssetConstants.heartOutlinedIcon)
                      ],
                    ),
                  )),
              Positioned(
                bottom: 1.h,
                left: 18.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      ...List.generate(
                          imageList.length,
                          (dotIndex) => Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: dotIndex == selectedImageIndex
                                        ? Theme.of(context).colorScheme.background
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    bandName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 18,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h, right: 1.5.h),
                  child: SvgPicture.asset(AssetConstants.shareIcon),
                )
              ],
            ),
          ),
          const Profile(
            artistName: 'Chester Bennington',
            followers: '1M+ Followers',
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AssetConstants.homeFilledLocation,
                  height: 16,
                ),
              ),
              Text(
                location,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ],
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
                    ),
              ),
              SizedBox(
                width: 8.h,
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: SvgPicture.asset(
                  AssetConstants.starIcon,
                  height: 14,
                ),
              ),
              Text(
                ratings,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String followers;
  final String artistName;
  const Profile({
    super.key,
    required this.followers,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 7.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 2.h,
                        backgroundImage: const AssetImage(
                          AssetConstants.circleAvtarProfile,
                        ),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            artistName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.h),
                            child: Text(
                              followers,
                               overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShareIcon extends StatelessWidget {
  const ShareIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 7.h,
        ),
        SvgPicture.asset(AssetConstants.heartOutlinedIcon),
        SizedBox(
          height: 20.h,
        ),
        SvgPicture.asset(AssetConstants.shareIcon)
      ],
    );
  }
}
