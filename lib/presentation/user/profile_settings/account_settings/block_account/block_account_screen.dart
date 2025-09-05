import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/account_settings_cubit/account_settings_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../../../infrastructure/event/dtos/artist/artist_dto.dart';
import '../../../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../../../widgets/custom_appbar.dart';
import 'widget/block_tile.dart';

class UnblockAccountScreen extends StatelessWidget {
  const UnblockAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
        create: (context) => AccountSettingsCubit(AccountSettingsState.initial(
            serverUrl: appConfig.serverUrl, userId: 1))
          ..fetchBlockedUsers(),
        child: BlocConsumer<AccountSettingsCubit, AccountSettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state.isLoading,
                child: Scaffold(
                  appBar: CustomAppBar(
                    actions: [],
                    leading: GestureDetector(
                      onTap: () {
                        navigator<NavigationService>().goBack();
                      },
                      child: Center(
                          child: SvgPicture.asset(
                        AssetConstants.arrowLeft,
                        width: 7.w,
                      )),
                    ),
                    title: AccountSettingScreenConstants.block,
                  ),
                  body: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Theme.of(context).colorScheme.background,
                          unselectedLabelColor: Colors.grey.shade600,
                          unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15.sp),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.sp),
                          indicatorColor: Theme.of(context).colorScheme.primary,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          tabs: const [
                            Tab(text: 'Users'),
                            Tab(text: 'Pubs'),
                          //  Tab(text: 'Artists'),
                            Tab(text: 'Events'),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Expanded(
                          child: TabBarView(
                            children: [
                              BlockedUsersTab(
                                users: state.blockedUsers?.users ?? [],
                              ),
                              BlockedPubsTab(
                                pubs: state.blockedUsers?.pubs ?? [],
                              ),
                              // BlocedArtistsTab(
                              //   artists: state.blockedUsers?.artists ?? [],
                              // ),
                              BlockedEventsTab(
                                events: state.blockedUsers?.events ?? [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}

class BlocedArtistsTab extends StatelessWidget {
  final List<ArtistDto> artists;
  const BlocedArtistsTab({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return 
    
    artists.isEmpty
        ? const Center(child: Text('No Blocked Artists'))
        : ListView.builder(
            itemCount: artists.length,
            itemBuilder: (context, index) {
              return BlockTile(
                  name: artists[index].fullName,
                  profileImage: artists[index].profileImage,
                  tag: artists[index].tag?.tag ?? '',
                  onTap: () {
                    _showUnblockConfirmationDialog(context, artists[index].fullName, () {
                      context.read<AccountSettingsCubit>().unblockUser(id: artists[index].id, type: 'artist');
                    });
                  });
            },
          );
  }
}

class BlockedUsersTab extends StatelessWidget {
  final List<UserDto> users;
  const BlockedUsersTab({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return users.isEmpty
        ? const Center(child: Text('No Blocked Users'))
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return BlockTile(
                  name: users[index].fullName,
                  profileImage: users[index].profileImage,
                  tag: users[index].tag?.tag ?? '',
                  onTap: () {
                    _showUnblockConfirmationDialog(context, users[index].fullName, () {
                      context.read<AccountSettingsCubit>().unblockUser(id: users[index].id, type: 'user');
                    });
                  });
            },
          );
  }
}

class BlockedPubsTab extends StatelessWidget {
  final List<PubDto> pubs;
  const BlockedPubsTab({super.key, required this.pubs});

  @override
  Widget build(BuildContext context) {
    return pubs.isEmpty
        ? const Center(child: Text('No Blocked Pubs'))
        : ListView.builder(
            itemCount: pubs.length,
            itemBuilder: (context, index) {
              return BlockTile(
                  name: pubs[index].fullName,
                  profileImage: pubs[index].logo,
                  tag: pubs[index].tag?.tag ?? '',
                  onTap: () {
                    _showUnblockConfirmationDialog(context, pubs[index].fullName, () {
                      context.read<AccountSettingsCubit>().unblockUser(id: pubs[index].id, type: 'pub');
                    });
                  });
            },
          );
  }
}

class BlockedEventsTab extends StatelessWidget {
  final List<EventDto> events;
  const BlockedEventsTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return events.isEmpty ? const Center(child: Text('No Blocked Events')) :
    ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return BlockTile(name: events[index].name, profileImage: events[index].coverImage, tag: events[index].description ?? '', onTap: (){
          _showUnblockConfirmationDialog(context, events[index].name, () {
            context.read<AccountSettingsCubit>().unblockUser(id: events[index].id, type: 'event');
          });
        });
      },
    );
  }
}


void _showUnblockConfirmationDialog(BuildContext context, String name, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Unblock',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary),),
        content: Text('Are you sure you want to unblock $name?',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color:Colors.white),),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color:Colors.grey.shade400),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Unblock',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,color:Theme.of(context).colorScheme.primary),),
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
