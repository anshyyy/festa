import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../domain/core/utils/image_provider.dart';
import '../../../../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../../../widgets/gradient_button.dart';

class BlockTile extends StatelessWidget {
  final String name;
  final String profileImage;
  final String tag;
  final Function() onTap;
  const BlockTile({super.key, required this.name, required this.profileImage, required this.tag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      width: 100.w,
      height: 10.h,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 15.w,
                width: 15.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer.withOpacity(1),
                    border: Border.all(width: 1, color: Colors.white),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            CustomImageProvider.getImageUrl(
                              profileImage, ImageType.profile)))),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox( 
                    width: 40.w,
                    child: Text(
                      name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorScheme.background,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Text(
                      tag,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorScheme.onSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )),
                ],
              ),
            ],
          ),
          GradientButton(
            height: 3.h,
            width: 25.w,
            onTap: onTap,
            text: 'Unblock',
            textStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: colorScheme.background),
          ),
        ],
      ),
    );
  }
}
