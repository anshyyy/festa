import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/user/user_profile/user_profile_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/dynamic_link.dart';
import '../widgets/custom_outlined_button.dart';
import 'widgets/user_profile_widget.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;
  const UserProfileScreen(
      {super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => UserProfileCubit(UserProfileState.initial(
        serverUrl: appConfig.serverUrl,
        userId: userId,
      ))
        ..init(),
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
    final AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.isLoading
              ? const SizedBox()
              : Stack(
                  children: [
                    Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                            color:
                                colorScheme.secondaryContainer.withOpacity(.3)),
                        child: Stack(
                          children: [
                            state.coverImage != null &&
                                    state.coverImage!.isNotEmpty
                                ? SizedBox(
                                    height: 100.h,
                                    child: CachedNetworkImage(
                                      imageUrl: state.coverImage ?? '',
                                      fit: BoxFit.cover,
                                    ))
                                : appStateNotifier.user!.id != state.userId
                                    ? SizedBox()
                                    : Center(
                                        child: CustomOutlinedButton(
                                          onTap: () {
                                            context
                                                .read<UserProfileCubit>()
                                                .onSelectCoverImage();
                                          },
                                          text: UserProfileScreenConstants
                                              .uploadYourHighlight,
                                          textStyle:
                                              textTheme.bodySmall!.copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: colorScheme.background,
                                          ),
                                          width: 35.w,
                                          height: 4.h,
                                        ),
                                      ),
                            appStateNotifier.user!.id != state.userId
                                ? SizedBox()
                                : SafeArea(
                                    child: GestureDetector(
                                      onTap: () {
                                        navigator<NavigationService>()
                                            .navigateTo(
                                          UserRoutes.profileAndSettingsRoute,
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.w, top: 1.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SvgPicture.asset(
                                                AssetConstants.hamBurgerMenu),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        )),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UserProfile(),
                      ],
                    ),
                    // state.qrExpandedView
                    1==2
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                    height: 50.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                        color: colorScheme.surface,
                                        border: Border.all(
                                          color: colorScheme.background,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.w),
                                    child: Center(
                                      child: QrImageView(
                                        data: DynamicLinkUtil.generateLink(
                                            AppConstants.user,
                                            state.userId.toString()),
                                        eyeStyle: QrEyeStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            eyeShape: QrEyeShape.square),
                                        dataModuleStyle: QrDataModuleStyle(
                                            dataModuleShape:
                                                QrDataModuleShape.square,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox()
                  ],
                ),
        );
      },
    );
  }
}
