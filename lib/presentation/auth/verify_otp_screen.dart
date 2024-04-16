import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../application/auth/verify_otp/verify_otp_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/services/storage_service/dynamic_link_storage_service.dart';
import '../../domain/core/utils/dynamic_link.dart';
import '../../infrastructure/core/enum/profile_state.enum.dart';
import '../widgets/rounded_arrow_button.dart';
import '../widgets/snackbar_alert.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String verificationCode;
  final String dialCode;
  final String phoneNumber;
  const VerifyOtpScreen({
    super.key,
    required this.verificationCode,
    required this.dialCode,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => VerifyOtpCubit(VerifyOtpState.initial(
        dialCode: dialCode,
        phoneNumber: phoneNumber,
        verificationCode: verificationCode,
        apiBaseUrl: appConfig.serverUrl,
      )),
      child: const VerifyOtpScreenConsumer(),
    );
  }
}

class VerifyOtpScreenConsumer extends StatelessWidget {
  const VerifyOtpScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state.backToAuth) {
          navigator<NavigationService>().goBack();
          context.read<VerifyOtpCubit>().emitFromAnywhere(
                state: state.copyWith(backToAuth: false),
              );
        }
        // verify otp -> result - success
        if (state.isOTPVerificationSuccessful &&
            !state.isOTPVerificationFailed) {
          // nav to home
          final user = state.user!;
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateAfterAuthChange(
            isAuthorized: true,
            user: state.user,
          );

          DynamicLinkStorageService.getStoredDynamicLink().then((value) {
            try {
              Map pathSegments = value ?? {};

              final profileState = user.fullName.isNotEmpty &&
                      user.dob.isNotEmpty &&
                      user.gender.isNotEmpty &&
                      user.tag != null
                  ? ProfileStateEnum.completed
                  : user.fullName.isNotEmpty &&
                          user.dob.isNotEmpty &&
                          user.gender.isNotEmpty
                      ? ProfileStateEnum.gender
                      : user.fullName.isNotEmpty && user.dob.isNotEmpty
                          ? ProfileStateEnum.birthday
                          : user.fullName.isNotEmpty
                              ? ProfileStateEnum.basic
                              : ProfileStateEnum.started;

              final route = profileState == ProfileStateEnum.completed
                  ? value != null
                      ? DynamicLinkUtil.getDynamicRoute(
                          pathSegments['category']!, pathSegments['id']!)
                      : UserRoutes.mainNavRoute
                  : profileState == ProfileStateEnum.gender
                      ? AuthRoutes.usernameRoute
                      : profileState == ProfileStateEnum.birthday
                          ? AuthRoutes.genderRoute
                          : profileState == ProfileStateEnum.basic
                              ? AuthRoutes.birthdayRoute
                              : AuthRoutes.basicInfoRoute;

              Future.delayed(const Duration(milliseconds: 100))
                  .then((value) async {
                    
                 navigator<NavigationService>()
                    .navigateTo(route, isClearStack: true, queryParams: {
                  'id': pathSegments['id'] ?? '0',
                });
              });
            } catch (e) {
              print(e);
            }
          });
          context.read<VerifyOtpCubit>().emitFromAnywhere(
                state: state.copyWith(isOTPVerificationSuccessful: false),
              );
        }

        // verify otp -> result - failed
        if (!state.isOTPVerificationSuccessful &&
            state.isOTPVerificationFailed) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );
          context.read<VerifyOtpCubit>().emitFromAnywhere(
                state: state.copyWith(isOTPVerificationFailed: false),
              );
        }

        // send otp -> result - success
        if (state.isOTPSentSuccessful && !state.isOTPSentFailed) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );
          context.read<VerifyOtpCubit>().emitFromAnywhere(
                state: state.copyWith(isOTPSentSuccessful: false),
              );
        }

        // send otp -> result - failed
        if (!state.isOTPSentSuccessful && state.isOTPSentFailed) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );
          context.read<VerifyOtpCubit>().emitFromAnywhere(
                state: state.copyWith(isOTPSentFailed: false),
              );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // SizedBox(
              //   height: 50.h,
              //   width: 100.w,
              //   child: Image.asset(
              //     AssetConstants.scaffoldBcg,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        LoginScreenConstants.verifyNumberHeader,
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: themeData.colorScheme.background,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '${LoginScreenConstants.verifyNumberDescription} ${state.dialCode} ${state.phoneNumber}',
                            style: themeData.textTheme.bodySmall!.copyWith(),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<VerifyOtpCubit>().onGoBack();
                            },
                            child: SvgPicture.asset(
                              AssetConstants.editIcon,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PinCodeTextField(
                        controller: state.otpController,
                        appContext: context,
                        length: 6,
                        showCursor: false,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        enableActiveFill: true,
                        enablePinAutofill: false,
                        hintCharacter: '-',
                        keyboardType: TextInputType.number,
                        hintStyle: themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: themeData.colorScheme.background,
                        ),
                        textStyle: themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: themeData.scaffoldBackgroundColor,
                        ),
                        pinTheme: PinTheme(
                            inactiveColor:
                                themeData.colorScheme.primaryContainer,
                            borderWidth: 0,
                            inactiveBorderWidth: 0,
                            activeBorderWidth: 0,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(40),
                            fieldHeight: 8.h,
                            fieldWidth: 13.5.w,
                            selectedFillColor:
                                themeData.colorScheme.primaryContainer,
                            inactiveFillColor:
                                themeData.colorScheme.primaryContainer,
                            activeFillColor: themeData.colorScheme.background,
                            selectedBorderWidth: 0.6,
                            selectedColor: themeData.colorScheme.primary),
                        onChanged: (value) {
                          context.read<VerifyOtpCubit>().onOtpChange();
                        },
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      state.showResendButton
                          ? InkWell(
                              onTap: () {
                                context.read<VerifyOtpCubit>().resendOtp();
                              },
                              child: Text(
                                LoginScreenConstants.resendNow,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            )
                          : Countdown(
                              seconds: AppConstants.otpTimer,
                              build: (_, double time) {
                                return Text(
                                  '${LoginScreenConstants.resendAfter}${time.toInt()}${AppConstants.seconds}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        decorationColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                );
                              },
                              interval: const Duration(seconds: 1),
                              onFinished: () {
                                context
                                    .read<VerifyOtpCubit>()
                                    .coundownFinished();
                              },
                            ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : RoundedArrowButton(
                                height: 6.h,
                                width: 6.h,
                                contentIcon: AssetConstants.longArrowRight,
                                isEnabled: state.isVerifyEnabled,
                                onTap: () {
                                  // if (!state.isLoginEnabled) {
                                  context.read<VerifyOtpCubit>().verifyOtp();
                                  // }
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
