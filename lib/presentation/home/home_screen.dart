import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
import '../core/primary_button.dart';
import '../search/delegate/search_delegate.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_text.dart';
import 'widgets/data_modal_sheet.dart';
import 'widgets/event_genre_card.dart';
import 'widgets/explore_tile.dart';
import 'widgets/filter_modal_sheet.dart';
import 'widgets/location_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenConsumer();
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
      listener: (context, state) {
       // print(state.showLocationDialog);
       state.showLocationDialog?
        BlocProvider.of<MainNavCubit>(context).hideNavBar():
         BlocProvider.of<MainNavCubit>(context).showNavBar();
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
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: state.scrollController,
                      padding: EdgeInsets.all(3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //             InkWell(
                          //               onTap: (){
                          //                  showSearch(
                          //   context: context,
                          //   delegate: MySearchDelegate(),
                          // );
                          //               },
                          //               child:  SvgPicture.asset(
                          //                       AssetConstants.searchIcon,
                          //                       color: Theme.of(context)
                          //                           .colorScheme
                          //                           .background
                          //                           .withOpacity(0.6),
                          //                       width: 7.w,
                          //                     ),
                          //             ),

                          //                 ? CustomTextField(
                          //                     autofocus: true,
                          //                     controller: state.searchController,
                          //                     onChanged: (val) {
                          //                       EasyDebounce.debounce('home-search-events',
                          //                           const Duration(milliseconds: 500), () {
                          //                         context
                          //                             .read<HomeCubit>()
                          //                             .onSearchChange();
                          //                       });
                          //                     },
                          //                     contentPadding: EdgeInsets.symmetric(
                          //                         horizontal: 4.w, vertical: 1.5.h),
                          //                     hintTextStyle: Theme.of(context)
                          //                         .textTheme
                          //                         .bodySmall!
                          //                         .copyWith(
                          //                             fontSize: 16.sp,
                          //                             color: Theme.of(context)
                          //                                 .colorScheme
                          //                                 .background
                          //                                 .withOpacity(0.6)),
                          //                     isFill: true,
                          //                     fillColor:
                          //                         Theme.of(context).colorScheme.surface,
                          //                     textStyle: Theme.of(context)
                          //                         .textTheme
                          //                         .bodySmall!
                          //                         .copyWith(
                          //                           fontSize: 16.sp,
                          //                           color: Theme.of(context)
                          //                               .colorScheme
                          //                               .background
                          //                               .withOpacity(0.6),
                          //                         ),
                          //                     hintText: HomeScreenConstants.searchEvent,
                          //                     prefixIcon: SvgPicture.asset(
                          //                       AssetConstants.searchIcon,
                          //                       color: Theme.of(context)
                          //                           .colorScheme
                          //                           .background
                          //                           .withOpacity(0.6),
                          //                       width: 7.w,
                          //                     ),
                          //                     suffixIcon: GestureDetector(
                          //                       onTap: () {
                          //                          showSearch(
                          //   context: context,
                          //   delegate: MySearchDelegate(),
                          // );
                          //                         // context
                          //                         //     .read<HomeCubit>()
                          //                         //     .onSearchChange(isSearchOn: false);
                          //                       },
                          //                       child: SvgPicture.asset(
                          //                         AssetConstants.closeIcon,
                          //                         width: 6.w,
                          //                       ),
                          //                     ),
                          //                   )
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        child: Text(
                                          StringExtension.displayAddress(
                                              state.location),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                                  color: themeData
                                                      .colorScheme.background,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      )
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
                                      // context
                                      //     .read<HomeCubit>()
                                      //     .toggleSearch(flag: true);
                                      showSearch(
                                        context: context,
                                        delegate: CustomSearchDelegate(
                                            homeCubit:
                                                context.read<HomeCubit>()),
                                      );
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
                                      navigator<NavigationService>()
                                          .navigateTo(
                                              UserRoutes.notificationsRoute)
                                          .then((value) {});
                                    },
                                    child: SvgPicture.asset(
                                        AssetConstants.notificationIcon),
                                  )
                                ],
                              )
                            ],
                          ),
                          if (!state.hasMoreEvents &&
                              state.events.isEmpty &&
                              !state.isRefresh)
                            const EmptyEvents()
                          else ...[
                            state.isSearchOpen
                                ? const SizedBox()
                                : SizedBox(
                                    height: 2.h,
                                  ),
                            state.isSearchOpen
                                ? const SizedBox()
                                : Text(
                                    '${HomeScreenConstants.hey} ${appStateNotifier.user!.fullName.split(' ')[0]}, ${HomeScreenConstants.welcomeText}',
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      letterSpacing: 0,
                                    ),
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            state.isSearchOpen
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          HomeScreenConstants
                                              .pickYourExperience,
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: themeData
                                                .colorScheme.background,
                                          )),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        height: state.isLoading &&
                                                !state.isSearchOpen
                                            ? 12.h
                                            : 9.5.h,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            FilterValueDto? categoryValue;
                                            if (state.categoryFilter != null) {
                                              categoryValue = state
                                                  .categoryFilter!
                                                  .values[index];
                                            }

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
                                                for (int i = 0;i <state.categoryFilter!.values.length;i++) {
                                                  state.categoryFilter!
                                                          .values[i] =
                                                      state.categoryFilter!
                                                          .values[i]
                                                          .copyWith(
                                                              isApplied: false);
                                                }
                                                state.categoryFilter!.values[index] =
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
                                              child: state.isLoading &&
                                                      !state.isSearchOpen
                                                  ? const EventTypeTileShimmer()
                                                  : EventTypeTile(
                                                      isSelected: categoryValue!
                                                          .isApplied,
                                                      image: CustomImageProvider
                                                          .getImageUrl(
                                                              categoryValue
                                                                  .icon,
                                                              ImageType
                                                                  .profile),
                                                      title: categoryValue
                                                          .displayName,
                                                    ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: 3.w,
                                            );
                                          },
                                          itemCount: state.isLoading
                                              ? 5
                                              : state.categoryFilter!.values
                                                  .length,
                                        ),
                                      ),
                                    ],
                                  ),
                            state.isSearchOpen
                                ? const SizedBox()
                                : SizedBox(
                                    height: 2.h,
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.isSearchOpen
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          HomeScreenConstants.explorerAll,
                                          style: themeData.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: themeData
                                                .colorScheme.background,
                                          ),
                                        ),
                                      ),
                                state.isSearchOpen
                                    ? const SizedBox()
                                    : SizedBox(
                                        height: 2.h,
                                      ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: state.exploreList.map((Map item) {
                                      return ExploreTile(
                                        label: item['label'],
                                        icon: item['svgIcon'] ?? " ",
                                        isSelected: item['isSelected'],
                                        key: item['label']
                                                    .toString()
                                                    .toLowerCase() ==
                                                'sort'
                                            ? state.sortKey
                                            : Key(item['label']),
                                        onTap: () async {
                                          final builderContext = context;
                                          if (item['label'].toString().toLowerCase() =='filter') {
                                            showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
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
                                               // print(value);
                                                if (value is List<FilterDto>) {

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
                                            context
                                                .read<HomeCubit>()
                                                .getChipPosition(
                                                    key: state.sortKey,
                                                    overlayState:
                                                        Overlay.of(context));
                                          } else if (item['label']
                                                  .toString()
                                                  .toLowerCase() ==
                                              "today") {
                                            print("today");
                                          } else if (item['label']
                                                  .toString()
                                                  .toLowerCase() ==
                                              "this weekend") {
                                            print("weekend");
                                          } else if (item['label']
                                                  .toString()
                                                  .toLowerCase() ==
                                              "date") {
                                            print("Date");

                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return DateModalSheet();
                                                });


                                          } else if (item['svgIcon'] ==
                                              AssetConstants
                                                  .heartOutlinedIcon) {
                                            print("heart");
                                          } else {
                                            print(item['label']);
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
                              // separatorBuilder: (context, index) {
                              //   return Divider(color: Colors.red,);
                              // },
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.isLoading
                                  ? 5
                                  : (state.hasMoreEvents ? 1 : 0) +
                                      state.events.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (state.hasMoreEvents &&
                                    state.events.length <= index) {
                                  return const EventCardShimmer();
                                }
                                return state.isLoading
                                    ? const EventCardShimmer()
                                    : Padding(
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
                                                  'id': state.events[index].id
                                                      .toString(),
                                                  'distance':
                                                      '${state.events[index].distance > 1000 ? (state.events[index].distance / 1000).toStringAsFixed(1) : state.events[index].distance.toStringAsFixed(0)}km',
                                                }).then((value) {});
                                          },
                                          onDoubleTap: () {
                                            context
                                                .read<HomeCubit>()
                                                .onEventLiked(
                                                    id: state.events[index].id);
                                          },
                                          child: EventCard(
                                            vKey: index.toString(),
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
                                        ),
                                      );
                              },
                            )
                          ]
                        ],
                      ),
                    ),
                    state.showLocationDialog
                        ? const LocationDialog()
                        : const SizedBox()
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
                    height: 30.h,
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
  const EventCardShimmer({super.key});

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
            height: 45.h,
            width: 100.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
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
