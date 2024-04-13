import 'package:cached_network_image/cached_network_image.dart';
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

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return BlocConsumer<BasicProfileCubit, BasicProfileState>(
        listener: (context, state) {
      if(state.showPermissionDialog){
        showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Storage Permission Required'),
        content: const Text('Please grant storage permission to use this feature.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // context.read<PermissionCubit>().requestStoragePermission();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
      }
      if (state.isSuccessful) {
        navigator<NavigationService>()
            .navigateTo(AuthRoutes.birthdayRoute, isClearStack: true);
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
      return ModalProgressHUD(
        inAsyncCall: state.isLoading,
        color: Colors.black.withOpacity(1),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    state.profileImage != null
                        ? BasicProfileScreenConstants.addProfilePicture
                        : BasicProfileScreenConstants.addNameProfile,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
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
                    BasicProfileScreenConstants.addText,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14.5.sp, letterSpacing: -1),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<BasicProfileCubit>()
                            .onSelectProfileImage();
                      },
                      child: Container(
                        height: 53.w,
                        width: 53.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: state.profileImage != null
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                            width: state.profileImage != null ? 1.w : 0.w,
                          ),
                          image: state.profileImage != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      CustomImageProvider.getImageUrl(
                                          state.profileImage,
                                          ImageType.profile)),
                                )
                              : null,
                        ),
                        child: state.profileImage == null
                            ? Center(
                                child: SvgPicture.asset(
                                AssetConstants.editIcon,
                                height: 4.h,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(.3),
                                    BlendMode.srcIn),
                              ))
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
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                    child: SvgPicture.asset(
                                      AssetConstants.editIcon,
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .primaryContainer
                                              .withOpacity(.7),
                                          BlendMode.srcIn),
                    
                                      height: 4.h,
                                      // color:
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BasicProfileScreenConstants.enterYourName,
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
                        contentPadding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 4.w),
                        inputWithLabel: false,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                        hintText: 'Type here',
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
                              color:
                                  Theme.of(context).colorScheme.error,
                            ),
                        validator: (value) {
                          if (value!.length < 3 &&
                              state.startValidation) {
                            return ErrorConstants.invalidFullNameError;
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          if (p0.length < 3 &&
                              state.isSaveDetailsEnable) {
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
                      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Wrap(
          children: [
            Container(
              height: 14.h,
              color: Theme.of(context).colorScheme.surface,
              padding: EdgeInsets.only(
                  bottom: 6.h, top: 2.5.h, left: 6.w, right: 6.w),
              child: GradientButton(
                  text: BasicProfileScreenConstants.continueText,
                  isEnabled: state.isSaveDetailsEnable,
                  textStyle: textTheme.bodySmall!.copyWith(
                    color: state.isSaveDetailsEnable
                        ? colorScheme.background
                        : colorScheme.background.withOpacity(.5),
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    context.read<BasicProfileCubit>().onContinue();
                  }),
            ),
          ],
                      ),
                    ),
        ),
      );
    });
  }
}
