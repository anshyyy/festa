import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/phone/phone_cubit.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/helpers/generic_helpers.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneCubit(),
      child: const PhoneScreenConsumer(),
    );
  }
}

class PhoneScreenConsumer extends StatelessWidget {
  const PhoneScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<PhoneCubit, PhoneState>(
      listener: (context, state) {
        
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
                child: SvgPicture.asset(AssetConstants.arrowLeft, width: 7.w,),
              ),
            ),
            actions: const [],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  PhoneScreenConstants.youHaveNotAddedContact,
                  style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.background.withOpacity(.7),
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomTextField(
                  controller: state.phoneNumberController,
                  prefixIcon: const Text('+91',),
                  isFill: true,
                  fillColor: colorScheme.surface,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  hintText: PhoneScreenConstants.typeHere,
                  hintTextStyle: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.background.withOpacity(.5)),
                  textStyle: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.background),
                  errorStyle: textTheme.bodySmall!.copyWith(
                    color: colorScheme.error,
                  ),
                  validator: (value) {
                    bool hasError = false;
                    if (value!.isEmpty || value.length < 6) {
                      hasError = true;
                    }
                    else if (!GenericHelpers().isValidMobile(value)) {
                      hasError = true;
                    }
                    
                    return hasError ? ErrorConstants.invalidMobileNumberError:'';
                  },
                ),
                const Spacer(),
                GradientButton(
                  text: PhoneScreenConstants.addNumber,
                  onTap: () {
                    navigator<NavigationService>().navigateTo(UserRoutes.phoneOtpVerificationRoute, queryParams: {
                      'phoneNumber':state.phoneNumberController.text,
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
