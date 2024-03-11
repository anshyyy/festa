import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventTypeTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String image;

  const EventTypeTile({
    super.key,
    required this.title,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: 22.w,
        width: 22.w,
        padding: EdgeInsets.only(bottom: 2.w, left: 1.w, right: 1.w),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.background.withOpacity(.2),
                width:isSelected? .3.w: .3.w),
            borderRadius: BorderRadius.circular(15),
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
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.background,
                fontSize: 13.5.sp,
                ),
          ),
        ),
      ),
    );
  }
}
