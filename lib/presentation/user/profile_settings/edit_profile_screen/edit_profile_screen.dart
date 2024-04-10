import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../../domain/core/utils/image_provider.dart';
import '../../../../infrastructure/core/enum/image_type.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/gradient_button.dart';

class EditProfileScreen extends StatelessWidget {
  final int userId;
  const EditProfileScreen({super.key, required this.userId});

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
                          onTap: () {
                            navigator<NavigationService>().goBack();
                          },
                          child: Center(
                              child:
                                  SvgPicture.asset(AssetConstants.arrowLeft))),
                      actions: const []),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: 100.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 52.w,
                                height: 33.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            CustomImageProvider.getImageUrl(
                                                state.user!.coverImage,
                                                ImageType.other)),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: Border.all(
                                      width: .1.w,
                                      color: colorScheme.background
                                          .withOpacity(.5),
                                    )),
                              ),
                              Container(
                                width: 52.w,
                                height: 33.h,
                                decoration: BoxDecoration(
                                    color: colorScheme.surface.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: Border.all(
                                      width: .1.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(.5),
                                    )),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<EditProfileCubit>()
                                        .onSelectCoverImage();
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AssetConstants.editIcon,
                                      height: 3.5.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            width: 35.w,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 23.w,
                                    width: 23.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: colorScheme.surface,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                CustomImageProvider.getImageUrl(
                                                    state.user!.profileImage,
                                                    ImageType.profile)))),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<EditProfileCubit>()
                                          .onProfileImageChange();
                                    },
                                    child: SvgPicture.asset(
                                      AssetConstants.editIcon,
                                      height: 3.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PROFILE',
                                  style: textTheme.bodySmall!.copyWith(),
                                ),
                                SizedBox(
                                  height: .7.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Name',
                                      style: textTheme.bodyMedium!.copyWith(
                                        color: colorScheme.background,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    // Text(
                                    //   state.user?.fullName ?? '',
                                    //   style: textTheme.bodyMedium!.copyWith(),
                                    // )
                                    Expanded(
                                      child: CustomTextField(
                                        borderLess: true,
                                        controller: state.nameEditingController,
                                        textStyle: textTheme.bodyMedium!
                                            .copyWith(
                                                color: colorScheme.background),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'BIO',
                                  style: textTheme.bodySmall!.copyWith(),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextField(
                                  maxLines: 2,
                                  textStyle: textTheme.bodyMedium!
                                      .copyWith(color: colorScheme.background),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.w),
                                  borderColor: colorScheme.background,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: GradientButton(
                                height: 10.w,
                                width: 25.w,
                                text: 'Save',
                                textStyle: textTheme.bodySmall!.copyWith(
                                    color: colorScheme.background,
                                    fontWeight: FontWeight.w600),
                                onTap: () {}),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'You can edit your username in ',
                                style: textTheme.bodySmall!.copyWith()),
                            TextSpan(
                                text: 'Account Settings',
                                style: textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: colorScheme.background
                                        .withOpacity(.9))),
                          ])),
                          // SizedBox(
                          //   height: 5.h,
                          // )
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
