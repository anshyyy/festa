import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/personalisation_cubit/personalize_menu_cubit/personalize_menu_cubit.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../infrastructure/user/dtos/personalize_option/personalize_option_dto.dart';
import '../../../../widgets/gradient_button.dart';

class PersonalizedMenuModalSheet extends StatelessWidget {
  final List<PersonalizationOptionDto> personalizedOptions;
  final String title;
  const PersonalizedMenuModalSheet({
    super.key,
    required this.personalizedOptions,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalizeMenuCubit(
          PersonalizeMenuState.initial(menuOptionsList: personalizedOptions)),
      child: Consumer(title: title),
    );
  }
}

class Consumer extends StatelessWidget {
  const Consumer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<PersonalizeMenuCubit, PersonalizeMenuState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
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
                  Center(
                    child: Text(
                      title,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.background,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
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
                        state.menuOptionsList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                context
                                    .read<PersonalizeMenuCubit>()
                                    .onChipPressed(
                                        type:
                                            state.menuOptionsList[index].type);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    color:
                                        !state.menuOptionsList[index].isSelected
                                            ? colorScheme.surface
                                            : colorScheme.background
                                                .withOpacity(.1),
                                    border: Border.all(
                                        width: .2.w,
                                        color:state.menuOptionsList[index].isSelected? colorScheme.primary: colorScheme.background
                                            .withOpacity(.1)),
                                    borderRadius: BorderRadius.circular(50.w)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      state.menuOptionsList[index].text,
                                      style: textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: colorScheme.background,
                                      ),
                                    )
                                  ],
                                ),
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
                height: 4.h,
              ),
              GradientButton(
                text: 'Submit',
                onTap: () {
                  navigator<NavigationService>().goBack(responseObject: {
                    'title': title,
                    'list': state.menuOptionsList
                  });
                },
                height: 5.h,
                textStyle: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
