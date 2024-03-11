import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

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
          // navigator<NavigationService>().navigateTo(
          //   AuthRoutes.authRoute,
          // );

          navigator<NavigationService>().navigateTo(
            AuthRoutes.loginWithPhoneRoute,
          );

          context.read<StarterCubit>().emitFromAnywhere(
                  state: state.copyWith(
                isOnboardingComplete: false,
              ));
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      '${TermsAndConditionConstants.privacyMessage} ',
                                  style:
                                      Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.sp,)),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launchUrl(Uri.parse(
                                        'https://www.festa.world/terms'));
                                  },
                                text: TermsAndConditionConstants.termsText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                              ),
                              TextSpan(
                                  text: ' ${AppConstants.andText} ',
                                  style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(fontSize: 14.sp),
                                  ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launchUrl(Uri.parse(
                                        'https://www.festa.world/privacy'));
                                  },
                                text: TermsAndConditionConstants.privacyText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 14.sp,
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
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: 14.h,
                        color: Theme.of(context).colorScheme.surface,
                        padding: EdgeInsets.only(bottom: 5.h, top: 3.h, left: 6.w, right: 6.w),
                        child: GradientButton(
                          // height:6.h,
                          text: AppConstants.continueText,
                          onTap: () {
                            context.read<StarterCubit>().completeOnboarding();
                          },
                        ),
                      )
                    ],
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
