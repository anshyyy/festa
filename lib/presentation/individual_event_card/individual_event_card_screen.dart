import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../common/card_screen.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_button.dart';

class EventCardScreen extends StatelessWidget {
  const EventCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventCardScreenConsumer();
  }
}

class EventCardScreenConsumer extends StatelessWidget {
  const EventCardScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: EventCardScreenConstants.appBarTitle,
        isLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            EventCardScreenConstants.viewOnMaps,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      ListTileTheme(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          childrenPadding:
                              EdgeInsets.only(bottom: 4.h, left: 2.h),
                          title: Text(
                            EventCardScreenConstants.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          children: [
                            Text(
                              EventCardScreenConstants.descriptionText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTileTheme(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          childrenPadding:
                              EdgeInsets.only(bottom: 4.h, left: 2.h),
                          title: Text(
                            EventCardScreenConstants.lsd,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.lightsIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.lightText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.soundsIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.musicText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.danceFloorIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.danceFloorText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTileTheme(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          childrenPadding:
                              EdgeInsets.only(bottom: 4.h, left: 2.h),
                          title: Text(
                            EventCardScreenConstants.ambience,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.lightsIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        EventCardScreenConstants.ambienceText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.soundsIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.musicText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.danceFloorIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.danceFloorText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTileTheme(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          childrenPadding:
                              EdgeInsets.only(bottom: 4.h, left: 2.h),
                          title: Text(
                            EventCardScreenConstants.foodAndBeverages,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.foodIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.spicy,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.drinkIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        EventCardScreenConstants.drinks,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.danceFloorIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.danceFloorText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTileTheme(
                        tileColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: ExpansionTile(
                          iconColor: Theme.of(context).colorScheme.background,
                          collapsedIconColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          childrenPadding:
                              EdgeInsets.only(bottom: 4.h, left: 2.h),
                          title: Text(
                            EventCardScreenConstants.fAQs,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 1.h, bottom: 5.h),
                                      child: Text(
                                        EventCardScreenConstants.number,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 1.h),
                                        child: Text(
                                          EventCardScreenConstants.fAQsText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AssetConstants.drinkIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        EventCardScreenConstants.drinks,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.danceFloorIcon),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      EventCardScreenConstants.danceFloorText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 110,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.h, left: 3.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dec 25, 08:00 PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Text(
                              '₹4,999',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '₹5,999',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GradientButton(
                      text: EventCardScreenConstants.bookTheTickets,
                      onTap: () {},
                      height: 10.h,
                      width: 20.w)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
