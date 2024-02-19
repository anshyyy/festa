import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import 'widgets/event_genre_card.dart';
import 'widgets/explore_tile_v2.dart';
import 'widgets/filter_modal_sheet.dart';
import 'widgets/location_dialog.dart';
import '../common/event_card.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeState.initial()),
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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    state.city,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              HomeScreenConstants.pickYourExperience,
                              style: themeData.textTheme.bodyMedium!.copyWith(
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
                                children: state.categoriesList.map((Map cat) {
                                  return EventTypeTile(
                                    themeData: themeData,
                                    image: cat['image'],
                                    title: cat['title'],
                                  );
                                }).toList(),
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
                              style: themeData.textTheme.bodyMedium!.copyWith(
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
                                children: state.exploreList.map((Map item) {
                                  return ExploreTile(
                                    label: item['label'],
                                    icon: item['svgIcon'],
                                    isSelected: item['isSelected'],
                                    onTap: () {
                                      context
                                          .read<HomeCubit>()
                                          .onChipChange(id: item['id']);
                                      if (item['label']
                                              .toString()
                                              .toLowerCase() ==
                                          'filter') {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return const FilterModalSheet();
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
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const EventCard(
                              eventTitle: 'THE GREYBOT ALL STARS',
                              date:'Dec 25, 2023 08:00PM',
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
                state.showLocationDialog ? LocationDialog() : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
