import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/auth/auth_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/helpers/generic_helpers.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/country_picker.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/rounded_arrow_button.dart';
import '../widgets/snackbar_alert.dart';

class LoginPhoneScreen extends StatelessWidget {
  const LoginPhoneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => AuthCubit(
        AuthState.initial(
          apiBaseUrl: appConfig.serverUrl,
        ),
      ),
      child: const LoginPhoneScreenConsumer(),
    );
  }
}

class LoginPhoneScreenConsumer extends StatelessWidget {
  const LoginPhoneScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isOTPSentFailed && !state.isOTPSentSuccessful) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );

          context.read<AuthCubit>().emitFromAnywhere(
                state: state.copyWith(
                  isOTPSentFailed: false,
                ),
              );
        }

        if (!state.isOTPSentFailed && state.isOTPSentSuccessful) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );

          navigator<NavigationService>()
              .navigateTo(AuthRoutes.verifyOTPRoute, queryParams: {
            'verificationCode': state.verificationCode!,
            'dialCode': state.selectedDialCode,
            'phoneNumber': state.phoneController.text
          });

          context.read<AuthCubit>().emitFromAnywhere(
                state: state.copyWith(
                  isOTPSentSuccessful: false,
                ),
              );
        }
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
                    LoginScreenConstants.mobileLoginHeader,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    LoginScreenConstants.mobileLoginDescription,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.5.sp
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const CountryPicker(),
                            backgroundColor: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ).then((value) {
                            if (value != null) {
                              context.read<AuthCubit>().onDialCodeChange(
                                    dialCode: value[0],
                                    locale: value[1],
                                  );
                            }
                          });
                        },
                        child: Container(
                          width: 25.w,
                          height: 56,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${state.selectedLocale} ${state.selectedDialCode}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        // fontSize: 16.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              SvgPicture.asset(
                                AssetConstants.arrowDown,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: state.phoneController,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          isFill: true,
                          inputWithLabel: false,
                          fillColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          hintText: LoginScreenConstants.phoneNumberHint,
                          hintTextStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    // fontSize: 17.sp,
                                  ),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  // fontSize: 17.sp,
                                  color:
                                      Theme.of(context).colorScheme.background),
                          errorStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6 || !GenericHelpers().isValidMobile(value)) {
                              return ErrorConstants.invalidMobileNumberError;
                            }
                            return null;
                          },
                          onChanged: (value) => context
                              .read<AuthCubit>()
                              .onPhoneChange(text: value),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.securityIcon,
                              height: 2.5.h,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            Expanded(
                              child: Text(
                                state.isLoginEnabled ? LoginScreenConstants.affirmationPrompt:LoginScreenConstants.mobileLoginPrompt,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.background,
                                            fontWeight: FontWeight.w400
                                            ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 2.h,
                      ),
                      state.isLoading
                          ? const CircularProgressIndicator()
                          : RoundedArrowButton(
                              height: 6.h,
                              width: 6.h,
                              contentIcon: AssetConstants.longArrowRight,
                              isEnabled: state.isLoginEnabled,
                              onTap: () {
                                if (state.isLoginEnabled) {
                                  context.read<AuthCubit>().requestOtp();
                                }
                              },
                            )
                    ],
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
