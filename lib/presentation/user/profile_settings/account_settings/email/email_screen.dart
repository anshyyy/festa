import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/email/email_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/helpers/generic_helpers.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) =>
          EmailCubit(EmailState.initial(serverUrl: appConfig.serverUrl)),
      child: const EmailScreenConsumer(),
    );
  }
}

class EmailScreenConsumer extends StatelessWidget {
  const EmailScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<EmailCubit, EmailState>(
      listener: (context, state) {
        if (state.isOtpSent) {
          navigator<NavigationService>()
              .navigateTo(UserRoutes.emailOtpVerificationRoute, queryParams: {
            'emailAddress': state.emailTextController.text,
          });
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
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    AccountEmailScreenConstants.youHaveNotAddedEmail,
                    style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.background.withOpacity(.7),
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  CustomTextField(
                    controller: state.emailTextController,
                    isFill: true,
                    fillColor: colorScheme.surface,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    hintText: AccountEmailScreenConstants.typeNewEmail,
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
                      } else if (!GenericHelpers().isValidEmail(value)) {
                        hasError = true;
                      }
                      context
                          .read<EmailCubit>()
                          .validateError(hasError: hasError);
                      return hasError ? ErrorConstants.invalidEmail : '';
                    },
                  ),
                  const Spacer(),
                  GradientButton(
                    text: AccountEmailScreenConstants.addEmail,
                    onTap: () {
                      context.read<EmailCubit>().sendOtpToEmail();
                    },
                    height: 5.h,
                    isEnabled: state.emailTextController.text.isNotEmpty &&
                        !state.hasValidationError,
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
