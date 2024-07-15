import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../infrastructure/event/dtos/artist/artist_dto.dart';
import 'widgets/artist_card.dart';

class ArtistTabScreen extends StatelessWidget {
  final List<ArtistDto> artists;
  const ArtistTabScreen({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: artists.isEmpty
            ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_dissatisfied,
                        size: 80.px, color: Colors.grey),
                    SizedBox(height: 1.5.h),
                    const Text(
                      'No Artists Found!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return ArtistCard(
                    id:artists[index].id,
                    profileImage: artists[index].profileImage,
                    fullName: artists[index].fullName,
                    email: artists[index].email ?? "null",
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        height: 2,
                        color: Color(0xff171717),
                      ));
                },
              ));
  }
}
