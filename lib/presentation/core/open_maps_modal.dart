import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';

class OpenMapsModal extends StatelessWidget {
  final List<AvailableMap> mapsOptions;
  final Coords coords;
  final String title;
  const OpenMapsModal({
    super.key,
    required this.title,
    required this.coords,
    required this.mapsOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: 12.w,
            height: .5.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 6.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View On',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: SvgPicture.asset(AssetConstants.closeIcon,width: 6.w,))
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1.5.h,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: mapsOptions.length,
              itemBuilder: (context, index) {
                final map = mapsOptions[index];
                return ListTile(
                        onTap: () async {
                          await MapLauncher.showMarker(
                            mapType: map.mapType,
                            coords: coords,
                            title: title,
                          );
                        },
                        title: Text(
                          map.mapName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.w),
                          child: SvgPicture.asset(
                            map.icon,
                            height: 8.5.w,
                            width: 8.5.w,
                          ),
                        ),
                      )
                    ;
              })
        ]),
      ),
    );
  }
}
