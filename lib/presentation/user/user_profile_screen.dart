import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/user/user_profile/user_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/custom_outlined_button.dart';
import 'widgets/user_profile_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => UserProfileCubit(
          UserProfileState.initial(serverUrl: appConfig.serverUrl)),
      child: const UserProfileScreenConsumer(),
    );
  }
}

class UserProfileScreenConsumer extends StatelessWidget {
  const UserProfileScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Stack(
            children: [
              Container(
                height: 80.h,
                decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withOpacity(.3)),
                child: Stack(
                        children: [
                          state.profileImage != null
                    ?  SizedBox(
                              height: 100.h,
                              child: CachedNetworkImage(
                                imageUrl: state.profileImage!,
                                fit: BoxFit.cover,
                              )) : Center(
                        child: CustomOutlinedButton(
                          onTap: () {
                            context
                                .read<UserProfileCubit>()
                                .onSelectProfileImage();
                          },
                          text: UserProfileScreenConstants.uploadYourHighlight,
                          textStyle: textTheme.bodySmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.background,
                          ),
                          width: 35.w,
                          height: 4.h,
                        ),
                      ),
                          SafeArea(
                            child: GestureDetector(
                              onTap: () {
                                navigator<NavigationService>().navigateTo(UserRoutes.profileAndSettingsRoute);
                              },
                              child: Padding(
                                padding:  EdgeInsets.only(right: 5.w, top: 1.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                        AssetConstants.hamBurgerMenu),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const UserProfile(),
                 
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
