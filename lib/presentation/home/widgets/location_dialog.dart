import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
// import '../../core/custom_textfield.dart';
import '../../widgets/custom_textfield.dart';
import 'event_genre_card.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Container(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose your Location',
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SvgPicture.asset(AssetConstants.closeIcon)
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                prefixIcon: SvgPicture.asset(AssetConstants.searchIcon),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          isFill: true,
                          inputWithLabel: false,
                          fillColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          hintText: 'Search',
                          hintTextStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    // fontSize: 17.sp,
                                  ),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  // fontSize: 17.sp,
                                  color:
                                      Theme.of(context).colorScheme.background),
                          errorStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                          
                        
                        ),
              // SizedBox(
              //   height: 1.h,
              // ),
              Row(
                children: [
                  SvgPicture.asset(AssetConstants.locationIcon),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text('Detect my location', 
                  
                  style:Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Suggested', style:Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),),
                   SizedBox(
                height: 2.h,
              ),
                  Container(
                    height: 10.h,
                    child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return EventTypeTile(
                            themeData: Theme.of(context),
                            title: 'title',
                            image:
                                'https://plus.unsplash.com/premium_photo-1661286678499-211423a9ff5e?q=80&w=2624&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
