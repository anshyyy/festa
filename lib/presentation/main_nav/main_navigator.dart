import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../application/main_nav/main_nav_cubit.dart';
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
    return BlocProvider(
      create: (context) => MainNavCubit(
          MainNavState.initial(currentIndex: int.parse(routeIndex))),
      child: const MainNavigatorConsumer(),
    );
  }
}

class MainNavigatorConsumer extends StatelessWidget {
  const MainNavigatorConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocConsumer<MainNavCubit, MainNavState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isTabLoading,
          blur: 0,
          progressIndicator: Container(
            color: Colors.red,
          ),
          child: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: state.currentIndex,
              onTabChange: (i) {
                if (state.currentIndex == i) {
                  if (i == 0) {}
                } else {
                  context.read<MainNavCubit>().onIndexChange(index: i);
                }
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
                          ? UserProfileScreen(
                              userId: appStateNotifier.user!.id,
                            )
                          : null,
            ),
          ),
        );
      },
    );
  }
}
