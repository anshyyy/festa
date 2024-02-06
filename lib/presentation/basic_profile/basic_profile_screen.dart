import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/basic_profile/cubit/basic_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../core/custom_textfield.dart';
import '../core/primary_button.dart';

class BasicProfileScreen extends StatelessWidget {
  const BasicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appStateNotifier = Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => BasicProfileCubit(BasicProfileState.initial(
          appStateNotifier: appStateNotifier,
          serverUrl: appConfig.serverUrl)),
      child: const BasicProfileScreenConsumer(),
    );
  }
}

class BasicProfileScreenConsumer extends StatelessWidget {
  const BasicProfileScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasicProfileCubit, BasicProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 5.h),
              child: Column(
                children: [
                  Text(
                    state.profileImageFile != null
                        ? BasicProfileScreenConstants.addProfilePicture
                        : BasicProfileScreenConstants.addNameProfile,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          context
                              .read<BasicProfileCubit>()
                              .onSelectProfileImage();
                        },
                        child: state.profileImageFile != null
                            ? CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                    FileImage(state.profileImageFile!),
                              )
                            : Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(
                                  height: 100,
                                  child:
                                      Image.asset(AssetConstants.profileIcon),
                                ),
                              ),
                      ),
                    ),
                  ),
                  CustomTextField(
                    controller: state.fullNameController,
                    inputWithLabel: true,
                    labelText: BasicProfileScreenConstants.enterYourName,
                    hintText: BasicProfileScreenConstants.hintEnterYourName,
                    width: 90.w,
                    textCapitalization: TextCapitalization.words,
                    errorText: state.errorFullName.isEmpty
                        ? null
                        : state.errorFullName,
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        context.read<BasicProfileCubit>().emitFromAnywhere(
                            state: state.copyWith(
                                isSaveDetailsEnable: true, errorFullName: ''));
                      } else {
                        context.read<BasicProfileCubit>().emitFromAnywhere(
                                state: state.copyWith(
                              isSaveDetailsEnable: false,
                            ));
                      }
                    },
                  ),
                  const Spacer(),
                  PrimaryButton(
                      text: BasicProfileScreenConstants.continueText,
                      isDisabled: !state.isSaveDetailsEnable,
                      function: () {
                        context.read<BasicProfileCubit>().onContinue();
                        navigator<NavigationService>()
                            .navigateTo(AuthRoutes.birthdayRoute);
                      }),
                ],
              ),
            ),
          );
        });
  }
}
