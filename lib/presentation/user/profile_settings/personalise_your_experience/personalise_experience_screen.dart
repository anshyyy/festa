import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/profile/gender_selection/cubit/gender_selection_cubit.dart';
import '../../../../application/user/personalisation_cubit/personalisation_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../infrastructure/user/dtos/personalization_menu/personalization_menu_dto.dart';
import '../../../../infrastructure/user/dtos/personalize_option/personalize_option_dto.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/gradient_button.dart';
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
      listener: (context, state) {},
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
              actions: const []),
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
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.w,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            PersonalizedMenuCard(
                                currentMenu: const PersonalizationMenuDto(
                                    title: 'gender'),
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return const GenderUpdationModalSheet();
                                    },
                                  );
                                }),
                            ...state.personalizationList.map((currentMenu) {
                              return PersonalizedMenuCard(
                                currentMenu: currentMenu,
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return PersonalizedMenuModalSheet(
                                          personalizedOptions:
                                              currentMenu.list!,
                                          title: currentMenu.title,
                                        );
                                      }).then((value) {
                                    if (value != null) {
                                      if (value['list']
                                          is List<PersonalizationOptionDto>) {
                                        context
                                            .read<PersonalisationCubit>()
                                            .updatePersonalizedMenu(
                                                menuTitle: value['title'],
                                                updatedList: value['list']);
                                      }
                                    }
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                ),
                Text(
                  PersonalizeExperienceScreenConstants.changePersonlize,
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background,
                    fontSize: 14.sp,
                  ),
                ),
                // SizedBox(
                //   height: 8.h,
                // ),
              ],
            ),
          )),
        );
      },
    );
  }
}

class GenderUpdationModalSheet extends StatelessWidget {
  const GenderUpdationModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => GenderSelectionCubit(
        GenderSelectionState.initial(
          appStateNotifier: appStateNotifier,
          serverUrl: appConfig.serverUrl,
          // selectedSex: appStateNotifier.user!.gender
        ),
      )..init(gender: appStateNotifier.user!.gender),
      child: const GenderUpdationConsumer(),
    );
  }
}

class GenderUpdationConsumer extends StatelessWidget {
  const GenderUpdationConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocConsumer<GenderSelectionCubit, GenderSelectionState>(
      listener: (context, state) {
        if (state.genderUpdateSuccess && !state.genderUpdateFailure) {
          appStateNotifier.updateAfterAuthChange(
              isAuthorized: true, user: state.user);
          navigator<NavigationService>().goBack();
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 12.w,
                  height: .5.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Gender',
                style: textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Text(
                  PersonalizeExperienceScreenConstants.genderSettingChange,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(.5),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<GenderSelectionCubit>().onSexSelect(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.lsOFSex[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontSize: 16.sp,
                                    )),
                            index == state.selectedSex
                                ? SvgPicture.asset(AssetConstants.selectedRadio)
                                : SvgPicture.asset(
                                    AssetConstants.unSelectedRadio),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.lsOFSex.length,
              ),
              SizedBox(
                height: 2.h,
              ),
              GradientButton(
                  width: 30.w,
                  height: 12.w,
                  textStyle: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600),
                  text: 'Save',
                  onTap: () {
                    context.read<GenderSelectionCubit>().onContinue();
                  }),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  PersonalizeExperienceScreenConstants.changePersonlize,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.background.withOpacity(.7),
                      fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PersonalizedMenuCard extends StatelessWidget {
  const PersonalizedMenuCard({
    super.key,
    required this.currentMenu,
    required this.onTap,
  });

  final PersonalizationMenuDto currentMenu;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.w),
        decoration: BoxDecoration(
            border: Border.all(
                color: colorScheme.background.withOpacity(.5), width: .1.w),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(getIcon(currentMenu.title)),
            const Spacer(),
            Text(
              currentMenu.title,
              style: textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getIcon(String title) {
    switch (title.toLowerCase()) {
      case 'party':
        return AssetConstants.partiesIcon;
      case 'music':
        return AssetConstants.musicIcon;
      case 'crowd':
        return AssetConstants.crowdIcon;
      case 'cuisine':
        return AssetConstants.cuisineIcon;
      case 'drinks':
        return AssetConstants.drinkPersonalizeIcon;
      default:
        return AssetConstants.genderIcon;
    }
  }
}
