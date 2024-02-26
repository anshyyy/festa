import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';

class SetYourLocation extends StatelessWidget {
  const SetYourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetConstants.festaSecondary),
              SizedBox(
                height: 1.h,
              ),
              Text(SetupLocationScreenConstants.setupYourLocation,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontSize: 23.5  .sp
              ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(SetupLocationScreenConstants.seeWhatHappening,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13.5.sp
              ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.setupLocation,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(SetupLocationScreenConstants.useMyLocation,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.w400
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 30.w,
                height: 5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.searchIcon,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(AppConstants.search,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
