import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';

class MediaCarousel extends StatelessWidget {
  const MediaCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.only(bottom:4.h),
          child: Stack(
            children: [
              Column(
                children: [
                  CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, imageIndex, realIndex) {
                        return Container(
                          foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops:[0, 0.2, 0.8, 1]
                            ),
                      ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        height: 100.w,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.easeInOutBack,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          context
                              .read<HomeCubit>()
                              .onCarouselChange(index: index);
                        },
                      )),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'THE GREYBOT ALL STARS/MIKE DILLON BAND',
                          style: themeData.textTheme.bodyMedium!.copyWith(
                            color: themeData.colorScheme.background,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: SvgPicture.asset(AssetConstants.shareIcon),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ShortProfileTile(themeData: themeData),
                        ShortProfileTile(themeData: themeData),
                        ShortProfileTile(themeData: themeData),
                        ShortProfileTile(themeData: themeData),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      SvgPicture.asset(AssetConstants.locationIcon,),
                      SizedBox(width: 2.w,),
                      Text('Great Indian Music Hall, Indira Nagar, Blr', style: themeData.textTheme.bodySmall,)
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      SizedBox(width: 1.w,),
                      SvgPicture.asset(AssetConstants.ticketIcon,),
                      SizedBox(width: 2.w,),
                      Text('₹5,000', style: themeData.textTheme.bodySmall,)
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetConstants.durationIcon,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '10:00 AM - 12:30 PM',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetConstants.startIcon,
                              color: Colors.yellow[800],
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '5.0 (100 ratings)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                            ),
                          ],
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 4.5.w,
                                backgroundImage: const CachedNetworkImageProvider(
                                    'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2866&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bobs`s Bar',
                                    style: themeData.textTheme.bodyMedium!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.5.sp),
                                  ),
                                  Text(
                                    'Indira Nagar',
                                    style: themeData.textTheme.bodySmall!
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.5.w, vertical: .2.h),
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(50.w)),
                            child: Row(
                              children: [
                                SvgPicture.asset(AssetConstants.locationIcon),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  '2.3km',
                                  style: themeData.textTheme.bodySmall!.copyWith(
                                    color: themeData.colorScheme.background,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.7.w, vertical: .3.h),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(50.w)),
                                child: Text(
                                  'Dec 25, 2023 08:00PM',
                                  style: themeData.textTheme.bodySmall!.copyWith(
                                    color: themeData.colorScheme.background,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                AssetConstants.heartOutlinedIcon,
                                width: 5.w,
                                height: 5.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                  5,
                                  (dotIndex) => Padding(
                                        padding: EdgeInsets.all(.7.w),
                                        child: Container(
                                          height: 1.5.h,
                                          width: 1.5.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: dotIndex ==
                                                      state.selectedImageIndex
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .background
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer),
                                        ),
                                      ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShortProfileTile extends StatelessWidget {
  const ShortProfileTile({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(2.w),
      margin: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: .1.w,
              color: themeData.colorScheme.background)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 4.w,
            backgroundImage: const CachedNetworkImageProvider(
                'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2866&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chester ahj',
                style:
                    themeData.textTheme.bodyMedium!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.5.sp
                ),
              ),
              Text(
                '1M+ Followers',
                style:
                    themeData.textTheme.bodySmall!.copyWith(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
