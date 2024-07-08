import 'package:flutter/material.dart';

import 'widget/club_card.dart';

class ClubTabScreen extends StatelessWidget {
  const ClubTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
          return const ClubCard();
        }, separatorBuilder: (BuildContext context, int index) {  

           return const Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
             child: Divider(
                 height: 2,
                 color: Color(0xff171717),
             )
           );     
          
        },)
      );
  }
}