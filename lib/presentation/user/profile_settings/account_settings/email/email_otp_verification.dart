import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../../application/user/email/otp_verification/otp_verification_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/snackbar_alert.dart';

class EmailOtpVerification extends StatelessWidget {
  final String emailAddress;
  const EmailOtpVerification({super.key, required this.emailAddress});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) =>
          EmailOtpVerificationCubit(OtpVerificationState.initial(
        emailAddress: emailAddress,
        serverUrl: appConfig.serverUrl,
      )),
      child: const EmailOtpVerificationScreen(),
    );
  }
}

class EmailOtpVerificationScreen extends StatelessWidget {
  const EmailOtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<EmailOtpVerificationCubit, OtpVerificationState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.isOTPVerificationSuccessful &&
            !state.isOTPVerificationFailed) {
          navigator<NavigationService>()
              .navigateTo(UserRoutes.emailDetailsScreenRoute,
                  queryParams: {
                    'emailAddress': state.emailAddress,
                  },
                  isClearStack: true);
        }

        if (!state.isOTPVerificationSuccessful &&
            state.isOTPVerificationFailed) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: 'Otp Verification Failed',
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            appBar: CustomAppBar(
              title: AccountEmailScreenConstants.title,
              leading: GestureDetector(
                onTap: () {
                  navigator<NavigationService>().goBack();
                },
                child: Center(
                  child: SvgPicture.asset(AssetConstants.arrowLeft),
                ),
              ),
              actions: const [],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    AccountEmailScreenConstants.otpSent + state.emailAddress,
                    style: textTheme.bodyMedium!.copyWith(fontSize: 16.5.sp),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  GestureDetector(
                    onTap: () => navigator<NavigationService>().goBack(),
                    child: Text(
                      AccountEmailScreenConstants.changeEmail,
                      style: textTheme.bodySmall!.copyWith(
                        color: colorScheme.background,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: state.otpController,
                    isFill: true,
                    fillColor: colorScheme.surface,
                    keyboardType: TextInputType.number,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    hintText: AccountEmailScreenConstants.enterOtp,
                    hintTextStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.background.withOpacity(.5)),
                    textStyle: textTheme.bodyMedium!
                        .copyWith(color: colorScheme.background),
                    errorStyle: textTheme.bodySmall!.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  state.showResendOtp
                      ? InkWell(
                          onTap: () {
                            context
                                .read<EmailOtpVerificationCubit>()
                                .resendOtpToEmail();
                          },
                          child: Text(
                            LoginScreenConstants.resendNow,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).colorScheme.background,
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
                                .read<EmailOtpVerificationCubit>()
                                .coundownFinished();
                          },
                        ),
                  const Spacer(),
                  GradientButton(
                    text: AccountEmailScreenConstants.submit,
                    onTap: () {
                      context.read<EmailOtpVerificationCubit>().verifyOtp();
                    },
                    height: 5.h,
                    // isEnabled: state.emailTextController.text.isNotEmpty && !state.hasValidationError,
                    textStyle: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
