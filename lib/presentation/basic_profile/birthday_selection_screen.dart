import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/profile/birthday_selection/cubit/birthdateselection_cubit.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/gradient_button.dart';

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
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      BirthdayScreenConstants.addBirthday,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24.sp,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(BasicProfileScreenConstants.addText,
                        style: Theme.of(context).textTheme.bodySmall),
                    const Spacer(
                      flex: 1,
                    ),
                    CupertinoTheme(
                      data: CupertinoTheme.of(context).copyWith(
                          textTheme: CupertinoTheme.of(context)
                              .textTheme
                              .copyWith(
                                dateTimePickerTextStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                      fontSize: 17.sp
                                ),
                              )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          height: 25.h,
                          child: CupertinoDatePicker(
                            // minimumYear: 18,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            maximumYear: DateTime.now().year,
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) {
                              context
                                  .read<BirthdateselectionCubit>()
                                  .selectedDate(newDateTime);
                            },
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    GradientButton(
                      text: BasicProfileScreenConstants.continueText,
                      onTap: () {
                        context.read<BirthdateselectionCubit>().onContinue();
                        navigator<NavigationService>()
                            .navigateTo(AuthRoutes.genderRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
