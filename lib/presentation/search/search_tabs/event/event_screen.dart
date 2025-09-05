import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../infrastructure/event/dtos/event/event_dto.dart';
import 'widget/event_card.dart';

class EventScreenTab extends StatefulWidget {
  final List<EventDto>events;
  const EventScreenTab({super.key,required this.events});

  @override
  State<EventScreenTab> createState() => _EventScreenTabState();
}

class _EventScreenTabState extends State<EventScreenTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: 
        
        widget.events.isEmpty?
        
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.sentiment_dissatisfied,
                        size: 80.px, color: Colors.grey),
                    SizedBox(height: 1.5.h),
            const Text(
              'No Events Found!!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      )
        :
        
        ListView.separated(
          itemCount: widget.events.length,
          itemBuilder: (context, index) {
          return  EventCard(event: widget.events[index],);
        }, separatorBuilder: (BuildContext context, int index) {  

           return const Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
             child: Divider(
                 height: 2,
                 color: Color(0xff171717),
             )
           );     
          
        },)
      )
    );
  }
}