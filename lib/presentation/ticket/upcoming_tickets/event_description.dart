import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventDescription extends StatelessWidget{
  const EventDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 28.w,
              height: 16.3.h,
              
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                  imageUrl:
                      'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            )),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // big title
              Text(
                'SCHEVENINGEN Season MAY - OCTOBER',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
                maxLines: 2,
              ),
              SizedBox(
                height: 1.h,
              ),
              // description
              Text(
                'House of commons, Indira Nagar, Bangalore.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
                maxLines: 2,
              ),
              SizedBox(
                height: 1.h,
              ),

              Text(
                'Wednesday, 20 Nov 2023',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
                maxLines: 2,
              ),
              Text(
                '08:00PM - 10:30PM',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
                maxLines: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}