import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/basic_profile/birthday_selection/cubit/birthdateselection_cubit.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../core/primary_button.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            BirthdateselectionCubit(BirthdateselectionState.initial()),
        child: const BirthdayScreenConsumer());
  }
}

class BirthdayScreenConsumer extends StatelessWidget {
  const BirthdayScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BirthdateselectionCubit, BirthdateselectionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 5.h),
              child: Column(
                children: [
                  Text(
                    BirthdayScreenConstants.addBirthday,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                  ),
                  Text(
                    BasicProfileScreenConstants.addText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Inter',
                        ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      height: 30.h,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime newDateTime) {
                          context
                              .read<BirthdateselectionCubit>()
                              .selectedDate(newDateTime);
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: BasicProfileScreenConstants.continueText,
                    function: () {
                      context.read<BirthdateselectionCubit>().onContinue();
                      navigator<NavigationService>()
                          .navigateTo(AuthRoutes.genderRoute);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
