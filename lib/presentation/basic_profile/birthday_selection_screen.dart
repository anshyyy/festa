import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/profile/birthday_selection/birthday_selection_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/gradient_button.dart';
import '../widgets/snackbar_alert.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appStateNotifier = Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
        create: (context) =>
            BirthdaySelectionCubit(BirthdaySelectionState.initial(
              appStateNotifier: appStateNotifier,
              serverUrl: appConfig.serverUrl,
            )),
        child: const BirthdayScreenConsumer());
  }
}

class BirthdayScreenConsumer extends StatelessWidget {
  const BirthdayScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<BirthdaySelectionCubit, BirthdaySelectionState>(
        listener: (context, state) {
      if (state.isSuccessful) {
        navigator<NavigationService>()
            .navigateTo(AuthRoutes.genderRoute, isClearStack: true);
      } else if (state.isFailed) {
        CustomScaffoldMessenger.clearSnackBars(context);
        CustomScaffoldMessenger.showSnackBar(
          context,
          message: state.errorMessage,
        );
        context.read<BirthdaySelectionCubit>().emitFromAnywhere(
              state: state.copyWith(isFailed: false),
            );
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state.isLoading,
        color: Colors.black.withOpacity(1),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    BirthdayScreenConstants.addBirthday,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(BasicProfileScreenConstants.addText,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(letterSpacing: -1)),
                ),
                const Spacer(
                  flex: 1,
                ),
                CupertinoTheme(
                  data: CupertinoTheme.of(context).copyWith(
                    textTheme: CupertinoTheme.of(context).textTheme.copyWith(
                          dateTimePickerTextStyle: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 17.sp),
                        ),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      height: 25.h,
                      width: 75.w,
                      child: CupertinoDatePicker(
                        // minimumYear: 18,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: state.selectedDate,
                        maximumYear: DateTime.now().year - 7,
                        onDateTimeChanged: (DateTime newDateTime) {
                          context
                              .read<BirthdaySelectionCubit>()
                              .selectedDate(newDateTime);
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Container(
                  height: 13.5.h,
                  color: colorScheme.surface,
                  padding: EdgeInsets.only(
                      top: 3.h, bottom: 5.h, left: 4.w, right: 4.w),
                  child: GradientButton(
                    text: BasicProfileScreenConstants.continueText,
                    isEnabled: state.isContinueEnabled,
                    textStyle: textTheme.bodySmall!.copyWith(
                        color: state.isContinueEnabled
                            ? colorScheme.background
                            : colorScheme.background.withOpacity(.5),
                        fontWeight: FontWeight.w600),
                    onTap: () {
                      context.read<BirthdaySelectionCubit>().onContinue();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
