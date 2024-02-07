import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/auth/verify_otp/verify_otp_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../widgets/rounded_arrow_button.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String verificationCode;
  final String otpCode;
  const VerifyOtpScreen(
      {super.key, required this.verificationCode, required this.otpCode});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => VerifyOtpCubit(VerifyOtpState.initial(
        verificationCode: verificationCode,
        otpCode: otpCode,
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

    return BlocConsumer<VerifyOtpCubit,VerifyOtpState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Padding(
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
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: themeData.colorScheme.background,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  LoginScreenConstants.verifyNumberDescription,
                  style: themeData.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 5.h,
                ),
                PinCodeTextField(
                  // controller: state.otpController,
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
                    fontSize: 28.sp,
                    color: themeData.colorScheme.background,
                  ),
                  textStyle: themeData.textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: themeData.scaffoldBackgroundColor,
                  ),
                  pinTheme: PinTheme(
                    inactiveColor: themeData.colorScheme.primaryContainer,
                    borderWidth: 0,
                    inactiveBorderWidth: 0,
                    activeBorderWidth: 0,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(40),
                    fieldHeight: 7.5.h,
                    fieldWidth: 13.w,
                    selectedFillColor: themeData.colorScheme.primaryContainer,
                    inactiveFillColor: themeData.colorScheme.primaryContainer,
                    activeFillColor: themeData.colorScheme.background,
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  LoginScreenConstants.resendAfter,
                  style: themeData.textTheme.bodyMedium,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedArrowButton(
                    height: 6.h,
                    width: 6.h,
                    contentIcon: AssetConstants.longArrowRight,
                    isEnabled: true,
                    onTap: () {
                      // if (!state.isLoginEnabled) {
                        // context.read<AuthCubit>().verifyOtp();
                      // }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
