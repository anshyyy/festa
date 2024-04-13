import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/delete_account/delete_account_cubit.dart';
import '../../../../../application/user/delete_account/delete_confirmation/delete_confirmation_cubit.dart';
import '../../../../../domain/core/configs/app_config.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/snackbar_alert.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(),
      child: const DeleteAccountScreenConsumer(),
    );
  }
}

class DeleteAccountScreenConsumer extends StatelessWidget {
  const DeleteAccountScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: ProfileAndSettingsScreenConstants.deleteAccount,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
              actions: const []),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  DeleteAccountScreenConstants.whyYouWouldDeleteMessage,
                  style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background.withOpacity(.4)),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount:
                        DeleteAccountScreenConstants.deleteReasons.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<DeleteAccountCubit>()
                              .onReasonSelect(selectedIndex: index);
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return AccountDeleteModalSheet(
                                  deleteReason: DeleteAccountScreenConstants
                                      .deleteReasons[index],
                                );
                              });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2.2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  DeleteAccountScreenConstants
                                      .deleteReasons[index],
                                  style: textTheme.bodySmall!.copyWith(
                                    color: colorScheme.background,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                state.deleteReasonIndex == index
                                    ? AssetConstants.selectedRadio
                                    : AssetConstants.unSelectedRadio,
                                height: 3.h,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        DeleteAccountScreenConstants.other,
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.background,
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AssetConstants.arrowRight,
                      height: 3.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AccountDeleteModalSheet extends StatelessWidget {
  final String deleteReason;
  const AccountDeleteModalSheet({
    super.key,
    required this.deleteReason,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Stack(
              children: [
                Center(
                  child: Text(
                    DeleteAccountScreenConstants.accountDeletion,
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        navigator<NavigationService>().goBack();
                      },
                      child: SvgPicture.asset(AssetConstants.closeIcon)),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              DeleteAccountScreenConstants.accountDeletionMessage,
              style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.background.withOpacity(.7),
                  fontSize: 15.5.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            GradientButton(
              text: DeleteAccountScreenConstants.title,
              onTap: () {
                navigator<NavigationService>().goBack();
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ConfirmDeleteModalSheet(
                        deleteReason: deleteReason,
                      );
                    });
              },
              textStyle: textTheme.bodySmall!.copyWith(
                fontSize: 15.5.sp,
                color: colorScheme.background,
                fontWeight: FontWeight.w600,
              ),
              height: 5.5.h,
            ),
            SizedBox(
              height: .5.h,
            ),
            MaterialButton(
              onPressed: () {
                navigator<NavigationService>().goBack();
              },
              child: Text(
                AccountPrivacyScreenConstants.cancel,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmDeleteModalSheet extends StatelessWidget {
  final String deleteReason;
  const ConfirmDeleteModalSheet({
    super.key,
    required this.deleteReason,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) =>
          DeleteConfirmationCubit(DeleteConfirmationState.initial(
        serverUrl: appConfig.serverUrl,
        userId: appStateNotifier.user!.id,
        deleteReason: deleteReason,
      )),
      child: const ConfirmDeleteModalSheetConsumer(),
    );
  }
}

class ConfirmDeleteModalSheetConsumer extends StatelessWidget {
  const ConfirmDeleteModalSheetConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<DeleteConfirmationCubit, DeleteConfirmationState>(
      listener: (context, state) {
        if (state.deleteSuccess && !state.deleteFailure) {
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateAfterAuthChange(
            isAuthorized: false,
            user: null,
          );
          navigator<NavigationService>().navigateTo(
            AuthRoutes.loginWithPhoneRoute,
            isClearStack: true,
          );
        }
        if (!state.deleteSuccess && state.deleteFailure) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: ProfileAndSettingsScreenConstants.logoutFailure,
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 5.w,
              right: 5.w),
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: .5.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              Stack(
                children: [
                  Center(
                    child: Text(
                      DeleteAccountScreenConstants.confirmDelete,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          navigator<NavigationService>().goBack();
                        },
                        child: SvgPicture.asset(AssetConstants.closeIcon)),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                DeleteAccountScreenConstants.actionCannotBeReverted,
                style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background.withOpacity(.7),
                    fontSize: 15.5.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                DeleteAccountScreenConstants.deleteConfirm,
                style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background.withOpacity(.7),
                    fontSize: 15.5.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextField(
                isFill: true,
                fillColor: colorScheme.secondaryContainer.withOpacity(.1),
                hintText: DeleteAccountScreenConstants.typeHere,
                hintTextStyle: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.background.withOpacity(.4),
                ),
                textStyle: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.background,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                onChanged: (value) {
                  context
                      .read<DeleteConfirmationCubit>()
                      .onDeleteFieldChange(value: value);
                },
              ),
              SizedBox(
                height: 0.h,
              ),
              GradientButton(
                text: DeleteAccountScreenConstants.title,
                onTap: () {
                  context.read<DeleteConfirmationCubit>().deleteAccount();
                },
                isEnabled: state.deleteEnabled && !state.isLoading,
                textStyle: textTheme.bodySmall!.copyWith(
                  fontSize: 15.5.sp,
                  color: !state.deleteEnabled && !state.isLoading
                      ? colorScheme.secondaryContainer
                      : colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
                height: 5.5.h,
              ),
              SizedBox(
                height: .5.h,
              ),
              MaterialButton(
                minWidth: 100.w,
                onPressed: () {
                  navigator<NavigationService>().goBack();
                },
                child: Text(
                  AccountPrivacyScreenConstants.cancel,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    color: themeData.colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
