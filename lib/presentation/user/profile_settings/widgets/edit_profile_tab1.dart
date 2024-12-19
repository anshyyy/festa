import 'package:app/presentation/user/profile_settings/widgets/gender_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/extensions/string_extension.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/gradient_text.dart';
import 'setting_tile.dart';

class EditProfileTab1 extends StatelessWidget {
  const EditProfileTab1({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);

    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              if (state.profileImageUrl?.isNotEmpty ?? false)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        width: 24.25.h,
                        height: 24.25.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    state.profileImageUrl ?? "")),
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(200))),
                    Positioned(
                      bottom: -13,
                      left: 10.h,
                      child: SideTile(
                        onTap: () {
                          context
                              .read<EditProfileCubit>()
                              .onProfileImageChange();
                        },
                        colorScheme: colorScheme,
                        asset: AssetConstants.editIcon,
                      ),
                    )
                  ],
                ),
              if (state.profileImageUrl?.isEmpty ?? false)
                Container(
                  width: 24.25.h,
                  height: 24.25.h,
                  decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(200)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SideTile(
                          onTap: () {
                            context
                                .read<EditProfileCubit>()
                                .onCameraImageChange();
                          },
                          colorScheme: colorScheme,
                          asset: AssetConstants.cameraIcon,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        SideTile(
                          onTap: () {
                            context
                                .read<EditProfileCubit>()
                                .onProfileImageChange();
                          },
                          colorScheme: colorScheme,
                          asset: AssetConstants.galleryIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 1.h),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: .1.w,
                color: Colors.grey[700],
              ),
              SizedBox(height: 1.h),
              SettingTile(
                isEmpty: state.user!.fullName.isEmpty,
                prefixIcon: AssetConstants.usernameIcon,
                label: EditProfileScreenConstants.fullName,
                suffixIcon: AssetConstants.arrowRight,
                detail: appStateNotifier.user!.fullName,
                onTap: () => navigator<NavigationService>().navigateTo(
                    UserRoutes.usernameSettingsScreenRoute,
                    queryParams: {
                      'fullname': state.user?.fullName == null
                          ? ''
                          : state.user!.fullName
                    }),
              ),
              SettingTile(
                  prefixIcon: AssetConstants.usernameIcon,
                  label: AccountSettingScreenConstants.username,
                  suffixIcon: '',
                  detail:
                      state.user?.tag != null ? '@${state.user?.tag!.tag}' : '',
                  onTap: () {}),
              SettingTile(
                  prefixIcon: AssetConstants.candleIcon,
                  label: AccountSettingScreenConstants.dateOfBirth,
                  suffixIcon: '',
                  detail: StringExtension.formatDateTimeNormal(
                      DateTime.parse(state.user!.dob)),
                  onTap: () {}),
              SettingTile(
                  prefixIcon: AssetConstants.genderIcon2,
                  label: EditProfileScreenConstants.gender,
                  suffixIcon: AssetConstants.arrowRight,
                  detail: state.gendertToRender,
                  isEmpty: state.user!.gender.isEmpty,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (BuildContext context) {
                        return GenderSelectionBottomSheet(
                            userGender: state.user?.gender ?? '');
                      },
                    ).then((val) {
                      //print("this is updated $val");
                      if (val != null) {
                        final Map<String, dynamic> returnedData =
                            val as Map<String, dynamic>;
                        final UserDto user = returnedData['user'];
                        final userGender = returnedData['userGender'];

                        context
                            .read<EditProfileCubit>()
                            .onGenderChanged(gender: userGender, user: user);
                      }
                    });
                  }),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 4.w),
                  Text(
                    'BIO',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: colorScheme.background),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 3.6.w, right: 3.6.w),
                child: InkWell(
                  onTap: () async {
                    context.read<EditProfileCubit>().toggleBottomSheet();
                    final editProfileCubit =
                        BlocProvider.of<EditProfileCubit>(context);
                    showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: editProfileCubit,
                            child: BlocConsumer<EditProfileCubit,
                                EditProfileState>(
                              listener: (context, state) {
                                if (!state.showBottomSheet) {
                                  Navigator.pop(context);
                                }
                              },
                              builder: (context, state) {
                                return Container(
                                  height: 95.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.h, vertical: 1.h),
                                  decoration:
                                      const BoxDecoration(color: Colors.black),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: SvgPicture.asset(
                                                AssetConstants.closeIcon),
                                          ),
                                          Text(
                                            "Bio",
                                            style: TextStyle(
                                                color: colorScheme.background),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (state.bioSaveEnabled) {
                                                context
                                                    .read<EditProfileCubit>()
                                                    .onBioChange();
                                              }

                                              // Navigator.pop(context,true);
                                            },
                                            child: state.isLoading
                                                ? Image.asset(
                                                    color: colorScheme.primary,
                                                    AssetConstants.bubbleLoader,
                                                    height: 3.5.h,
                                                  )
                                                : GradientText(
                                                    text: 'Save',
                                                    colors: [
                                                      if (state
                                                          .bioSaveEnabled) ...[
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                      ],
                                                      if (!state
                                                          .bioSaveEnabled) ...[
                                                        Colors.grey.shade600,
                                                        Colors.grey.shade400
                                                      ]
                                                    ],
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      TextField(
                                          controller: state.bioTextController,
                                          maxLines: null,
                                          keyboardType: TextInputType.multiline,
                                          cursorWidth: 2.0,
                                          cursorHeight: 26.0,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your bio',
                                            hintStyle: TextStyle(
                                                fontSize:
                                                    14.0), // Smaller hint text size
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical:
                                                    8.0), // Adjust padding if needed
                                          ),
                                          autofocus: true,
                                          onChanged: (val) {
                                            context
                                                .read<EditProfileCubit>()
                                                .validateBio(val);
                                          }),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: CustomTextField(
                    readOnly: true,
                    maxLines: 2,
                    controller: state.bioTextController,
                    textStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.background, fontFamily: null),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                    borderColor: colorScheme.background,
                    onChanged: (val) {},
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SideTile extends StatelessWidget {
  const SideTile(
      {super.key,
      required this.colorScheme,
      required this.asset,
      required this.onTap,
      this.isOnCaraousel = false});

  final ColorScheme colorScheme;
  final String asset;
  final VoidCallback? onTap;
  final bool isOnCaraousel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 5.h,
        height: 5.h,
        decoration: BoxDecoration(
            color: isOnCaraousel
                ? colorScheme.surfaceContainer.withOpacity(0.8)
                : colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Adjust opacity for shadow effect
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(1, 5), // controls the shadow position
              ),
            ]),
        child: Center(
          child: SvgPicture.asset(asset),
        ),
      ),
    );
  }
}
