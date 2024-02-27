import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/rounded_arrow_button.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UsernameScreenConsumer();
  }
}

class UsernameScreenConsumer extends StatelessWidget {
  const UsernameScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                UsernameScreenConstants.chooseYourUsername,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                hintText: UsernameScreenConstants.typeHere,
                hintTextStyle: Theme.of(context).textTheme.bodyMedium,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
                isFill: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                suffixIcon: 2==2 ? Image.asset(AssetConstants.bubbleLoader): SvgPicture.asset(AssetConstants.accountSettings),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: RoundedArrowButton(
                  height: 6.h,
                  width: 6.h,
                  contentIcon: AssetConstants.longArrowRight,
                  isEnabled: false,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
