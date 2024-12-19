import 'package:app/presentation/auth/login_with_phone_screen.dart';
import 'package:app_settings/app_settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../application/profile/basic_profile/basic_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/image_provider.dart';
import '../../infrastructure/core/enum/image_type.enum.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_button.dart';
import '../widgets/rounded_arrow_button.dart';
import '../widgets/snackbar_alert.dart';

class BasicProfileScreen extends StatelessWidget {
  const BasicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appStateNotifier = Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => BasicProfileCubit(BasicProfileState.initial(
          appStateNotifier: appStateNotifier, serverUrl: appConfig.serverUrl)),
      child: const BasicProfileScreenConsumer(),
    );
  }
}

class BasicProfileScreenConsumer extends StatelessWidget {
  const BasicProfileScreenConsumer({super.key});

  int calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;

  // Check if the birthday has occurred this year
  if (currentDate.month < birthDate.month || 
      (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<BasicProfileCubit, BasicProfileState>(
        listener: (context, state) {
      if (state.showPermissionDialog) {
        context.read<BasicProfileCubit>().emitFromAnywhere(
                state: state.copyWith(
              showPermissionDialog: false,
            ));

        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              'Storage Permission Required',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            content: Text(
              'Please grant storage permission to use this feature.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  AppSettings.openAppSettings(type: AppSettingsType.settings);

                  Navigator.pop(context);

                  // context.read<PermissionCubit>().requestStoragePermission();
                },
                child: Text(
                  'OK',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      }
      if (state.isSuccessful) {
        Provider.of<AppStateNotifier>(context, listen: false)
            .updateUser(user: state.user);

        navigator<NavigationService>()
            .navigateTo(AuthRoutes.locationSetupRoute, isClearStack: true);
      } else if (state.isFailed) {
        CustomScaffoldMessenger.clearSnackBars(context);
        CustomScaffoldMessenger.showSnackBar(
          context,
          message: state.errorMessage,
        );
        context.read<BasicProfileCubit>().emitFromAnywhere(
              state: state.copyWith(isFailed: false),
            );
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.5.h, horizontal: 0.5.h),
          child: Row(
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
                        LoginScreenConstants.affirmationPrompt,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.background,
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
                      isEnabled:
                          state.isSaveDetailsEnable && state.isContinueEnabled,
                      onTap: () {
                        context.read<BasicProfileCubit>().saveDetails();
                      },
                    )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                const OnboardingGradient(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 12.w,
                        height: 3.25.h,
                        decoration: BoxDecoration(),
                        child: Center(
                            child: SvgPicture.asset(AssetConstants.festa,
                                width: 12.w)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        state.profileImage != null
                            ? BasicProfileScreenConstants.addProfilePicture
                            : BasicProfileScreenConstants.enterDetails,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 24.sp,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Text(
                        BasicProfileScreenConstants.detailsTrailingText,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14.5.sp,
                            letterSpacing: -0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            BasicProfileScreenConstants.whatshouldWeCallYou,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomTextField(
                            controller: state.fullNameController,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            isFill: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.w, horizontal: 4.w),
                            inputWithLabel: false,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.8),
                            hintText: 'Ex. Peter',
                            hintTextStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    // fontSize: 17.sp,
                                    ),
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                            validator: (value) {
                              if (value!.length < 3 && state.startValidation) {
                                return ErrorConstants.invalidFullNameError;
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              if (p0.length < 3 && state.isSaveDetailsEnable) {
                                context
                                    .read<BasicProfileCubit>()
                                    .emitFromAnywhere(
                                        state: state.copyWith(
                                      isSaveDetailsEnable: false,
                                    ));
                              } else if (p0.length >= 3 &&
                                  !state.isSaveDetailsEnable) {
                                context
                                    .read<BasicProfileCubit>()
                                    .emitFromAnywhere(
                                        state: state.copyWith(
                                      startValidation: true,
                                      isSaveDetailsEnable: true,
                                    ));
                              }
                            },
                          ),

                          // const Spacer(
                          //   flex: 1,
                          // ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            BirthdayScreenConstants.addBirthday,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () async {
                              //----------//

                              var confirmDate = await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  builder: (context) {
                                    DateTime? _selectedDate;

                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return SizedBox(
                                          width: 100.w,
                                          height: 45.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h, vertical: 1.h),
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Container(
                                                    width: 12.w,
                                                    height: .5.h,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondaryContainer,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14.5.h),
                                                      child: Text(
                                                        "Date of Birth",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .background,
                                                            fontSize: 17.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: SvgPicture.asset(
                                                            AssetConstants
                                                                .closeIcon))
                                                  ],
                                                ),
                                                SizedBox(height: 1.h),
                                                SizedBox(
                                                    child: CupertinoTheme(
                                                        data: CupertinoTheme.of(
                                                                context)
                                                            .copyWith(
                                                          textTheme:
                                                              CupertinoTheme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .copyWith(
                                                                    dateTimePickerTextStyle: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .background,
                                                                        fontSize:
                                                                            18.sp),
                                                                  ),
                                                        ),
                                                        child: Center(
                                                            child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.w),
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primaryContainer,
                                                          ),
                                                          height: 26.h,
                                                          width: 80.w,
                                                          child:
                                                              CupertinoDatePicker(
                                                            // minimumYear: 18,
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            initialDateTime: state
                                                                .selectedDate,
                                                            maximumYear:
                                                                DateTime.now()
                                                                        .year -
                                                                    7,
                                                            onDateTimeChanged:
                                                                (DateTime
                                                                    newDateTime) {
                                                              setState(() {
                                                                _selectedDate =
                                                                    newDateTime;
                                                              });
                                                            },
                                                          ),
                                                        )))),
                                                SizedBox(height: 2.h),
                                                GradientButton(
                                                  //TODO
                                                    isEnabled:
                                                        _selectedDate != null,
                                                    text: "Save",
                                                    onTap: () async {

                                                      var age = calculateAge(_selectedDate!);
                                                      var res =
                                                          await showModalBottomSheet(
                                                              context: context,
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .surface,
                                                              builder:
                                                                  (context) {
                                                                return SizedBox(
                                                                    width:
                                                                        100.w,
                                                                    height:
                                                                        27.h,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                                                                        child: Column(children: [
                                                                          Center(
                                                                            child:
                                                                                Container(
                                                                              width: 12.w,
                                                                              height: .5.h,
                                                                              decoration: BoxDecoration(
                                                                                color: Theme.of(context).colorScheme.secondaryContainer,
                                                                                borderRadius: BorderRadius.circular(50),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                2.5.h,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 14.5.h),
                                                                                child: Text(
                                                                                  "You're $age",
                                                                                  style: TextStyle(color: Theme.of(context).colorScheme.background, fontSize: 17.sp, fontWeight: FontWeight.w600),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.pop(context, false);
                                                                                  },
                                                                                  child: SvgPicture.asset(AssetConstants.closeIcon))
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                              height: 3.h),
                                                                          Text(
                                                                            'Make sure this is your correct age as you can’t change this later',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(color: Colors.grey[500], fontSize: 15.sp),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 3.h),
                                                                          GradientButton(
                                                                              text: 'Confirm',
                                                                              onTap: () {
                                                                                Navigator.pop(context, true);
                                                                              })
                                                                        ])));
                                                              });
                                                      if (res) {
                                                        Navigator.pop(context,
                                                            _selectedDate);
                                                      }
                                                    })
                                              ],
                                            ),
                                          ));
                                    });
                                  });

                              print(confirmDate);

                              context
                                  .read<BasicProfileCubit>()
                                  .selectedDate(confirmDate);

                              //---------//
                            },
                            child: CustomTextField(
                              controller: state.birthDayController,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              suffixIcon: SizedBox(
                                width: 4.h,
                                height: 4.h,
                                child: SvgPicture.asset(
                                  AssetConstants.calender,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              maxLines: 1,
                              isFill: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.w, horizontal: 4.w),
                              inputWithLabel: false,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  .withOpacity(0.8),
                              hintText: 'yyyy-mm-dd',
                              hintTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      // fontSize: 17.sp,
                                      ),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Date of birth is required';
                                }

                                // Regular expression to validate the date format yyyy-mm-dd
                                final dateRegex =
                                    RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                if (!dateRegex.hasMatch(value)) {
                                  return 'Invalid date format. Use yyyy-mm-dd';
                                }

                                // Split the value into year, month, and day components
                                final parts = value.split('-');
                                final int year = int.tryParse(parts[0]) ?? -1;
                                final int month = int.tryParse(parts[1]) ?? -1;
                                final int day = int.tryParse(parts[2]) ?? -1;

                                // Year validation: Ensure the year is greater than 1950
                                if (year <= 1950) {
                                  return 'Year must be greater than 1950';
                                }

                                // Month validation: Ensure the month is between 1 and 12
                                if (month < 1 || month > 12) {
                                  return 'Invalid month. Please enter a value between 01 and 12';
                                }

                                // Days in each month (ignoring leap years)
                                final daysInMonth = {
                                  1: 31,
                                  2: 28,
                                  3: 31,
                                  4: 30,
                                  5: 31,
                                  6: 30,
                                  7: 31,
                                  8: 31,
                                  9: 30,
                                  10: 31,
                                  11: 30,
                                  12: 31
                                };

                                // Day validation: Ensure the day is valid for the given month
                                if (day < 1 || day > daysInMonth[month]!) {
                                  return 'Invalid day for the given month';
                                }

                                // Optional: Future date check
                                final parsedDate = DateTime(year, month, day);
                                final currentDate = DateTime.now();
                                if (parsedDate.isAfter(currentDate)) {
                                  return 'Date of birth cannot be in the future';
                                }

                                return null; // Date is valid
                              },
                              onChanged: (input) {
                                String formattedDate = '';
                                if (input.isNotEmpty && input.endsWith('-')) {
                                  state.birthDayController.text =
                                      state.birthDayController.text.substring(
                                          0,
                                          state.birthDayController.text.length -
                                              1);
                                }
                                if (input.length == 4) {
                                  state.birthDayController.text = input + "-";
                                }
                                if (input.length == 7) {
                                  state.birthDayController.text = input + "-";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
