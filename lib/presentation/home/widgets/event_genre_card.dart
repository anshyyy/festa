import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventTypeTile extends StatelessWidget {
  final ThemeData themeData;
  final String title;
  final String image;

  const EventTypeTile({
    super.key,
    required this.themeData,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.w),
        child: CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            height: 10.h,
            width: 10.h,
            padding: EdgeInsets.only(bottom: 2.w, left: 2.w, right: 2.w),
            decoration: BoxDecoration(
                border: Border.all(
                    color: themeData.colorScheme.background, width: .1.w),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                )),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: themeData.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: themeData.colorScheme.background,
                  
                ),
              ),
            ),
          ),
        ));
  }
}
