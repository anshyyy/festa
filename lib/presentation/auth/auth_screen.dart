import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:sizer/sizer.dart';

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
        if (state.loginWithPhone) {
          navigator<NavigationService>()
              .navigateTo(AuthRoutes.loginWithPhoneRoute);
        }
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
                width: 110,
                // height: 100,
              ),
              const SizedBox(
                height: 155,
              ),
              Container(
                child: Column(
                  children: [
                    AuthOptionTile(
                      authServiceMessage: 'Continue with Apple',
                      authServiceIcon: AssetConstants.appleIcon,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {},
                    ),
                    AuthOptionTile(
                      authServiceMessage: 'Continue with Goole',
                      authServiceIcon: AssetConstants.googleIcon,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {},
                    ),
                    AuthOptionTile(
                      authServiceMessage: 'Use mobile number',
                      authServiceIcon: '',
                      color: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {
                        context.read<AuthCubit>().loginWithPhone();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  TermsAndConditionConstants.authTermsAcceptMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              )
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
        height: 70,
        // width: 100,
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
