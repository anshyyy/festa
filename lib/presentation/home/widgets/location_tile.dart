import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';
import '../../../infrastructure/core/dtos/location/location_dto.dart';

class LocationTile extends StatelessWidget {
  final LocationDto location;
  const LocationTile({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<HomeCubit>().updateLocation(location: location);
          },
          child: Container(
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    width: .2.w,
                    color: Theme.of(context).colorScheme.secondaryContainer)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  location.icon,
                  height: 3.h,
                ),
                SizedBox(
                  height: 1.8.h,
                ),
                Text(
                  location.city,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
