import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../application/main_nav/main_nav_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';
import '../common/event_card.dart';
import '../common/event_card2.dart';
import '../core/primary_button.dart';
import '../search/delegate/search_delegate.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_text.dart';
import 'widgets/data_modal_sheet.dart';
import 'widgets/event_genre_card.dart';
import 'widgets/explore_tile.dart';
import 'widgets/filter_modal_sheet.dart';
import 'widgets/location_dialog.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenConsumer();
  }
}

class HomeScreenConsumer extends StatefulWidget {
  const HomeScreenConsumer({
    super.key,
  });

  @override
  State<HomeScreenConsumer> createState() => _HomeScreenConsumerState();
}

class _HomeScreenConsumerState extends State<HomeScreenConsumer> {
  final ValueNotifier<bool> _isMutedNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    // Get the route settings from navigation service
    final settings = navigator<NavigationService>().getQueryParams();

    if (settings != null && settings['filter'] == 'weekend') {
      // Slight delay to ensure proper initialization and check loading state
      //TODO: remove this delay
      Future.delayed(Duration(milliseconds: 3000), () {
        final state = context.read<HomeCubit>().state;
        if (!state.isLoading) {
          context
              .read<HomeCubit>()
              .updateFilterToThisWeekendBackend(apply: true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isAtTop) {
          BlocProvider.of<MainNavCubit>(context).showNavBar();
        }
        if (state.showLocationDialog ||
            (state.isScrollingUp && state.events.isNotEmpty)) {
          BlocProvider.of<MainNavCubit>(context).hideNavBar();
        } else {
          BlocProvider.of<MainNavCubit>(context).showNavBar();
        }
        // print("mute status : ${state.isVideoMute}");
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
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
                    CustomScrollView(
                      controller: state.scrollController,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 1.h),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
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
                                          Expanded(
                                            child: Row(
                                              children: [
                                                state.isLoading
                                                    ? Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey[300]!
                                                            .withOpacity(0.5),
                                                        highlightColor: Colors
                                                            .grey[400]!
                                                            .withOpacity(0.5),
                                                        child: Container(
                                                          width: 25.w,
                                                          height: 1.5.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ))
                                                    : Text(
                                                        StringExtension
                                                            .formatArea(state
                                                                .location.area),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: themeData
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                          color: themeData
                                                              .colorScheme
                                                              .background,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.3.h),
                                                  child: SvgPicture.asset(
                                                    AssetConstants.arrowRight,
                                                    height: 22.px,
                                                    width: 22.px,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showSearch(
                                            context: context,
                                            delegate: CustomSearchDelegate(
                                                homeCubit:
                                                    context.read<HomeCubit>()),
                                          );
                                        },
                                        child: Container(
                                          height: 4.h,
                                          width: 7.5.w,
                                          // color: Colors.red,
                                          child: SvgPicture.asset(
                                            AssetConstants.searchIcon,
                                            height: 3.0.h,
                                            width: 3.0.h,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          navigator<NavigationService>()
                                              .navigateTo(
                                                  UserRoutes.notificationsRoute)
                                              .then((value) {});
                                        },
                                        child: Container(
                                          height: 4.0.h,
                                          width: 7.5.w,
                                          //color: Colors.red,
                                          child: SvgPicture.asset(
                                            AssetConstants.notificationIcon,
                                            height: 3.0.h,
                                            width: 2.8.h,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ...[
                                if (!state.isSearchOpen) ...[
                                  SizedBox(height: 2.h),
                                  Text(
                                    '${HomeScreenConstants.hey} ${appStateNotifier.user!.fullName.length >= 30 ? appStateNotifier.user!.fullName.substring(0, 27) : appStateNotifier.user!.fullName.split(' ')[0]}, ${HomeScreenConstants.welcomeText}',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              ],
                            ]),
                          ),
                        ),

                        //if(state.noEventsInTheLocation == false)
                        SliverPersistentHeader(
                          floating: true,
                          delegate: FiltersPersistentHeaderDelegate(
                            minExtent: 22.h,
                            maxExtent: 22.h,
                            child: Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  state.isLoading
                                      ? EventTileShimmerFilter()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                            if (state.showSearchOnPick)
                                              GestureDetector(
                                                onTap: () {
                                                  showSearch(
                                                    context: context,
                                                    delegate:
                                                        CustomSearchDelegate(
                                                            homeCubit:
                                                                context.read<
                                                                    HomeCubit>()),
                                                  );
                                                },
                                                child: Container(
                                                  height: 4.0.h,
                                                  width: 7.5.w,
                                                  child: SvgPicture.asset(
                                                    AssetConstants.searchIcon,
                                                    height: 3.0.h,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                  SizedBox(height: 2.h),
                                  SizedBox(
                                    width: 100.w,
                                    height: 9.5.h,
                                    child: ListView.separated(
                                      key: const PageStorageKey('categoryList'),
                                      physics: const BouncingScrollPhysics(),
                                      cacheExtent: 10.0,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        FilterValueDto? categoryValue;
                                        if (state.categoryFilter != null) {
                                          categoryValue = state
                                              .categoryFilter!.values[index];
                                        }

                                        return state.isLoading
                                            ? RepaintBoundary(
                                                child: Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!
                                                    .withOpacity(0.5),
                                                highlightColor: Colors
                                                    .grey[400]!
                                                    .withOpacity(0.5),
                                                child: Container(
                                                  // height: 50,
                                                  width: 22.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              ))
                                            : RepaintBoundary(
                                                child: GestureDetector(
                                                onTap: () {
                                                  AnalyticsService().logEvent(
                                                      eventName:
                                                          'filter_selected',
                                                      paras: {
                                                        'filter': categoryValue
                                                            ?.displayName,
                                                      });
                                                  context
                                                      .read<HomeCubit>()
                                                      .onEventCategoryFilterChange(
                                                          index);
                                                },
                                                child: EventTypeTile(
                                                  key: ValueKey(categoryValue!
                                                      .displayName),
                                                  isSelected:
                                                      categoryValue.isApplied,
                                                  image: CustomImageProvider
                                                      .getImageUrl(
                                                          categoryValue.icon,
                                                          ImageType.profile),
                                                  title:
                                                      categoryValue.displayName,
                                                ),
                                              ));
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(width: 3.w);
                                      },
                                      itemCount: state.isLoading
                                          ? 5
                                          : state.categoryFilter!.values.length,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  // GestureDetector(
                                  //       onTap: () {},
                                  //       child: Text(
                                  //         HomeScreenConstants.explorerAll,
                                  //         style: themeData.textTheme.bodyMedium!
                                  //             .copyWith(
                                  //           fontWeight: FontWeight.w600,
                                  //           color: themeData
                                  //               .colorScheme.background,
                                  //         ),
                                  //       ),
                                  //     ),

                                  //normal filters
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children:
                                          state.exploreList.map((Map item) {
                                        return state.isLoading
                                            ? const EventTileShimmer()
                                            : ExploreTile(
                                                label: item['label'],
                                                icon: item['svgIcon'] ?? '',
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
                                                      if (value != null) {
                                                        // print(value);
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
                                                  }
                                                  // label sorting and filters
                                                  else if (item['label']
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
                                                  } else if (item['label']
                                                          .toString()
                                                          .toLowerCase() ==
                                                      'today') {
                                                    context
                                                        .read<HomeCubit>()
                                                        .updateFilterToTodayBackend(
                                                            apply: state
                                                                    .isTodayFilterApplied
                                                                ? false
                                                                : true);
                                                  } else if (item['label']
                                                          .toString()
                                                          .toLowerCase() ==
                                                      'this weekend') {
                                                    ('weekend');
                                                    context
                                                        .read<HomeCubit>()
                                                        .updateFilterToThisWeekendBackend(
                                                            apply: state
                                                                    .isThisWeekendFilterApplied
                                                                ? false
                                                                : true);
                                                  } else if (item['label']
                                                          .toString()
                                                          .toLowerCase() ==
                                                      'date') {
                                                    if (item['isSelected'] ==
                                                        false) {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (context) {
                                                            return DateModalSheet(
                                                              filters: List.from(state
                                                                  .filters
                                                                  .map((e) => e
                                                                      .copyWith(
                                                                          values:
                                                                              List.from(e.values)))
                                                                  .toList()),
                                                            );
                                                          }).then((value) {
                                                        context
                                                            .read<HomeCubit>()
                                                            .updateSelectedDates(
                                                                value);
                                                        context
                                                            .read<HomeCubit>()
                                                            .updateFilterToSelectedDatesBackend(
                                                                apply: state
                                                                        .isSpecificDateFilterApplied
                                                                    ? false
                                                                    : true);
                                                      });
                                                    } else {
                                                      context
                                                          .read<HomeCubit>()
                                                          .updateSelectedDates(
                                                              []);
                                                      context
                                                          .read<HomeCubit>()
                                                          .updateFilterToSelectedDates(
                                                              apply: state
                                                                      .isSpecificDateFilterApplied
                                                                  ? false
                                                                  : true);
                                                    }
                                                  } else if (item['svgIcon'] ==
                                                      AssetConstants
                                                          .heartOutlinedIcon) {
                                                    print('heart');
                                                  } else {
                                                    context
                                                        .read<HomeCubit>()
                                                        .removeAppliedFilter(
                                                            id: item['id']);
                                                  }
                                                  AnalyticsService().logEvent(
                                                      eventName:
                                                          'filter_selected',
                                                      paras: {
                                                        'filter': item['label'],
                                                      });
                                                },
                                              );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        if (!state.hasMoreEvents &&
                            state.events.isEmpty &&
                            !state.isRefresh)
                          SliverPadding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.h, vertical: 1.h),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate([
                                const EmptyEvents(),
                              ]),
                            ),
                          ),

                        //----------------------------------

                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 1.h),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                // print(
                                //     "state.events.length ${state.events.length}, state.hasMoreEvents ${state.hasMoreEvents},state.isLoading ${state.isLoading}");
                                if (state.hasMoreEvents &&
                                    state.events.length <= index) {
                                  return const RepaintBoundary(
                                      child: EventCardShimmer());
                                }
                                return state.isLoading
                                    ? const RepaintBoundary(
                                        child: EventCardShimmer())
                                    : RepaintBoundary(
                                        child: Padding(
                                        padding: EdgeInsets.only(bottom: 5.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            AnalyticsService().logEvent(
                                                eventName: 'view_event',
                                                paras: {
                                                  'event_id': state
                                                      .events[index].id
                                                      .toString(),
                                                });
                                            navigator<NavigationService>()
                                                .navigateTo(
                                                    UserRoutes
                                                        .eventDetailsRoute,
                                                    queryParams: {
                                                  'valueListenerValue':
                                                      _isMutedNotifier.value
                                                          .toString(),
                                                  'isVideoMuted': state
                                                      .isVideoMute
                                                      .toString(),
                                                  'id': state.events[index].id
                                                      .toString(),
                                                  'distance':
                                                      '${state.events[index].distance > 1000 ? (state.events[index].distance / 1000).toStringAsFixed(1) : state.events[index].distance.toStringAsFixed(0)}km',
                                                }).then((value) {
                                              print(value);
                                            });
                                          },
                                          onDoubleTap: () {
                                            context
                                                .read<HomeCubit>()
                                                .onEventLiked(
                                                    id: state.events[index].id);
                                          },
                                          child: EventCard2(
                                            key: ValueKey(
                                                state.events[index].id),
                                            vKey: state.events[index].id
                                                .toString(),
                                            isVideoMute: state.isVideoMute,
                                            isMutedNotifier: _isMutedNotifier,
                                            isInListing: true,
                                            event: state.events[index],
                                            isLiked:
                                                state.events[index].isLiked,
                                            onMute: () {
                                              _isMutedNotifier.value =
                                                  !_isMutedNotifier.value;
                                              context
                                                  .read<HomeCubit>()
                                                  .onMute();
                                            },
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
                                        ),
                                      ));
                              },
                              childCount: state.isLoading
                                  ? 5
                                  : (state.hasMoreEvents ? 1 : 0) +
                                      state.events.length,
                            ),
                          ),
                        ),

                        //----------------------------------

                        // SliverPadding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 1.h, vertical: 1.h),
                        //   sliver: SliverList(
                        //     delegate: SliverChildBuilderDelegate(
                        //       (context, index) {
                        //         // print(
                        //         //     "state.events.length ${state.events.length}, state.hasMoreEvents ${state.hasMoreEvents},state.isLoading ${state.isLoading}");
                        //         if (state.hasMoreEvents &&
                        //             state.events.length <= index) {
                        //           return const RepaintBoundary(
                        //               child: EventCardShimmer());
                        //         }
                        //         return state.isLoading
                        //             ? const RepaintBoundary(
                        //                 child: EventCardShimmer())
                        //             : RepaintBoundary(
                        //                 child: Padding(
                        //                 padding: EdgeInsets.only(bottom: 5.h),
                        //                 child: GestureDetector(
                        //                   onTap: () {
                        //                     AnalyticsService().logEvent(
                        //                         eventName: 'view_event',
                        //                         paras: {
                        //                           'event_id': state
                        //                               .events[index].id
                        //                               .toString(),
                        //                         });
                        //                     navigator<NavigationService>()
                        //                         .navigateTo(
                        //                             UserRoutes
                        //                                 .eventDetailsRoute,
                        //                             queryParams: {
                        //                           'valueListenerValue':
                        //                               _isMutedNotifier.value
                        //                                   .toString(),
                        //                           'isVideoMuted': state
                        //                               .isVideoMute
                        //                               .toString(),
                        //                           'id': state.events[index].id
                        //                               .toString(),
                        //                           'distance':
                        //                               '${state.events[index].distance > 1000 ? (state.events[index].distance / 1000).toStringAsFixed(1) : state.events[index].distance.toStringAsFixed(0)}km',
                        //                         }).then((value) {
                        //                       print(value);
                        //                     });
                        //                   },
                        //                   onDoubleTap: () {
                        //                     context
                        //                         .read<HomeCubit>()
                        //                         .onEventLiked(
                        //                             id: state.events[index].id);
                        //                   },
                        //                   child: EventCard(
                        //                     key: ValueKey(
                        //                         state.events[index].id),
                        //                     vKey: state.events[index].id
                        //                         .toString(),
                        //                     isVideoMute: state.isVideoMute,
                        //                     isMutedNotifier: _isMutedNotifier,
                        //                     isInListing: true,
                        //                     event: state.events[index],
                        //                     isLiked:
                        //                         state.events[index].isLiked,
                        //                     onMute: () {
                        //                       _isMutedNotifier.value =
                        //                           !_isMutedNotifier.value;
                        //                       context
                        //                           .read<HomeCubit>()
                        //                           .onMute();
                        //                     },
                        //                     onLike: () {
                        //                       context
                        //                           .read<HomeCubit>()
                        //                           .onEventLiked(
                        //                               id: state
                        //                                   .events[index].id,
                        //                               isLiked: !state
                        //                                   .events[index]
                        //                                   .isLiked);
                        //                     },
                        //                   ),
                        //                 ),
                        //               ));
                        //       },
                        //       childCount: state.isLoading
                        //           ? 5
                        //           : (state.hasMoreEvents ? 1 : 0) +
                        //               state.events.length,
                        //     ),
                        //   ),
                        // ),
                        // if (state.showLocationDialog)
                        //   SliverToBoxAdapter(child: LocationDialog()),
                      ],
                    ),
                    state.showLocationDialog
                        ? const LocationDialog()
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EventTileShimmerFilter extends StatelessWidget {
  const EventTileShimmerFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: Container(
        height: 20,
        width: 42.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
      ),
    );
  }
}

class EventTileShimmer extends StatelessWidget {
  const EventTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        height: 3.h,
        width: 17.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
      ),
    );
  }
}

class FiltersPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Widget child;

  FiltersPersistentHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  bool shouldRebuild(FiltersPersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate.child ||
        minExtent != oldDelegate.minExtent ||
        maxExtent != oldDelegate.maxExtent;
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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: state.noFilteredEvents ? 10.h : 20.h,
                  ),
                  SvgPicture.asset(AssetConstants.notFoundFilter),
                  if (state.noFilteredEvents)
                    Text(
                      "Uh-No, you are not losing the party this time- Adjust those filters and find what's buzzing.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  if (!state.noFilteredEvents)
                    Text(
                      'No action here, but the party’s probably just a few clicks away. Try different location!',
                      textAlign: TextAlign.center,
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Popular events in Banglore',
              //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
              //             fontWeight: FontWeight.w600,
              //             fontSize: 16.sp,
              //             color: Theme.of(context).colorScheme.background,
              //           ),
              //     ),
              //     Align(
              //       alignment: Alignment.centerRight,
              //       child: GradientText(
              //         text: 'See all Events',
              //         colors: [
              //           Theme.of(context).colorScheme.primary,
              //           Theme.of(context).colorScheme.secondary
              //         ],
              //         textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16.sp,
              //               color: Theme.of(context).colorScheme.background,
              //             ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // const SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(children: [
              //     EventWidget(),
              //     EventWidget(),
              //     EventWidget(),
              //     EventWidget(),
              //     EventWidget(),
              //     EventWidget(),
              //   ]),
              // )
            ],
          ),
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

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 1500), // Slower animation
        baseColor: Colors.grey[300]!.withOpacity(0.5),
        highlightColor: Colors.grey[400]!.withOpacity(0.5),
        child: Container(
          height: 45.h,
          width: 100.w,
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}

class EventTypeTileShimmer extends StatelessWidget {
  const EventTypeTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 7.h,
            width: 100.w,
            color: Colors.grey[300],
          ),
          Container(
            height: 9.5.h,
            width: 22.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5.w),
              color: Colors.grey[300],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
