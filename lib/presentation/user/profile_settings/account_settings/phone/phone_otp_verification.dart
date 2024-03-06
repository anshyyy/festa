import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/phone/phone_otp_verification/phone_otp_verification_cubit.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';

class PhoneOtpVerification extends StatelessWidget {
  final String phoneNumber;
  const PhoneOtpVerification({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneOtpVerificationCubit(
          PhoneOtpVerificationState.initial(phoneNumber: phoneNumber)),
      child: const PhoneOtpVerificationScreen(),
    );
  }
}

class PhoneOtpVerificationScreen extends StatelessWidget {
  const PhoneOtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<PhoneOtpVerificationCubit, PhoneOtpVerificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: PhoneScreenConstants.title,
            leading: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Center(
                child: SvgPicture.asset(AssetConstants.arrowLeft),
              ),
            ),
            actions: [],
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
                  PhoneScreenConstants.otpSent + state.phoneNumber,
                  style: textTheme.bodyMedium!.copyWith(fontSize: 16.5.sp),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                GestureDetector(
                  onTap: () => navigator<NavigationService>().goBack(),
                  child: Text(
                    PhoneScreenConstants.changeNumber,
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
                  isFill: true,
                  fillColor: colorScheme.surface,
                  keyboardType: TextInputType.number,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  hintText: PhoneScreenConstants.enterOtp,
                  hintTextStyle: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.background.withOpacity(.5)),
                  textStyle: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.background),
                  errorStyle: textTheme.bodySmall!.copyWith(
                    color: colorScheme.error,
                  ),
                ),
                Text(
                  PhoneScreenConstants.resendAfter,
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 15.5.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: colorScheme.background,
                  ),
                ),
                Spacer(),
                GradientButton(
                  text: PhoneScreenConstants.submit,
                  onTap: () {
                    navigator<NavigationService>().navigateTo(UserRoutes.phoneDetailsScreenRoute, queryParams: {
                    'phoneNumber':state.phoneNumber,
                    });
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
        );
      },
    );
  }
}
