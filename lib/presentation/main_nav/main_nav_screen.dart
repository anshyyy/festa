// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import '../../domain/core/configs/app_config.dart';

// import '../../domain/core/constants/asset_constants.dart';

// import '../../domain/core/helpers/generic_helpers.dart';

// import '../home/home_screen.dart';

// class MainNavScreen extends StatelessWidget {
//   final int tabIndex;
//   const MainNavScreen({Key? key, this.tabIndex = 0}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AppStateNotifier appStateNotifier =
//         Provider.of<AppStateNotifier>(context);
//     return BlocProvider(
//       create: (context) => MainNavBloc(MainNavState.initial(
//           tabIndex: tabIndex, appStateNotifier: appStateNotifier))
//         ..add(const MainNavEvent.init()),
//       child: const MainNavScreenConsumer(),
//     );
//   }
// }

// class MainNavScreenConsumer extends StatelessWidget {
//   const MainNavScreenConsumer({Key? key}) : super(key: key);
//   List<PersistentBottomNavBarItem> _navBarsItems(
//       BuildContext context, List<GlobalKey> keys) {
//     return [
//       PersistentBottomNavBarItem(
//         icon: CustomNavBarItem(
//           key: keys[0],
//           icon: AssetConstants.homeActive,
//           title: MainNavScreenConstants.home,
//           isActive: true,
//         ),
//         inactiveIcon: CustomNavBarItem(
//           icon: AssetConstants.homeInactive,
//           title: MainNavScreenConstants.home,
//         ),
//         activeColorPrimary: Theme.of(context).colorScheme.primary,
//         inactiveColorPrimary: Theme.of(context).colorScheme.secondaryContainer,
//       ),
//       PersistentBottomNavBarItem(
//         icon: CustomNavBarItem(
//           key: keys[1],
//           icon: AssetConstants.searchActive,
//           title: MainNavScreenConstants.search,
//           isActive: true,
//         ),
//         inactiveIcon: CustomNavBarItem(
//           icon: AssetConstants.searchInactive,
//           title: MainNavScreenConstants.search,
//         ),
//         activeColorPrimary: Theme.of(context).colorScheme.primary,
//         inactiveColorPrimary: Theme.of(context).colorScheme.secondaryContainer,
//       ),
//       PersistentBottomNavBarItem(
//         icon: CustomNavBarItem(
//           icon: AssetConstants.noteActive,
//           title: MainNavScreenConstants.yourTests,
//           isActive: true,
//         ),
//         inactiveIcon: CustomNavBarItem(
//           icon: AssetConstants.noteInactive,
//           title: MainNavScreenConstants.yourTests,
//         ),
//         activeColorPrimary: Theme.of(context).colorScheme.primary,
//         inactiveColorPrimary: Theme.of(context).colorScheme.secondaryContainer,
//       ),
//       PersistentBottomNavBarItem(
//         icon: CustomNavBarItem(
//           icon: AssetConstants.profileActive,
//           title: MainNavScreenConstants.profile,
//           isActive: true,
//         ),
//         inactiveIcon: CustomNavBarItem(
//           icon: AssetConstants.profileInactive,
//           title: MainNavScreenConstants.profile,
//         ),
//         activeColorPrimary: Theme.of(context).colorScheme.primary,
//         inactiveColorPrimary: Theme.of(context).colorScheme.secondaryContainer,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final displayWidth = MediaQuery.of(context).size.width;
//     final AppStateNotifier appStateNotifier =
//         Provider.of<AppStateNotifier>(context, listen: false);
//     return BlocConsumer<MainNavBloc, MainNavState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         List<Widget> buildScreens() {
//           return [
//             HomeScreen(
//               goToSearch: () {
//                 state.persistentTabController.jumpToTab(1);
//               },
//             ),
//             const SearchScreen(),
//             const ProfileScreen(),
//           ];
//         }

//         return PersistentTabView(
//           context,
//           navBarHeight:
//               GenericHelpers.getNavbarHeight(width: displayWidth.round()),
//           padding: const NavBarPadding.only(top: 0, left: 0, right: 0),
//           screens: buildScreens(),
//           items: _navBarsItems(context, state.keys),
//           controller:
//               Provider.of<AppStateNotifier>(context).persistentTabController,
//           hideNavigationBar:
//               Provider.of<AppStateNotifier>(context).showcaseCount == 2,
//           margin: Provider.of<AppStateNotifier>(context).showcaseCount == 2
//               ? EdgeInsets.only(bottom: 0.5.h)
//               : const EdgeInsets.only(bottom: 0),
//           confineInSafeArea: true,
//           backgroundColor: Colors.white,
//           handleAndroidBackButtonPress: true,
//           resizeToAvoidBottomInset: true,
//           selectedTabScreenContext: (p0) {},
//           onItemSelected: (index) {
//             appStateNotifier.changePage(currentPage: index);
//           },
//           decoration: const NavBarDecoration(
//               border:
//                   Border.fromBorderSide(BorderSide(color: Color(0xFFDDE0E6)))),
//           hideNavigationBarWhenKeyboardShows: true,
//           popAllScreensOnTapOfSelectedTab: true,
//           popActionScreens: PopActionScreensType.all,
//           itemAnimationProperties: const ItemAnimationProperties(
//             duration: Duration(milliseconds: 200),
//             curve: Curves.ease,
//           ),
//           screenTransitionAnimation: const ScreenTransitionAnimation(
//             // Screen transition animation on change of selected tab.
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarStyle: NavBarStyle.style3,
//         );
//       },
//     );
//   }
// }

// class CustomNavBarItem extends StatelessWidget {
//   final String icon;
//   final String title;
//   final bool isActive;
//   const CustomNavBarItem({
//     Key? key,
//     required this.icon,
//     required this.title,
//     this.isActive = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SvgPicture.asset(icon),
//         SizedBox(
//           height: 1.h,
//         ),
//         Text(
//           title,
//           style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                 fontSize: 14.2.sp,
//                 color: isActive
//                     ? Theme.of(context).colorScheme.primaryContainer
//                     : Theme.of(context).colorScheme.onSecondary,
//                 fontWeight: FontWeight.w600,
//               ),
//         )
//       ],
//     );
//   }
// }
