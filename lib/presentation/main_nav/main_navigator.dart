import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../application/home/cubit/home_cubit.dart';
import '../../application/main_nav/main_nav_cubit.dart';
import '../../application/ticket/ticket_cubit.dart';
import '../../application/user/user_profile/user_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../home/home_screen.dart';
import '../ticket/tickets_screen.dart';
import '../user/user_profile_screen.dart';
import 'bottom_nav.dart';

class MainNavigator extends StatelessWidget {
  final String routeIndex;
  const MainNavigator({super.key, required this.routeIndex});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainNavCubit(
              MainNavState.initial(currentIndex: int.parse(routeIndex))),
          child: const MainNavigatorConsumer(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HomeCubit(HomeState.initial(
            appStateNotifier: appStateNotifier,
            serverUrl: appConfig.serverUrl,
            mapsApiKey: appConfig.googleMapsApiKey,
          ))
            ..init(),
          child: const HomeScreenConsumer(),
        ),
        BlocProvider(
          create: (context) => TicketCubit(TicketState.initial(
            serverUrl: appConfig.serverUrl,
          ))
            ..init(),
          child: const TicketScreenConsumer(),
        ),
        BlocProvider(
          create: (context) => UserProfileCubit(UserProfileState.initial(
            serverUrl: appConfig.serverUrl,
            appStateNotifier: appStateNotifier,
          ))
            ..init(),
          child: const UserProfileScreenConsumer(),
        )
      ],
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return  const MainNavigatorConsumer();
        },
      ),
    );

    // return BlocProvider(
    //   create: (context) => MainNavCubit(
    //       MainNavState.initial(currentIndex: int.parse(routeIndex))),
    //   child: const MainNavigatorConsumer(),
    // );
  }
}

class MainNavigatorConsumer extends StatelessWidget {

  const MainNavigatorConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainNavCubit, MainNavState>(
      listener: (context, state) {},
      builder: (context, state) {
        final userProfileState = context.watch<UserProfileCubit>().state;
       // print(userProfileState.user);
        return ModalProgressHUD(
          inAsyncCall: state.isTabLoading,
          blur: 0,
          progressIndicator: Container(
            color: Colors.red,
          ),
          child: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              isEmailNotProvided :  !userProfileState.isLoading && userProfileState.user?.email  == null,
              currentIndex: state.currentIndex,
              onTabChange: (i) async {
                if (state.currentIndex == i) {
                  if (i == 0) {
                    // go to top
                    Provider.of<AppStateNotifier>(context, listen: false)
                        .onMenuChange(index: i, goToTop: true);
                  }
                } else {
                  context.read<MainNavCubit>().onIndexChange(index: i);
                  Provider.of<AppStateNotifier>(context, listen: false)
                      .onMenuChange(index: i);
                }

                Future.delayed(const Duration(milliseconds: 400)).then((value) {
                  FocusScope.of(context).unfocus();
                });
              },
            ),
            body: AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              child: state.currentIndex == 0
                  ? const HomeScreen()
                  : state.currentIndex == 2
                      ? const TicketScreen()
                      : state.currentIndex == 3
                          ? const UserProfileScreen()
                          : null,
            ),
          ),
        );
      },
    );
  }
}
