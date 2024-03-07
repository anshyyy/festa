import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
import 'social_reach.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 3.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: .5.w,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: .3,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                'House of Commons',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
              Text('@houseofcommons',
                  style: Theme.of(context).textTheme.bodySmall!),
              SizedBox(
                height: 1.h,
              ),
              
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Sem vitae vitae turpis auctor purus erat ac aliquam scelerisque risus morbi vel. Eleifend nulla.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.background.withOpacity(.7),
                    fontSize: 14.5.sp,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 1.h,
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      4,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: .7.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 3.w),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.unSelectedRadio,
                                  height: 1.7.h,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  'Title',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: colorScheme.background,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          )),
                ),
              ),
              Divider(
                thickness: .1.w,
                // color: Colors.white,
              ),
              // MutualFollowers(),
              // SizedBox(
              //   height: 1.h,
              // ),
              const SocialReach()
            ],
          ),
        ),
        Positioned(
          top: -5.h,
          child: Column(
            children: [
              Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://i.pinimg.com/736x/0c/c2/74/0cc2740f7cc70dd14f2dbf80076d26df.jpg'))),
              ),
            ],
          ),
        ),
        
        Positioned(
          top: 1.h,
          left: 2.w,
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: QrImageView(
              data: '1234567890',
              eyeStyle: QrEyeStyle(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  eyeShape: QrEyeShape.square),
              dataModuleStyle: QrDataModuleStyle(
                  color: Theme.of(context).colorScheme.secondaryContainer),
            ),
          ),
        )
      ],
    );
  }
}
