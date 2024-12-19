import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/event/dtos/artist/artist_dto.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/dtos/pub/pub_dto.dart';
import 'artists/artist_tab_screen.dart';
import 'clubs/club_tab_screen.dart';
import 'event/event_screen.dart';
import 'location/location_tab_screen.dart';
import 'users/user_tab_screen.dart';

class SearchesTabs extends StatefulWidget {
  final List<EventDto> events;
  final List<PubDto> clubs;
  final List<UserDto> users;
  final List<ArtistDto> artists;

  const SearchesTabs({
    super.key,
    required this.events,
    required this.clubs,
    required this.users,
    required this.artists,
  });

  @override
  _SearchesTabsState createState() => _SearchesTabsState();
}

class _SearchesTabsState extends State<SearchesTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndSetInitialTab();
    });
  }

  void _checkAndSetInitialTab() {
    if (widget.events.isNotEmpty) {
      _tabController.animateTo(0);
    } else if (widget.clubs.isNotEmpty) {
      _tabController.animateTo(1);
    } else if (widget.users.isNotEmpty) {
      _tabController.animateTo(2);
    } else if (widget.artists.isNotEmpty) {
      _tabController.animateTo(3);
    }
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
          tabs: const [
            Tab(text: 'Events'),
            Tab(text: 'Clubs'),
            Tab(text: 'Users'),
            Tab(text: 'Artists'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              EventScreenTab(events: widget.events),
              ClubTabScreen(clubs: widget.clubs),
              UserTabScreen(users: widget.users),
              ArtistTabScreen(artists: widget.artists),
            ],
          ),
        ),
      ],
    );
  }
}
