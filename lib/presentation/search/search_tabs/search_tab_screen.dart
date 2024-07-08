import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'artists/artist_tab_screen.dart';
import 'clubs/club_tab_screen.dart';
import 'event/event_screen.dart';
import 'location/location_tab_screen.dart';
import 'users/user_tab_screen.dart';

class SearchesTabs extends StatefulWidget {
  @override
  _SearchesTabsState createState() => _SearchesTabsState();
}

class _SearchesTabsState extends State<SearchesTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerColor: const Color(0xff171717),
           indicatorColor: Colors.white, 
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
           labelStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400), 
          controller: _tabController,
          labelPadding: EdgeInsets.symmetric(horizontal: 7.0.sp),
          tabs:  const [
            Tab(text: 'Events',),
            Tab(text: 'Clubs'),
            Tab(text: 'Users'),
           //Tab(text: 'Locations'),
            Tab(text: 'Artists'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              EventScreenTab(),
              ClubTabScreen(),
              UserTabScreen(),
             // LocationTabScreen(),
              ArtistTabScreen(),
            ],
          ),
        ),
      ],
    );
  }
}