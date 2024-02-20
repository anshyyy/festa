import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';
// import '../../core/custom_textfield.dart';
import '../../../domain/core/constants/other_constants.dart';
import '../../widgets/custom_textfield.dart';
import 'location_tile.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                context.read<HomeCubit>().toggleLocationDialog();
              },
              child: Container(
                height: 100.h,
                color: Colors.black.withOpacity(.7),
              ),
            ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                margin: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: .3.w,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose your Location',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<HomeCubit>()
                                    .toggleLocationDialog();
                              },
                              child: SvgPicture.asset(AssetConstants.closeIcon))
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        // height: 7.h,
                        prefixIcon: SvgPicture.asset(AssetConstants.searchIcon),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        isFill: true,
                        inputWithLabel: false,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
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
                          SvgPicture.asset(AssetConstants.navigationIcon),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'Detect my location',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Suggested',
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
                            height: 1.h,
                          ),
                          SizedBox(
                              height: 10.h,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    const LocationTile(
                                      location: OtherConstants.defaultLocation,
                                    ),
                                    SizedBox(
                                      width: 3.5.w,
                                    ),
                                    const LocationTile(
                                      location: OtherConstants.mumbai,
                                    ),
                                    SizedBox(
                                      width: 3.5.w,
                                    ),
                                    const LocationTile(
                                      location: OtherConstants.delhi,
                                    ),
                                    SizedBox(
                                      width: 3.5.w,
                                    ),
                                    const LocationTile(
                                      location: OtherConstants.hyderabad,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
