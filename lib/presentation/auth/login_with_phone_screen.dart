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
import '../core/primary_button.dart';
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
            resizeToAvoidBottomInset: true,
          
            body: Stack(
              fit: StackFit.expand,
              children: [
              const OnboardingGradient(),
           //   const PhoneFieldHint(),

                Padding(
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
                              fontWeight: FontWeight.w400,
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
                              width: 26.w,
                              height: 17.w,
                              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.4),
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
                                            fontSize: 15.5.sp,
                                            fontWeight: FontWeight.w400,
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
                                    width: 7.w,
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
                              autofocus: true,
                              maxLength: 10,
                              controller: state.phoneController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              isFill: true,
                              inputWithLabel: false,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.6.w, horizontal: 4.w),
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  .withOpacity(0.4),
                              hintText: LoginScreenConstants.phoneNumberHint,
                              hintTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      // fontSize: 17.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error),
                             
                            
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length <= 9 || value.length>10||
                                    !GenericHelpers().isValidMobile(value)) {
                                  return ErrorConstants
                                      .invalidMobileNumberError;
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
                                    state.isLoginEnabled
                                        ? LoginScreenConstants.affirmationPrompt
                                        : LoginScreenConstants
                                            .mobileLoginPrompt,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.w400),
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
                                    showConfirmMobileDialogue(context, state);
                                  },
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showConfirmMobileDialogue(
      BuildContext context, AuthState state) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          alignment: Alignment.center,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            clipBehavior: Clip.antiAlias,
            width: 200.w,
            height: 236, //26.7.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(width: 2.px, color: const Color(0xff323232))),
            child: Column(
              children: [
                Text(
                  'We need to verify your number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.px,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.background),
                ),
                SizedBox(height: 1.h),
                Text.rich(
                  TextSpan(
                    text: 'Is ', // Normal text
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '+91-${state.phoneController.text}', // Bold phone number
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' is your mobile numer? We’re just making sure one last time.', // Normal text
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PrimaryButton(
                  height: 5.5.h,
                  text: 'Confirm',
                  function: () {
                    if (state.isLoginEnabled) {
                      context.read<AuthCubit>().requestOtp();
                        Navigator.pop(context);
                    }
                  },
                  textColor: Colors.black,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class OnboardingGradient extends StatelessWidget {
  const OnboardingGradient({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -100,
        bottom: 250,
        child: Container(
          width: 62.5.h,
          height: 62.5.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/og.png',
                  ),
                  fit: BoxFit.cover)),
        ));
  }
}
