import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../application/club_profile/events_calendar/events_calendar_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/menu/menu_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class ClubMenuScreen extends StatelessWidget {
  final int clubId;
  const ClubMenuScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => EventsCalendarCubit(
        EventsCalendarState.initial(
          clubId: clubId,
          serverUrl: appConfig.serverUrl,
        ),
      )..init(),
      child: const ClubMenuConsumer(),
    );
  }
}

class ClubMenuConsumer extends StatefulWidget {
  const ClubMenuConsumer({super.key});

  @override
  State<ClubMenuConsumer> createState() => _ClubMenuConsumerState();
}

class _ClubMenuConsumerState extends State<ClubMenuConsumer> {
  int _selectedIndex = 0;
  late PageController _foodPageController;
  late PageController _barPageController;
  int _currentFoodPage = 0;
  int _currentBarPage = 0;

  @override
  void initState() {
    super.initState();
    _foodPageController = PageController();
    _barPageController = PageController();
  }

  @override
  void dispose() {
    _foodPageController.dispose();
    _barPageController.dispose();
    super.dispose();
  }

  Widget _buildMenuPage(
      List<MenuDto> images, PageController pageController, int currentPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 2.h),
        images.isEmpty
            ? const Center(
                child: Text("No Menu Available"),
              )
            : SizedBox(
                height: 60.h,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification) {
                      // If we're at the last page of the food menu and swiped right
                      if (_selectedIndex == 0 &&
                          _foodPageController.page == images.length - 1) {
                        double pixels = _foodPageController.position.pixels;
                        double maxScrollExtent =
                            _foodPageController.position.maxScrollExtent;

                        if (pixels >= maxScrollExtent) {
                          // The user swiped past the last page
                          // setState(() {
                          //   _selectedIndex = 1;
                          // });
                          // _barPageController.jumpToPage(0);
                          // Jump to the first bar menu page
                        }
                      }
                    }
                    return false;
                  },
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        if (pageController == _foodPageController) {
                          _currentFoodPage = index;
                        } else {
                          _currentBarPage = index;
                        }
                      });

                      context
                          .read<ClubProfileCubit>()
                          .onCarouselChange(index: index);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        child: PhotoView(
                          imageProvider: CachedNetworkImageProvider(
                            CustomImageProvider.getImageUrl(
                                images[index].url, ImageType.other),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                images.length,
                (dotIndex) => Padding(
                  padding: EdgeInsets.all(.3.w),
                  child: Container(
                    height: 1.5.h,
                    width: 1.3.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dotIndex == currentPage
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // String _getCurrentPageLabel() {
  //   if (_selectedIndex == 0) {
  //     return '${_currentFoodPage + 1}/${widget.foodMenuImages.length}';
  //   } else {
  //     return '${_currentBarPage + 1}/${widget.barMenuImages.length}';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                _buildMenuPage(state.pub!.foodMenu ?? [], _foodPageController,
                    _currentFoodPage),
                _buildMenuPage(state.pub!.barMenu ?? [], _barPageController,
                    _currentBarPage),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.restaurant_menu),
                  label:
                      'Food Menu ${state.pub?.foodMenu?.isEmpty ?? true ? '' : '(${_currentFoodPage + 1}/${state.pub?.foodMenu?.length ?? 0})'}',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.local_bar),
                  label:
                      'Bar Menu ${state.pub?.barMenu?.isEmpty ?? true ? '' : '(${_currentBarPage + 1}/${state.pub?.barMenu?.length ?? 0})'}',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
