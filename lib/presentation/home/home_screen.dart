import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../core/primary_button.dart';
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
                        controller: state.scrollController,
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
                              if (!state.hasMoreEvents && state.events.isEmpty)
                                Container(
                                  height: 80.h,
                                  alignment: Alignment.center,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            AssetConstants.notFoundFilter),
                                        Text(
                                          HomeScreenConstants.noEventsFound,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        PrimaryButton(
                                          text: HomeScreenConstants.editFilters,
                                          function: () {
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
                                          },
                                          width: 10.w,
                                          height: 35,
                                          borderColor: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          textColor: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        )
                                      ]),
                                )
                              else ...[
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  '${HomeScreenConstants.hey} James, ${HomeScreenConstants.welcomeText}',
                                  style:
                                      themeData.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (state.categoryFilter != null)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (state.categoryFilter != null)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        HomeScreenConstants.pickYourExperience,
                                        style: themeData.textTheme.bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              themeData.colorScheme.background,
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
                                            return GestureDetector(
                                              onTap: () {
                                                if (state.categoryFilter!
                                                    .values[index].isApplied) {
                                                  state.categoryFilter!
                                                          .values[index] =
                                                      state.categoryFilter!
                                                          .values[index]
                                                          .copyWith(
                                                              isApplied: false);
                                                  final indexTemp = state
                                                      .filters
                                                      .indexWhere((element) {
                                                    return element.name ==
                                                        'music';
                                                  });
                                                  state.filters[indexTemp] =
                                                      state.filters[indexTemp]
                                                          .copyWith(
                                                              isApplied: false);
                                                  context
                                                      .read<HomeCubit>()
                                                      .updateFilterApplied(
                                                          filters: List.from(
                                                        state.filters,
                                                      ));
                                                  return;
                                                }
                                                for (int i = 0;
                                                    i <
                                                        state.categoryFilter!
                                                            .values.length;
                                                    i++) {
                                                  state.categoryFilter!
                                                          .values[i] =
                                                      state.categoryFilter!
                                                          .values[i]
                                                          .copyWith(
                                                              isApplied: false);
                                                }
                                                state.categoryFilter!
                                                        .values[index] =
                                                    state.categoryFilter!
                                                        .values[index]
                                                        .copyWith(
                                                            isApplied: true);
                                                final indexTemp = state.filters
                                                    .indexWhere((element) {
                                                  return element.name ==
                                                      'music';
                                                });
                                                state.filters[indexTemp] = state
                                                    .filters[indexTemp]
                                                    .copyWith(isApplied: true);
                                                context
                                                    .read<HomeCubit>()
                                                    .updateFilterApplied(
                                                        filters: List.from(
                                                      state.filters,
                                                    ));
                                              },
                                              child: EventTypeTile(
                                                isSelected:
                                                    categoryValue.isApplied,
                                                image: categoryValue.icon,
                                                title:
                                                    categoryValue.displayName,
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: 3.w,
                                            );
                                          },
                                          itemCount: state
                                              .categoryFilter!.values.length,
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
                                                                                              final builderContext = context;

                                              if (item['label']
                                                      .toString()
                                                      .toLowerCase() ==
                                                  'filter') {
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
                                                  'sort') {
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
                                                  }
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
                                  itemCount: (state.hasMoreEvents ? 1 : 0) +
                                      state.events.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (state.hasMoreEvents &&
                                        state.events.length <= index) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return GestureDetector(
                                      onTap: (){
                                           navigator<NavigationService>().navigateTo(
                                          UserRoutes.eventDetailsRoute,
                                          queryParams: {
                                            'id': state.events[index].id
                                                .toString(),
                                          });
                                      },
                                      child: EventCard(
                                        event: state.events[index],
                                      ),
                                    );
                                  },
                                )
                              ]
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
