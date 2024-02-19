import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/auth/auth_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => AuthCubit(
        AuthState.initial(
          apiBaseUrl: appConfig.serverUrl,
        ),
      ),
      child: const AuthScreenConsumer(),
    );
  }
}

class AuthScreenConsumer extends StatelessWidget {
  const AuthScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                AssetConstants.festaIconPng,
                width: 25.w,
                // height: 100,
              ),
              const SizedBox(
                height: 155,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Platform.isIOS ? AuthOptionTile(
                      authServiceMessage: LoginScreenConstants.appleContinue,
                      authServiceIcon: AssetConstants.appleIcon,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {},
                    ) : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthOptionTile(
                      authServiceMessage: LoginScreenConstants.googleContinue,
                      authServiceIcon: AssetConstants.googleIcon,
                      onTap: () {
                        context.read<AuthCubit>().loginWithGoogle();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthOptionTile(
                      authServiceMessage:
                          LoginScreenConstants.phoneNumberContinue,
                      authServiceIcon: '',
                      color: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {
                        navigator<NavigationService>().navigateTo(
                            AuthRoutes.loginWithPhoneRoute,
                            isClearStack: true);
                      },
                    ),
SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      TermsAndConditionConstants.authTermsAcceptMessage,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AuthOptionTile extends StatelessWidget {
  final String authServiceMessage;
  final String authServiceIcon;
  final Color? color;
  final Function()? onTap;
  const AuthOptionTile(
      {super.key,
      required this.authServiceMessage,
      required this.authServiceIcon,
      this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 17.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            authServiceIcon == ''
                ? const SizedBox()
                : SvgPicture.asset(
                    authServiceIcon,
                    color: color,
                    width: 22,
                    height: 24,
                  ),
            authServiceIcon == ''
                ? const SizedBox()
                : const SizedBox(
                    width: 18,
                  ),
            Text(
              authServiceMessage,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
