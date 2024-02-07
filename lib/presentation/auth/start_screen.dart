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
          body: SafeArea(
            top: false,
            child: SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Column(
                      children: [
                        const Expanded(flex: 5, child: SizedBox()),
                        Image.asset(
                          AssetConstants.festaIconPng,
                          width: 75.w,
                        ),
                        const Expanded(flex: 6, child: SizedBox()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 21),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${TermsAndConditionConstants.privacyMessage} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 13.sp),
                              ),
                              TextSpan(
                                text: TermsAndConditionConstants.termsText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                              ),
                              TextSpan(
                                text: ' ${AppConstants.andText} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 13.7.sp),
                              ),
                              TextSpan(
                                text: TermsAndConditionConstants.privacyText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 13.7.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                              ),
                               TextSpan(
                                text: '.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 13.7.sp),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GradientButton(
                          text: AppConstants.continueText,
                          width: 1.w,
                          height: 9.h,
                          onTap: () {
                            context.read<StarterCubit>().completeOnboarding();
                          },
                        )
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
