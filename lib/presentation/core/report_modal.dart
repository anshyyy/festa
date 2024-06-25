
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/report/report_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_button.dart';

class ReportModalSheet extends StatelessWidget {
  final String name;
  final String id;
  final String type;

  const ReportModalSheet({
    super.key,
    required this.id,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => ReportCubit(ReportState.initial(
        serverUrl: appConfig.serverUrl,
        type: type,
        id: id,
        name: name,
      ))
        ..init(),
      child: const ReportModalSheetConsumer(),
    );
  }
}

class ReportModalSheetConsumer extends StatelessWidget {
  const ReportModalSheetConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Fluttertoast.showToast(
            msg: 'Your report submitted successfully!',
            backgroundColor: Colors.green,
            gravity: ToastGravity.CENTER,
          );
          navigator<NavigationService>().goBack();

          context
              .read<ReportCubit>()
              .emitFromAnywhere(state: state.copyWith(isSuccess: false));
        } else if (state.isFailure) {
          context
              .read<ReportCubit>()
              .emitFromAnywhere(state: state.copyWith(isFailure: false));

          Fluttertoast.showToast(
            msg: 'Failed to submit report, Please try again!',
            backgroundColor: Colors.red,
            gravity: ToastGravity.CENTER,
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
              SizedBox(
                height: 1.h,
              ),
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
              Text(
                'Report something that doesn’t look right',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                isFill: true,
                controller: state.reportDescController,
                maxLines: 3,
                fillColor: Theme.of(context).colorScheme.onSecondaryContainer,
                hintText: DeleteAccountScreenConstants.typeHere,
                hintTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(.6),
                    ),
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
                onChanged: (value) {
                  context.read<ReportCubit>().emitFromAnywhere(
                      state: state.copyWith(isEnableSubmit: value.isNotEmpty));
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetConstants.incogIcon,
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Text(
                      'We don’t ${state.name} let know who reported them.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              state.isLoading
                  ? Center(
                      child: SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : GradientButton(
                      text: 'Submit',
                      onTap: () {
                        context.read<ReportCubit>().onSubmit();
                      },
                      isEnabled: state.isEnableSubmit && !state.isLoading,
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 15.5.sp,
                                color: !state.isEnableSubmit && !state.isLoading
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                    : Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                      height: 5.5.h,
                    ),
              SizedBox(
                height: .5.h,
              ),
              if (!state.isLoading)
                MaterialButton(
                  minWidth: 100.w,
                  onPressed: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Text(
                    AccountPrivacyScreenConstants.cancel,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
