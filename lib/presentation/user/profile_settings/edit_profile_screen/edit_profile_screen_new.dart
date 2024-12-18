import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../domain/core/utils/image_provider.dart';
import '../../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/gradient_button.dart';
import '../widgets/edit_profile_tab1.dart';
import '../widgets/highlights_tab.dart';

class EditProfileScreenNew extends StatelessWidget {
  final int userId;
  const EditProfileScreenNew({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => EditProfileCubit(
        EditProfileState.initial(
          serverUrl: appConfig.serverUrl,
          userId: userId,
        ),
      )..init(),
      child: const EditProfileScreenConsumer(),
    );
  }
}

class EditProfileScreenConsumer extends StatelessWidget {
  const EditProfileScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.isSuccess && !state.isFailure) {
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateUser(user: state.user);
        }
      },
      builder: (context, state) {
        final themeData = Theme.of(context);
        final colorScheme = themeData.colorScheme;
        final textTheme = themeData.textTheme;
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const SizedBox()
              : Scaffold(
                  appBar: CustomAppBar(
                      title: EditProfileScreenConstants.editProfile,
                      leading: GestureDetector(
                          onTap: () async {
                            if (state.isSaveEnabled) {
                              // Show dialog asking if the user wants to save or discard changes
                              var option = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Unsaved Changes',
                                      style: TextStyle(
                                          color: colorScheme.background,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp),
                                    ),
                                    content: Text(
                                        'Do you want to save your changes before leaving?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.sp)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          // Discard changes and go back
                                          navigator<NavigationService>().goBack(
                                              responseObject: 'Discard');
                                        },
                                        child: Text(
                                          'Discard',
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          navigator<NavigationService>()
                                              .goBack(responseObject: 'Save');
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (option == "Discard") {
                                navigator<NavigationService>().goBack();
                                navigator<NavigationService>().goBack();
                              } else {
                                context.read<EditProfileCubit>().onSave();
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  navigator<NavigationService>().goBack();
                                });
                              }
                            } else {
                              navigator<NavigationService>().goBack();
                            }
                          },
                          child: Center(
                              child: SvgPicture.asset(
                            AssetConstants.arrowLeft,
                            width: 7.w,
                          ))),
                      actions: [
                        Padding(
                          padding:EdgeInsets.only(right:1.h),
                          child: InkWell(
                            onTap: state.isSaveEnabled
                                ? () {
                                    context.read<EditProfileCubit>().onSave();
                                  }
                                : null,
                            child: Text(
                              'Update Profile',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: state.isSaveEnabled
                                      ? colorScheme.primary
                                      :Colors.black),
                            ),
                          ),
                        )
                      ]),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DefaultTabController(
                      length: 2, // Two tabs
                      child: Column(
                        children: [
                          // Tab bar with two tabs: "Profile Picture" and "Highlights"
                          TabBar(
                            labelColor: colorScheme.background,
                            unselectedLabelColor: Colors.grey.shade600,
                            unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.sp),
                            indicatorColor: colorScheme.primary,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 2,
                                color: colorScheme.primary,
                              ),
                            ),
                            tabs: const [
                              Tab(text: 'Profile Picture'),
                              Tab(text: 'Highlights'),
                            ],
                          ),
                          SizedBox(height: 1.h),

                          SizedBox(
                            height: 100.h, // Adjust height as needed
                            child: const TabBarView(
                              children: [
                                // Tab 1: Profile Picture Content
                                EditProfileTab1(),
                                // Tab 2: Highlights Content
                                HighlightsTab()
                              ],
                            ),
                          ),
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
