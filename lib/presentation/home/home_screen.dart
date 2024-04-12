import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../common/event_card.dart';
import '../core/primary_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_text.dart';
import 'widgets/event_genre_card.dart';
import 'widgets/explore_tile.dart';
import 'widgets/filter_modal_sheet.dart';
import 'widgets/location_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => HomeCubit(HomeState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: appConfig.serverUrl,
        mapsApiKey: appConfig.googleMapsApiKey,
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
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                onRefresh: ()async{
                  context.read<HomeCubit>().onPullToRefresh();
                },
                child: SafeArea(
                    child: GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().removeOverlay();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: IgnorePointer(
                        ignoring: state.overlayEntry != null,
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              controller: state.scrollController,
                              child: Padding(
                                padding: EdgeInsets.all(3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    state.isSearchOpen
                                        ? CustomTextField(
                                            controller: state.searchController,
                                            onChanged: (val) {
                                              EasyDebounce.debounce(
                                                  'home-search-events',
                                                  const Duration(
                                                      milliseconds: 300), () {
                                                context
                                                    .read<HomeCubit>()
                                                    .onSearchChange();
                                              });
                                            },
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 1.5.h),
                                            hintTextStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontSize: 16.sp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background
                                                        .withOpacity(0.6)),
                                            isFill: true,
                                            fillColor: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 16.sp,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background
                                                      .withOpacity(0.6),
                                                ),
                                            hintText:
                                                HomeScreenConstants.searchEvent,
                                            prefixIcon: SvgPicture.asset(
                                              AssetConstants.searchIcon,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background
                                                  .withOpacity(0.6),
                                              width: 7.w,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<HomeCubit>()
                                                    .onSearchChange(
                                                        isSearchOn: false);
                                              },
                                              child: SvgPicture.asset(
                                                AssetConstants.closeIcon,
                                                width: 6.w,
                                              ),
                                            ),
                                          )
                                        : Row(
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
                                                      AssetConstants
                                                          .locationIconPink,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Text(
                                                      StringExtension
                                                          .displayAddress(
                                                              state.location),
                                                      style: themeData
                                                          .textTheme.bodySmall!
                                                          .copyWith(
                                                              color: themeData
                                                                  .colorScheme
                                                                  .background,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<HomeCubit>()
                                                          .toggleSearch(
                                                              flag: true);
                                                    },
                                                    child: SvgPicture.asset(
                                                      AssetConstants.searchIcon,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      appStateNotifier
                                                          .toggleBottomNav(
                                                              showBottomNav:
                                                                  false);
                                                      navigator<
                                                              NavigationService>()
                                                          .navigateTo(UserRoutes
                                                              .notificationsRoute)
                                                          .then((value) =>
                                                              appStateNotifier
                                                                  .toggleBottomNav(
                                                                      showBottomNav:
                                                                          true));
                                                    },
                                                    child: SvgPicture.asset(
                                                        AssetConstants
                                                            .notificationIcon),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                    if (!state.hasMoreEvents &&
                                        state.events.isEmpty)
                                      const EmptyEvents()
                                    else ...[
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        '${HomeScreenConstants.hey} ${appStateNotifier.user!.fullName.split(' ')[0]}, ${HomeScreenConstants.welcomeText}',
                                        style: themeData.textTheme.bodySmall!
                                            .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          letterSpacing: 0,
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
                                              HomeScreenConstants
                                                  .pickYourExperience,
                                              style: themeData
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: themeData
                                                    .colorScheme.background,
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
                                                      .categoryFilter!
                                                      .values[index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      if (state
                                                          .categoryFilter!
                                                          .values[index]
                                                          .isApplied) {
                                                        state.categoryFilter!
                                                                .values[index] =
                                                            state.categoryFilter!
                                                                .values[index]
                                                                .copyWith(
                                                                    isApplied:
                                                                        false);
                                                        final indexTemp = state
                                                            .filters
                                                            .indexWhere(
                                                                (element) {
                                                          return element.name ==
                                                              'music';
                                                        });
                                                        state.filters[indexTemp] =
                                                            state.filters[
                                                                    indexTemp]
                                                                .copyWith(
                                                                    isApplied:
                                                                        false);
                                                        context
                                                            .read<HomeCubit>()
                                                            .updateFilterApplied(
                                                                filters:
                                                                    List.from(
                                                              state.filters,
                                                            ));
                                                        return;
                                                      }
                                                      for (int i = 0;
                                                          i <
                                                              state
                                                                  .categoryFilter!
                                                                  .values
                                                                  .length;
                                                          i++) {
                                                        state.categoryFilter!
                                                                .values[i] =
                                                            state.categoryFilter!
                                                                .values[i]
                                                                .copyWith(
                                                                    isApplied:
                                                                        false);
                                                      }
                                                      state.categoryFilter!
                                                              .values[index] =
                                                          state.categoryFilter!
                                                              .values[index]
                                                              .copyWith(
                                                                  isApplied:
                                                                      true);
                                                      final indexTemp = state
                                                          .filters
                                                          .indexWhere((element) {
                                                        return element.name ==
                                                            'music';
                                                      });
                                                      state.filters[indexTemp] =
                                                          state.filters[indexTemp]
                                                              .copyWith(
                                                                  isApplied:
                                                                      true);
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
                                                      image: CustomImageProvider
                                                          .getImageUrl(
                                                              categoryValue.icon,
                                                              ImageType.profile),
                                                      title: categoryValue
                                                          .displayName,
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                    width: 3.w,
                                                  );
                                                },
                                                itemCount: state.categoryFilter!
                                                    .values.length,
                                              ),
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              HomeScreenConstants.explorerAll,
                                              style: themeData
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: themeData
                                                    .colorScheme.background,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: state.exploreList
                                                  .map((Map item) {
                                                return ExploreTile(
                                                  label: item['label'],
                                                  icon: item['svgIcon'],
                                                  isSelected: item['isSelected'],
                                                  key: item['label']
                                                              .toString()
                                                              .toLowerCase() ==
                                                          'sort'
                                                      ? state.sortKey
                                                      : Key(item['label']),
                                                  onTap: () async {
                                                    final builderContext =
                                                        context;
                                                    if (item['label']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        'filter') {
                                                      appStateNotifier
                                                          .toggleBottomNav(
                                                              showBottomNav:
                                                                  false);
                                                      showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (context) {
                                                            return FilterModalSheet(
                                                              filters: List.from(state
                                                                  .filters
                                                                  .map((e) => e.copyWith(
                                                                      values: List
                                                                          .from(e
                                                                              .values)))
                                                                  .toList()),
                                                            );
                                                          }).then((value) {
                                                        appStateNotifier
                                                            .toggleBottomNav(
                                                                showBottomNav:
                                                                    true);
                                                        if (value != null) {
                                                          if (value is List<
                                                              FilterDto>) {
                                                            builderContext
                                                                .read<HomeCubit>()
                                                                .updateFilterApplied(
                                                                    filters:
                                                                        value);
                                                          }
                                                        }
                                                      });
                                                    } else if (item['label']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        'sort') {
                                                      context
                                                          .read<HomeCubit>()
                                                          .getChipPosition(
                                                              key: state.sortKey,
                                                              overlayState:
                                                                  Overlay.of(
                                                                      context));
                                                    } else {
                                                      context
                                                          .read<HomeCubit>()
                                                          .removeAppliedFilter(
                                                              id: item['id']);
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                            onTap: () {
                                              appStateNotifier.toggleBottomNav(
                                                  showBottomNav: false);
                                              navigator<NavigationService>()
                                                  .navigateTo(
                                                      UserRoutes
                                                          .eventDetailsRoute,
                                                      queryParams: {
                                                    'id': state.events[index].id
                                                        .toString(),
                                                    'distance':
                                                        '${state.events[index].distance > 1000 ? (state.events[index].distance / 1000).toStringAsFixed(1) : state.events[index].distance.toStringAsFixed(0)}km',
                                                  }).then((value) =>
                                                      appStateNotifier
                                                          .toggleBottomNav(
                                                              showBottomNav:
                                                                  true));
                                            },
                                            onDoubleTap: () {
                                              context
                                                  .read<HomeCubit>()
                                                  .onEventLiked(
                                                      id: state.events[index].id);
                                            },
                                            child: EventCard(
                                              isInListing: true,
                                              event: state.events[index],
                                              isLiked:
                                                  state.events[index].isLiked,
                                              onLike: () {
                                                context
                                                    .read<HomeCubit>()
                                                    .onEventLiked(
                                                        id: state
                                                            .events[index].id,
                                                        isLiked: !state
                                                            .events[index]
                                                            .isLiked);
                                              },
                                            ),
                                          );
                                        },
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            ),
                            // state.isSearchOpen
                            //     ? const HomeSearch()
                            //     : const SizedBox(),
                            state.showLocationDialog
                                ? const LocationDialog()
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
        );
      },
    );
  }
}

