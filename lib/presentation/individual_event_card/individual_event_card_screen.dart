import 'package:flutter/material.dart';

import '../../domain/core/constants/string_constants.dart';
import '../common/card_screen.dart';
import '../widgets/custom_appbar.dart';

class EventCardScreen extends StatelessWidget {
  const EventCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
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
          CardScreen(
            km: 2.3,
            dateTime: DateTime.now(),
            barsName: "Bobs's Bar",
            bandName: CartScreenConstants.addText,
            price: 5000,
            time: '10:00 AM - 12:30 AM',
            ratings: '5.0(100 ratings)',
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                EventCardScreenConstants.viewOnMaps,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              )),
        ],
      ),
    );
  }
}
