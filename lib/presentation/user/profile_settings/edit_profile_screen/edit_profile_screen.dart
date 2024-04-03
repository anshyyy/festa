import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_textfield.dart';

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
      listener: (context, state) {},
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
                  body: SafeArea(
                      child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 60.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          state.user!.coverImage),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: .1.w,
                                    color:
                                        colorScheme.background.withOpacity(.5),
                                  )),
                            ),
                            Container(
                              width: 60.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                  color: colorScheme.surface.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: .1.w,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(.5),
                                  )),
                              child: Center(
                                child: SvgPicture.asset(
                                  AssetConstants.editIcon,
                                  height: 4.h,
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
                                  height: 25.w,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: colorScheme.surface,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: state.user?.profileImage !=
                                                      null &&
                                                  state.user!.profileImage
                                                      .isNotEmpty
                                              ? CachedNetworkImageProvider(
                                                  state.user!.profileImage)
                                              : Image.asset(AssetConstants
                                                      .defaultAvatarImage)
                                                  .image)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                  AssetConstants.editIcon,
                                  height: 3.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('PROFILE'),
                              SizedBox(height: 1.h,),
                              Row(
                                children: [
                                  Text('Name'),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(state.user!.fullName)
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Text('BIO'),
                              CustomTextField()
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
        );
      },
    );
  }
}
