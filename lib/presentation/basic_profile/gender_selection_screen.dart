import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/profile/gender_selection/cubit/gender_selection_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/gradient_button.dart';
import '../widgets/snackbar_alert.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appStateNotifier = Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => GenderSelectionCubit(GenderSelectionState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: appConfig.serverUrl,
      )),
      child: const GenderSelectionScreenConsumer(),
    );
  }
}

class GenderSelectionScreenConsumer extends StatelessWidget {
  const GenderSelectionScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenderSelectionCubit, GenderSelectionState>(
      listener: (context, state) {
        if (state.isSuccessful) {
          navigator<NavigationService>()
              .navigateTo(UserRoutes.homeScreenRoute, isClearStack: true);
        } else if (state.isFailed) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.errorMessage,
          );
          context.read<GenderSelectionCubit>().emitFromAnywhere(
                state: state.copyWith(isFailed: false),
              );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          color: Colors.black.withOpacity(1),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      GenderSelectionScreenConstants.addGenderText,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24.sp,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      GenderSelectionScreenConstants.addText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    // const Spacer(flex: 1,),
                    SizedBox(
                      height: 5.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<GenderSelectionCubit>()
                                .onSexSelect(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.lsOFSex[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  index == state.selectedSex
                                      ? SvgPicture.asset(
                                          AssetConstants.selectedRadio)
                                      : SvgPicture.asset(
                                          AssetConstants.unSelectedRadio),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: state.lsOFSex.length,
                    ),
                    const Spacer(),
                    GradientButton(
                        isEnabled: state.isSaveDetailsEnable,
                        text: BasicProfileScreenConstants.continueText,
                        onTap: () {
                          context.read<GenderSelectionCubit>().onContinue();
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
