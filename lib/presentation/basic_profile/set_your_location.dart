import 'package:app_settings/app_settings.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/location/location_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/other_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../infrastructure/core/dtos/location/location_dto.dart';
import '../auth/login_with_phone_screen.dart';
import '../home/widgets/location_tile.dart';
import '../widgets/custom_textfield.dart';

//todo

class SetYourLocation extends StatelessWidget {
  const SetYourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => LocationCubit(LocationState.initial(
          appStateNotifier: appStateNotifier,
          serverUrl: appConfig.serverUrl,
          mapsApiKey: appConfig.googleMapsApiKey)),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Provider.of<AppStateNotifier>(context, listen: false)
                .updateLocation(location: state.location);

            print(state.location);
            navigator<NavigationService>().navigateTo(
              UserRoutes.mainNavRoute,
              queryParams: {'routeIndex': '0'},
              isClearStack: true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  const OnboardingGradient(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 13.h,
                      ),
                      SvgPicture.asset(AssetConstants.festaIconSvg),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Let’s Get This Party Started!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w700,
                            fontSize: 23.5.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(padding: EdgeInsets.only(left: 7.w, right: 7.w),
                      child: Text(
                        'music nights to theme parties, find everything near you!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15.5.sp),
                      ),  ),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<LocationCubit>().onDetectMyLocation();
                        },
                        child: Container(
                          width: 50.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).colorScheme.background),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetConstants.setupLocation,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.surface,
                                      BlendMode.srcIn)),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                SetupLocationScreenConstants.useMyLocation,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: (){
                          context.read<LocationCubit>().toggleLocationDialog();
                        },
                        child: Container(
                          width: 30.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:
                                  Theme.of(context).colorScheme.primaryContainer),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.searchIcon,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                AppConstants.search,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],

                  ),
                                        if(state.showLocationDialog)
                           LocationDialogInitial()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}






class LocationDialogInitial extends StatelessWidget {
  const LocationDialogInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state.showPermissionDialog) {
          // context.read<HomeCubit>().emitFromEveryWhere(
          //     currentState: state.copyWith(showPermissionDialog: false));
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Location Permission Required',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700),
              ),
              content: Text(
                'Please grant location permission to use this feature.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    AppSettings.openAppSettings(type: AppSettingsType.location);

                    Navigator.pop(context);

                    //context.read<PermissionCubit>().requestStoragePermission();
                  },
                  child: Text(
                    'OK',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                // context.read<HomeCubit>().toggleLocationDialog();
              },
              child: Container(
                height: 100.h,
                color: Colors.black.withOpacity(.7),
              ),
            ),
            Center(
              child: AnimatedContainer(
                height: AppConstants.underReview ? 32.h : 37.h,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    .read<LocationCubit>()
                                    .toggleLocationDialog();
                              },
                              child: SvgPicture.asset(AssetConstants.closeIcon))
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        prefixIcon: SvgPicture.asset(AssetConstants.searchIcon),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        isFill: true,
                        inputWithLabel: false,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(vertical: 1.2.h),
                        onChanged: (value) {
                          EasyDebounce.debounce(
                            'location-search',
                            const Duration(milliseconds: 500),
                            () {
                              context
                                  .read<LocationCubit>()
                                  .onLocationSearchChange(query: value);
                            },
                          );
                        },
                        hintTextStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
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
                   
                        state.isLocationSearchChanged  ? Expanded(
                              child: SingleChildScrollView(
                                child:
                                    // state.suggestions.isEmpty
                                    //     ? Padding(
                                    //         padding: EdgeInsets.only(
                                    //             left: 1.w, bottom: 3.w),
                                    //         child: Text(
                                    //           'No suggestion',
                                    //           style: Theme.of(context)
                                    //               .textTheme
                                    //               .bodyMedium!
                                    //               .copyWith(
                                    //                   color: Theme.of(context)
                                    //                       .colorScheme
                                    //                       .background,
                                    //                   fontSize: 16.sp),
                                    //         ),
                                    //       )
                                    //     :
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.suggestions.map((suggestion) {
                                    return GestureDetector(
                                      onTap: () {
                                       context
                                            .read<LocationCubit>()
                                            .onLocationChange(
                                              placeId: suggestion.placeId,
                                              locationName: suggestion.mainText,
                                            );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.w, bottom: 6.w),
                                        child: Text(
                                          suggestion.description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                  fontSize: 16.sp),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                if (!AppConstants.underReview)
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          AssetConstants.navigationIcon),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          context
                                              .read<LocationCubit>()
                                              .onDetectMyLocation();
                                        },
                                        child: Text(
                                          'Detect my location',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (!AppConstants.underReview)
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suggested',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
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
                                              const LocationTileInitial(
                                                location: OtherConstants
                                                    .defaultLocation,
                                              ),
                                              SizedBox(
                                                width: 3.5.w,
                                              ),
                                                                                            const LocationTileInitial(
                                                location:
                                                    OtherConstants.hyderabad,
                                              ),
                                              
                                              const LocationTileInitial(
                                                location: OtherConstants.mumbai,
                                              ),
                                              SizedBox(
                                                width: 3.5.w,
                                              ),
                                              const LocationTileInitial(
                                                location: OtherConstants.delhi,
                                              ),


                                            ],
                                          ),
                                        ))
                                  ],
                                ),
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


class LocationTileInitial extends StatelessWidget {
  final LocationDto location;
const LocationTileInitial({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AnalyticsService().logEvent(eventName: 'choose_location', paras: {
              'location': location.city,
            });
           context.read<LocationCubit>().updateLocation(location: location);
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
                  location.icon ?? '',
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


