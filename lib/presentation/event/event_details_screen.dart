import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../common/event_card.dart';
import '../widgets/gradient_text.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventTitle;
  final double distance;
  final String hostDetails;
  final String location;
  final double price;
  final String eventTime;
  final String ratings;
  final String date;
  final List<String> posters;
  const EventDetailsScreen(
      {super.key,
      required this.eventTitle,
      required this.distance,
      required this.hostDetails,
      required this.location,
      required this.price,
      required this.eventTime,
      required this.ratings,
      required this.date,
      required this.posters});

  @override
  Widget build(BuildContext context) {
    return EventDetailsScreenConsumer(
        eventTitle: eventTitle,
        distance: distance,
        hostDetails: hostDetails,
        location: location,
        price: price,
        eventTime: eventTime,
        ratings: ratings,
        date: date,
        posters: posters);
  }
}

class EventDetailsScreenConsumer extends StatelessWidget {
  final String eventTitle;
  final double distance;
  final String hostDetails;
  final String location;
  final double price;
  final String eventTime;
  final String ratings;
  final String date;
  final List<String> posters;
  const EventDetailsScreenConsumer(
      {super.key,
      required this.eventTitle,
      required this.distance,
      required this.hostDetails,
      required this.location,
      required this.price,
      required this.eventTime,
      required this.ratings,
      required this.date,
      required this.posters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Center(child: SvgPicture.asset(AssetConstants.arrowLeft)),
        title: Text(
          eventTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.background,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: SvgPicture.asset(AssetConstants.threeDotsIcon),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventCard(
                eventTitle: eventTitle,
                distance: distance,
                hostDetails: hostDetails,
                location: location,
                price: price,
                eventTime: eventTime,
                ratings: ratings,
                date: date,
                posters: posters,
              ),
              GradientText(
                text: EventDetailsScreenConstants.viewOnMaps,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary
                ],
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