class EmptyEvents extends StatelessWidget {
  const EmptyEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SvgPicture.asset(AssetConstants.notFoundFilter),
                Text(
                  '${HomeScreenConstants.noEventsFound}${state.noFilteredEvents ? HomeScreenConstants.filters : HomeScreenConstants.area}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                state.noFilteredEvents
                    ? PrimaryButton(
                        text: HomeScreenConstants.editFilters,
                        function: () {
                          final builderContext = context;
                          Provider.of<AppStateNotifier>(context, listen: false)
                              .toggleBottomNav(showBottomNav: false);
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return FilterModalSheet(
                                  filters: List.from(state.filters
                                      .map((e) => e.copyWith(
                                          values: List.from(e.values)))
                                      .toList()),
                                );
                              }).then((value) {
                            Provider.of<AppStateNotifier>(context,
                                    listen: false)
                                .toggleBottomNav(showBottomNav: true);
                            if (value != null) {
                              if (value is List<FilterDto>) {
                                builderContext
                                    .read<HomeCubit>()
                                    .updateFilterApplied(filters: value);
                              }
                            }
                          });
                        },
                        width: 10.w,
                        height: 4.h,
                        borderColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        textColor: Theme.of(context).colorScheme.background,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    : GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().toggleLocationDialog();
                        },
                        child: Container(
                          height: 4.h,
                          width: 35.w,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.secondary
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.setupLocation,
                                height: 2.h,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    HomeScreenConstants.chooseLocation,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular events in Banglore',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GradientText(
                    text: 'See all Events',
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary
                    ],
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                EventWidget(),
                EventWidget(),
                EventWidget(),
                EventWidget(),
                EventWidget(),
                EventWidget(),
              ]),
            )
          ],
        );
      },
    );
  }
}

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.h,
            width: 20.h,
            margin: EdgeInsets.only(right: 3.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        CustomImageProvider.getImageUrl(
                            'https://plus.unsplash.com/premium_photo-1682265676364-5838a427dee2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ImageType.other)))),
          ),
          SizedBox(
            height: 1.h,
          ),
          GradientText(
            text: 'Now. 8 PM - 12:00 PM',
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Text(
            'THE GREYBOT ALL STARS/MIKE',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Text(
            'Great Indian Music Hall',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Text(
            '554+ people booked, 1034+ interested',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                // fontWeight: FontWeight.w300,
                ),
          )
        ],
      ),
    );
  }
}
