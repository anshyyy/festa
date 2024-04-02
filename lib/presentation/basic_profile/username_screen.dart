import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    return BlocConsumer<AddUsernameCubit, AddUsernameState>(
      listener: (context, state) {
        if(state.isSuccess && !state.isFailure){
          navigator<NavigationService>().navigateTo(UserRoutes.mainNavRoute, isClearStack: true,);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h,),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
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
                    height: 2.h,
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
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                    onChanged: (value) {
                      context
                          .read<AddUsernameCubit>()
                          .onUsernameChange(username: value);
                    },
                    suffixIcon: state.isLoading
                        ? Image.asset(
                            AssetConstants.bubbleLoader,
                            height: 8.w,
                          )
                        : state.isFailure
                            ? SvgPicture.asset(
                                AssetConstants.stopIcon,
                                color: Theme.of(context).colorScheme.error,
                              )
                            : SvgPicture.asset(
                                AssetConstants.circledTick,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RoundedArrowButton(
                      height: 6.h,
                      width: 6.h,
                      contentIcon: AssetConstants.longArrowRight,
                      isEnabled: state.isUpdateEnabled,
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
