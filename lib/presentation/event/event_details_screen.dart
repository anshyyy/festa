import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/event_details/event_details_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/gradient_text.dart';

class EventDetailsScreen extends StatelessWidget {
  final String id;
  const EventDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => EventDetailsCubit(
        EventDetailsState.initial(
          apiBaseUrl: appConfig.serverUrl,
        ),
      )..fetchEventDetails(id: int.parse(id)),
      child: const EventDetailsScreenConsumer(),
    );
  }
}

class EventDetailsScreenConsumer extends StatelessWidget {
  const EventDetailsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventDetailsCubit, EventDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.isLoading
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leading: GestureDetector(
                      onTap: () => navigator<NavigationService>().goBack(),
                      child: Center(
                          child: SvgPicture.asset(AssetConstants.arrowLeft))),
                  title: Text(
                    state.event?.name ?? '',
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
                        // EventCard(
                        //   eventTitle: eventTitle,
                        //   distance: distance,
                        //   hostDetails: hostDetails,
                        //   location: location,
                        //   price: price,
                        //   eventTime: eventTime,
                        //   ratings: ratings,
                        //   date: date,
                        //   posters: posters,
                        // ),
                        GradientText(
                          text: EventDetailsScreenConstants.viewOnMaps,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary
                          ],
                          textStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
