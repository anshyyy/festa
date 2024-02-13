import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../common/card_screen.dart';
import 'widgets/explore_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeState.initial()),
      child: const HomeScreenConsumer(),
    );
  }
}

class HomeScreenConsumer extends StatelessWidget {
  const HomeScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 3.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AssetConstants.locationIcon),
                        Row(
                          children: [
                            SvgPicture.asset(AssetConstants.searchIcon),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(AssetConstants.notificationIcon),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      HomeScreenConstants.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      HomeScreenConstants.pickYourExperience,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 78,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoriesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 78,
                              width: 78,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(state.imageList[index]),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 2.w, left: 1.w, right: 1),
                                  child: Text(
                                    state.categoriesList[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      HomeScreenConstants.explorerAll,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        height: 4.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.exploreList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(right: 0.5.h),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ExploreTile(
                                    svgIcon: state.exploreList[index]
                                        ['svgIcon'],
                                    label: state.exploreList[index]['label'],
                                  ),
                                ),
                              );
                            })),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            navigator<NavigationService>()
                                .navigateTo(UserRoutes.eventCardRoute);
                          },
                          child: CardScreen(
                            km: 2.3,
                            dateTime: DateTime.now(),
                            barsName: "Bobs's Bar",
                            bandName: CartScreenConstants.addText,
                            price: 5000,
                            time: '10:00 AM - 12:30 AM',
                            ratings: '5.0(100 ratings)',
                            location:
                                'Great Indian Music Hall, Indira Nagar, Bangalore',
                          ),
                        );
                      },
                    )
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
