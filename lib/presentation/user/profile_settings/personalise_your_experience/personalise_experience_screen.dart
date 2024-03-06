import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/other_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../widgets/custom_appbar.dart';

class PersonalizeYourExperienceScreen extends StatelessWidget {
  const PersonalizeYourExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersonalizeYourExperienceConsumer();
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

    return Scaffold(
      appBar: CustomAppBar(
          title: ProfileAndSettingsScreenConstants.personalizeYourExperience,
          leading: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Center(child: SvgPicture.asset(AssetConstants.arrowLeft))),
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
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(.7),
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
                  itemCount: OtherConstants.personalizationMenuList.length,
                  itemBuilder: (_, index) {
                    final currentMenu =
                        OtherConstants.personalizationMenuList[index];
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return MenuModalSheet();
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 4.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: colorScheme.background.withOpacity(.5),
                                width: .1.w),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(currentMenu.icon),
                            const Spacer(),
                            Text(
                              currentMenu.title,
                              style: textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              currentMenu.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
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
  }
}

class MenuModalSheet extends StatelessWidget {
  const MenuModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final chipNames = [
      'Networking',
      'Nature',
      'Events',
      'Arts',
      'Research',
      'Socialising',
      'Learning',
      'Tech',
      'Intellectualism',
      'Deisgn',
      'Imagination',
      'Belief',
      'Innovation',
      'Pets',
      'Expression',
      'Camping',
      'Cinema',
      'Spirituality',
      'Community',
      'Mental Health'
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 5.h,
          ),
          Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  'Crowd',
                  style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      ),
                ),
              )),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: SvgPicture.asset(AssetConstants.closeIcon)),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            PersonalizeExperienceScreenConstants.totallyUptoYouMessage,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall!.copyWith(
                color: colorScheme.background.withOpacity(.8),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 2.w,
                alignment: WrapAlignment.center,
                runSpacing: 2.w,
                children: List.generate(
                    chipNames.length,
                    (index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.w),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: .2.w,
                                  color:
                                      colorScheme.background.withOpacity(.1)),
                              borderRadius: BorderRadius.circular(50.w)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AssetConstants.accountSettings),
                              SizedBox(width: 1.w,),
                              Text(
                                chipNames[index],
                                style: textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.background,
                                ),
                              )
                            ],
                          ),
                        )),
              ),
            ),
          ),
          Center(
            child: Text(
              PersonalizeExperienceScreenConstants.changePersonlize,
              style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.background.withOpacity(.7),
                  fontSize: 14.sp),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
        ],
      ),
    );
  }
}
