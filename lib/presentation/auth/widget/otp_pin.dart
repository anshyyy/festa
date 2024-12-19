import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../application/auth/verify_otp/verify_otp_cubit.dart';

class OtpPinField extends StatefulWidget {
  const OtpPinField({super.key});

  @override
  State<OtpPinField> createState() => _OtpPinFieldState();
}

class _OtpPinFieldState extends State<OtpPinField> with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      print('code: $code');
      otpCode = code!;
      if (otpCode != null && otpCode!.isNotEmpty) {
        context.read<VerifyOtpCubit>().updateOtp(otpCode!);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return BlocBuilder<VerifyOtpCubit, VerifyOtpState>(      
      builder: (context, state) {
        return PinCodeTextField(
          controller: state.otpController,
          appContext: context,
          length: 6,
          showCursor: false,
          obscureText: false,
          animationType: AnimationType.fade,
          enableActiveFill: true,
          enablePinAutofill: true,
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
                themeData.colorScheme.primaryContainer.withOpacity(0.4),
            borderWidth: 0,
            inactiveBorderWidth: 0,
            activeBorderWidth: 0,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(40),
            fieldHeight: 8.h,
            fieldWidth: 13.5.w,
            selectedFillColor:
                themeData.colorScheme.primaryContainer.withOpacity(0.5),
            inactiveFillColor:
                themeData.colorScheme.primaryContainer.withOpacity(0.5),
            activeFillColor: themeData.colorScheme.background,
            selectedBorderWidth: 0.6,
            selectedColor: themeData.colorScheme.primary,
          ),
          onChanged: (value) {
            context.read<VerifyOtpCubit>().updateOtp(value);
          },
        );
      },
    );
  }
}
