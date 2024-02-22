import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/main_nav/main_nav_cubit.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../home/home_screen.dart';
import '../user/profile_and_settings.dart';
import 'bottom_nav.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavCubit(MainNavState.initial(currentIndex: 0)),
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
    return BlocConsumer<MainNavCubit, MainNavState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const CustomBottomNav(),
          body: state.currentIndex == 0
              ? const HomeScreen()
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
