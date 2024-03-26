import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/user/personalisation_cubit/personalisation_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../infrastructure/user/dtos/personalize_option/personalize_option_dto.dart';
import '../../../widgets/custom_appbar.dart';
import 'widgets/personalized_menu_drawer.dart';

class PersonalizeYourExperienceScreen extends StatelessWidget {
  const PersonalizeYourExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => PersonalisationCubit(
        PersonalisationState.initial(
          serverUrl: appConfig.serverUrl,
        ),
      )..init(),
      child: const PersonalizeYourExperienceConsumer(),
    );
  }
}

class PersonalizeYourExperienceConsumer extends StatelessWidget {
  const PersonalizeYourExperienceConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<PersonalisationCubit, PersonalisationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title:
                  ProfileAndSettingsScreenConstants.personalizeYourExperience,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
              actions: []),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Text(
                    PersonalizeExperienceScreenConstants.profilePrompt,
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.w,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      itemCount: state.personalizationList.length,
                      itemBuilder: (_, index) {
                        final currentMenu = state.personalizationList[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return PersonalizedMenuModalSheet(
                                    personalizedOptions: currentMenu.list,
                                    title: currentMenu.title,
                                  );
                                }).then((value) {
                                  if(value!=null){
                                    if(value['list'] is List<PersonalizationOptionDto>){
                                      context.read<PersonalisationCubit>().updatePersonalizedMenu(menuTitle: value['title'], updatedList: value['list']);
                                    }
                                  }
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 4.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        colorScheme.background.withOpacity(.5),
                                    width: .1.w),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                const Spacer(),
                                // SvgPicture.asset(currentMenu.icon),
                                const Spacer(),
                                Text(
                                  currentMenu.title,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // Text(
                                //   currentMenu.description,
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: textTheme.bodySmall!.copyWith(
                                //       color: Theme.of(context)
                                //           .colorScheme
                                //           .background
                                //           .withOpacity(.7),
                                //       fontWeight: FontWeight.w500,
                                //       fontSize: 14.sp),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Text(
                  PersonalizeExperienceScreenConstants.changePersonlize,
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
