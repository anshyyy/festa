import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/date_of_birth_settings/date_of_birth_settings_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/extensions/string_extension.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/gradient_button.dart';

class DateOfBirthSettingsScreen extends StatelessWidget {
  final String dob;
  const DateOfBirthSettingsScreen({super.key, required this.dob});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => DateOfBirthSettingsCubit(
          DateOfBirthSettingsState.initial(
              dob: dob, serverUrl: appConfig.serverUrl)),
      child: const DateOfBirthSettingsScreenConsumer(),
    );
  }
}

class DateOfBirthSettingsScreenConsumer extends StatelessWidget {
  const DateOfBirthSettingsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);

    return BlocConsumer<DateOfBirthSettingsCubit, DateOfBirthSettingsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.user != null && !state.isLoading) {
          appStateNotifier.updateAfterAuthChange(
              isAuthorized: true, user: state.user);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            appBar: CustomAppBar(
                title: DateOfBirthSettingsScreenConstants.title,
                leading: GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: Center(
                        child: SvgPicture.asset(AssetConstants.arrowLeft))),
                actions: []),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringExtension.formatDateTimeNormal(
                                state.updatedDate),
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorScheme.background,
                            ),
                          ),
                          InkWell(
                            onTap: () => context
                                .read<DateOfBirthSettingsCubit>()
                                .openDatePicker(),
                            child: Text(
                              DateOfBirthSettingsScreenConstants.edit,
                              style: textTheme.bodySmall!.copyWith(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        DateOfBirthSettingsScreenConstants.dateOfBirthMessage,
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.background.withOpacity(.7),
                          fontSize: 15.5.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        DateOfBirthSettingsScreenConstants
                            .whoCanSeeYourDobMessage,
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.scrim,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                state.openDatePicker
                    ? GestureDetector(
                        onTap: () => context
                            .read<DateOfBirthSettingsCubit>()
                            .openDatePicker(),
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          color: Colors.transparent.withOpacity(.5),
                        ),
                      )
                    : const SizedBox(),
                state.openDatePicker
                    ? Column(
                        children: [
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: GradientButton(
                              text: DateOfBirthSettingsScreenConstants.save,
                              onTap: () => context
                                  .read<DateOfBirthSettingsCubit>()
                                  .saveDateOfBirth(),
                              textStyle: textTheme.bodySmall!.copyWith(
                                fontSize: 15.5.sp,
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                              height: 5.5.h,
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: MaterialButton(
                              minWidth: 100.w,
                              onPressed: () => context
                                  .read<DateOfBirthSettingsCubit>()
                                  .openDatePicker(),
                              child: Text(
                                UsernameSettingsScreenConstants.cancel,
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: themeData.colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CupertinoTheme(
                            data: CupertinoTheme.of(context).copyWith(
                              textTheme:
                                  CupertinoTheme.of(context).textTheme.copyWith(
                                        dateTimePickerTextStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontSize: 17.sp),
                                      ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              height: 30.h,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: state.selectedDate,
                                maximumYear: DateTime.now().year - 7,
                                onDateTimeChanged: (DateTime newDateTime) {
                                  context
                                      .read<DateOfBirthSettingsCubit>()
                                      .onBirthDateChanged(newDateTime);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
