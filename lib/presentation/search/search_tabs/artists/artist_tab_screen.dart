import 'package:flutter/material.dart';

import 'widgets/artist_card.dart';

class ArtistTabScreen extends StatelessWidget {
  const ArtistTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
          return const ArtistCard();
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