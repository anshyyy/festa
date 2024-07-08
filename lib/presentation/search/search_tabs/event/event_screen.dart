import 'package:flutter/material.dart';

import 'widget/event_card.dart';

class EventScreenTab extends StatefulWidget {
  const EventScreenTab({super.key});

  @override
  State<EventScreenTab> createState() => _EventScreenTabState();
}

class _EventScreenTabState extends State<EventScreenTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
          return const EventCard();
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