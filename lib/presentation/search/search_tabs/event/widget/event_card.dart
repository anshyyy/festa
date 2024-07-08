import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/utils/image_provider.dart';
import '../../../../../infrastructure/core/enum/image_type.enum.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 99.px,
      width: size.width,
      child: Row(
        children: [
          Container(
            height: 99.px,
            width: 99.px,
            margin: EdgeInsets.only(right: 3.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        CustomImageProvider.getImageUrl(
                            'https://plus.unsplash.com/premium_photo-1682265676364-5838a427dee2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ImageType.other)))),
          ),
          SizedBox(
            width: 4.px,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 228.px,
                  child: const Text(
                    "THE GREYBOT ALL STARS/MIKE",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 5.sp,
              ),
              Row(children: [
                SvgPicture.asset(AssetConstants.durationIcon,
                   color: Colors.green,),
                SizedBox(
                  width: 1.w,
                ),
                const Text(
                  "Sat, 27 June",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ]),
              Row(children: [
                SvgPicture.asset(AssetConstants.locationIcon,
                   color: Colors.white,),
                SizedBox(
                  width: 10.sp,
                ),
                const Text(
                  "Kormangala, Bangalore",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ])
            ],
          )
        ],
      ),
    );
  }
}
