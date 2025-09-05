import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../infrastructure/event/dtos/pub/pub_dto.dart';
import 'widget/club_card.dart';

class ClubTabScreen extends StatelessWidget {
  final List<PubDto> clubs;

  const ClubTabScreen({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: clubs.isEmpty
            ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(Icons.sentiment_dissatisfied,
                        size: 80.px, color: Colors.grey),
                    SizedBox(height: 1.5.h),
                    const Text(
                      'No Clubs Found!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  return ClubCard(
                    club: clubs[index],
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
