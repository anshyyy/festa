import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/starter/starter_cubit.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/gradient_button.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StarterCubit(StarterState.initial()),
      child: const StartScreenConsumer(),
    );
  }
}

class StartScreenConsumer extends StatelessWidget {
  const StartScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StarterCubit, StarterState>(
      listener: (context, state) {
        if (state.isOnboardingComplete) {
          navigator<NavigationService>().navigateTo(
            AuthRoutes.authRoute,
            isClearStack: true,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      AssetConstants.festaIconPng,
                    ),
                    // child: SvgPicture.asset(
                    //   AssetConstants.festaIconSvg,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 21),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          TermsAndConditionConstants.privacyMessage,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w100,
                                  ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GradientButton(
                            text: 'Continue',
                            width: 1.w,
                            height: 9.h,
                            onTap: () {
                              context.read<StarterCubit>().completeOnboarding();
                            },
                            gradientColor1:
                                Theme.of(context).colorScheme.primary,
                            gradientColor2:
                                Theme.of(context).colorScheme.secondary)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
