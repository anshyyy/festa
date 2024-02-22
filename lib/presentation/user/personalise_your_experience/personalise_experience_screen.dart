import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/custom_appbar.dart';

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
    return Scaffold(
      appBar: CustomAppBar(
          title: UserProfileScreenConstants.personalizeYourExperience,
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
              height: 1.h,
            ),
            Center(
              child: Text(
                PersonalizeExperienceScreenConstants.profilePrompt,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.w,
                children: [
                  Container(
                    width: 10.h,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: .1.w,
                            color: Theme.of(context).colorScheme.background)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetConstants.appleIcon),
                          Text(
                            'Gender',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Who can see your gender',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                  Container(
                    width: 10.h,
                    height: 10.h,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10.h,
                    height: 10.h,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10.h,
                    height: 10.h,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10.h,
                    height: 10.h,
                    color: Colors.red,
                  ),
                  Container(
                    width: 10.h,
                    height: 10.h,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Text(
              PersonalizeExperienceScreenConstants.changePersonlize,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      )),
    );
  }
}
