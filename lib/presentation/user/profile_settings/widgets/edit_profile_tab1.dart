import 'package:app/presentation/user/profile_settings/widgets/gender_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/extensions/string_extension.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../widgets/custom_textfield.dart';
import 'setting_tile.dart';

class EditProfileTab1 extends StatelessWidget {
  const EditProfileTab1({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                            print('camera');
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
                  detail: state.user!.fullName,
                  onTap: () {}),
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
                  detail: state.user?.gender,
                  isEmpty: state.user!.gender.isEmpty,
                  onTap: () {
                    //TODO
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return GenderSelectionBottomSheet();
                      },
                    );
                  }),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 4.w),
                  Text(
                    "BIO",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: colorScheme.background),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 3.6.w, right: 3.6.w),
                child: CustomTextField(
                  maxLines: 2,
                  controller: state.bioTextController,
                  textStyle: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.background),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                  borderColor: colorScheme.background,
                  onChanged: (val) {
                    context.read<EditProfileCubit>().onBioChange();
                  },
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
