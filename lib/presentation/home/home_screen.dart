import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import 'widgets/event_genre_card.dart';
import 'widgets/explore_tile_v2.dart';
import 'widgets/filter_modal_sheet.dart';
import 'widgets/location_dialog.dart';
import '../common/event_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => HomeCubit(HomeState.initial(
        serverUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: const HomeScreenConsumer(),
    );
  }
}

class HomeScreenConsumer extends StatelessWidget {
  const HomeScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<HomeCubit>()
                                          .toggleLocationDialog();
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.locationIconPink,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          StringExtension.displayAddress(
                                              state.location),
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                                  color: themeData
                                                      .colorScheme.background,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetConstants.searchIcon,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      SvgPicture.asset(
                                          AssetConstants.notificationIcon)
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                '${HomeScreenConstants.hey} James, ${HomeScreenConstants.welcomeText}',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (state.categoryFilter != null)
                                SizedBox(
                                  height: 2.h,
                                ),
                              if (state.categoryFilter != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      HomeScreenConstants.pickYourExperience,
                                      style: themeData.textTheme.bodyMedium!
                                          .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: themeData.colorScheme.background,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      height: 22.w,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final categoryValue = state
                                              .categoryFilter!.values[index];
                                          return EventTypeTile(
                                            isSelected: categoryValue.isApplied,
                                            image: categoryValue.icon,
                                            title: categoryValue.displayName,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            width: 3.w,
                                          );
                                        },
                                        itemCount:
                                            state.categoryFilter!.values.length,
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    HomeScreenConstants.explorerAll,
                                    style: themeData.textTheme.bodyMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: themeData.colorScheme.background,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children:
                                          state.exploreList.map((Map item) {
                                        return ExploreTile(
                                          label: item['label'],
                                          icon: item['svgIcon'],
                                          isSelected: item['isSelected'],
                                          onTap: () {
                                            if (item['label']
                                                    .toString()
                                                    .toLowerCase() ==
                                                'filter') {
                                              final builderContext = context;
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return FilterModalSheet(
                                                      filters: List.from(state
                                                          .filters
                                                          .map((e) => e.copyWith(
                                                              values: List.from(
                                                                  e.values)))
                                                          .toList()),
                                                    );
                                                  }).then((value) {
                                                if (value != null) {
                                                  if (value
                                                      is List<FilterDto>) {
                                                    builderContext
                                                        .read<HomeCubit>()
                                                        .updateFilterApplied(
                                                            filters: value);
                                                  }
                                                }
                                              });
                                            } else if (item['label']
                                                    .toString()
                                                    .toLowerCase() ==
                                                'sort') {}
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return const EventCard(
                                    eventTitle: 'THE GREYBOT ALL STARS',
                                    date: 'Dec 25, 2023 08:00PM',
                                    distance: 2.3,
                                    hostDetails: 'Bobs`s Bar',
                                    location:
                                        'Great Indian Music Hall, Indira Nagar, Banglore',
                                    price: 5000.00,
                                    eventTime: '10:00 AM - 12:30 AM',
                                    ratings: '5.0 (100 ratings)',
                                    posters: [
                                      'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      state.showLocationDialog
                          ? const LocationDialog()
                          : const SizedBox()
                    ],
                  ),
                ),
        );
      },
    );
  }
}
