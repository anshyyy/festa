import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/profile/basic_profile/basic_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
// import '../core/custom_textfield.dart';
import '../widgets/gradient_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasicProfileCubit, BasicProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Column(
                  children: [
                    const Spacer(flex: 1,),
                    Text(
                      state.profileImageFile != null
                          ? BasicProfileScreenConstants.addProfilePicture
                          : BasicProfileScreenConstants.addNameProfile,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                    Text(BasicProfileScreenConstants.addText,
                        style: Theme.of(context).textTheme.bodySmall),
                    
                    const Spacer(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<BasicProfileCubit>()
                              .onSelectProfileImage();
                        },
                        child: Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: state.profileImageFile != null
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                              width: state.profileImageFile != null ? 1.w : 0.w,
                            ),
                            image: state.profileImageFile != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(state.profileImageFile!),
                                  )
                                : null,
                          ),
                          child: state.profileImageFile == null
                              ? Center(
                                  child: SvgPicture.asset(
                                    AssetConstants.editIcon,
                                    height: 4.h,
                                    color:Theme.of(context).colorScheme.secondaryContainer
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    context
                                        .read<BasicProfileCubit>()
                                        .onSelectProfileImage();
                                  },
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.w),
                                        color: Theme.of(context).colorScheme.background
                                      ),
                                      child: SvgPicture.asset(
                                        AssetConstants.editIcon,
                                        color: Theme.of(context).colorScheme.secondaryContainer,
                                        height: 4.h,
                                        // color:
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BasicProfileScreenConstants.enterYourName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp,
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                              SizedBox(
                                height: 1.h,
                              ),
                        // CustomTextField(
                        //   controller: state.fullNameController,
                        //   inputWithLabel: true,
                        //   // labelText: BasicProfileScreenConstants.enterYourName,
                        //   hintText:
                        //       BasicProfileScreenConstants.hintEnterYourName,
                        //   width: 90.w,
                        //   textCapitalization: TextCapitalization.words,
                        //   // isFill: true,
                        //   // fillColor:
                        //   //     Theme.of(context).colorScheme.primaryContainer,
                        //   // errorText: state.errorFullName.isEmpty
                        //   //     ? null
                        //   //     : state.errorFullName,
                        //   // hintTextStyle:
                        //   //     Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //   //           fontSize: 17.sp,
                        //   //         ),
                        //   // textStyle: Theme.of(context)
                        //   //     .textTheme
                        //   //     .bodyMedium!
                        //   //     .copyWith(
                        //   //         fontSize: 17.sp,
                        //   //         color:
                        //   //             Theme.of(context).colorScheme.background),

                        //   onChanged: (val) {
                        //     if (val.isNotEmpty) {
                        //       context
                        //           .read<BasicProfileCubit>()
                        //           .emitFromAnywhere(
                        //               state: state.copyWith(
                        //                   isSaveDetailsEnable: true,
                        //                   errorFullName: ''));
                        //     } else {
                        //       context
                        //           .read<BasicProfileCubit>()
                        //           .emitFromAnywhere(
                        //               state: state.copyWith(
                        //             isSaveDetailsEnable: false,
                        //           ));
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                    const Spacer(flex: 2,),
                    GradientButton(
                      // height: 9.h,
                        text: BasicProfileScreenConstants.continueText,
                        // isEnabled: state.isSaveDetailsEnable,
                        onTap: () {
                          context.read<BasicProfileCubit>().onContinue();
                          navigator<NavigationService>()
                              .navigateTo(AuthRoutes.birthdayRoute);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
