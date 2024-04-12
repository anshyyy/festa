import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';

class EventDescription extends StatelessWidget {
  final BookedTicketDetailsDto ticketDetails;
  const EventDescription({
    super.key,
    required this.ticketDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 30.w,
                  height: 17.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.2),
                        width: .5.w),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        CustomImageProvider.getImageUrl(ticketDetails.eventDetails.coverImage, ImageType.other)
                      ),
                    ),
                  ),
                )),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // big title
                  Text(
                    ticketDetails.eventDetails.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.5.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.95)),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: .8.h,
                  ),
                  // description
                  Text(
                    'House of commons, Indira Nagar, Bangalore.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.9)),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: .8.h,
                  ),

                  Text(
                    StringExtension.formatDateTimeLong(DateTime.parse(ticketDetails.eventDetails.startDate)),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.5.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.8)),
                    maxLines: 2,
                  ),
                  // Text(
                  //   '08:00PM - 10:30PM',
                  //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 14.5.sp,
                  //       color: Theme.of(context)
                  //           .colorScheme
                  //           .background
                  //           .withOpacity(.8)),
                  //   maxLines: 2,
                  // ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
