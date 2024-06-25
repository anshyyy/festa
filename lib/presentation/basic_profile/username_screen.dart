import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/profile/add_username/add_username_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/rounded_arrow_button.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;

    return BlocProvider(
      create: (context) => AddUsernameCubit(
          AddUsernameState.initial(serverUrl: appConfig.serverUrl)),
      child: const UsernameScreenConsumer(),
    );
  }
}

class UsernameScreenConsumer extends StatelessWidget {
  const UsernameScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
// final textTheme = themeData.textTheme;
    return BlocConsumer<AddUsernameCubit, AddUsernameState>(
      listener: (context, state) {
        if (state.isSuccess && !state.isFailure) {
          Provider.of<AppStateNotifier>(context, listen: false).updateUser(user: state.user);
          navigator<NavigationService>().navigateTo(
            UserRoutes.mainNavRoute,
            queryParams: {
              'routeIndex':'0'
            },
            isClearStack: true,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.h,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    UsernameScreenConstants.chooseYourUsername,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextField(
                    controller: state.usernameInputController,
                    hintText: UsernameScreenConstants.typeHere,
                    hintTextStyle: Theme.of(context).textTheme.bodyMedium,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                    isFill: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 2.h),
                    onChanged: (value) {
                      context
                          .read<AddUsernameCubit>()
                          .onUsernameChange(username: value);
                    },
                    helperText: state.isSuccess ? UsernameScreenConstants.usernameAvailable : state.isFailure? UsernameScreenConstants.usernameUnavailable : '',
                    suffixIcon: state.isLoading
                        ? Image.asset(
                            AssetConstants.bubbleLoader,
                            height: 3.5.h,
                          )
                        : state.isSuccess
                            ? SvgPicture.asset(AssetConstants.circledTick,
                                height: 3.h,
                                colorFilter: ColorFilter.mode(
                                    colorScheme.inversePrimary,
                                    BlendMode.srcIn))
                            : state.isFailure
                                ? SvgPicture.asset(AssetConstants.stopIcon,
                                    height: 3.h,
                                    colorFilter: ColorFilter.mode(
                                        colorScheme.error, BlendMode.srcIn))
                                : GestureDetector(
                                    onTap: () {
                                      context
                                          .read<AddUsernameCubit>()
                                          .clearTextField();
                                    },
                                    child: SvgPicture.asset(
                                        AssetConstants.closeIcon)),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RoundedArrowButton(
                      height: 6.h,
                      width: 6.h,
                      contentIcon: AssetConstants.longArrowRight,
                      isEnabled: state.isUpdateEnabled && !state.isLoading,
                      onTap: () {
                        context.read<AddUsernameCubit>().addUserName();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
