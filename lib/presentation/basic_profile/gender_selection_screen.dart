import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/profile/gender_selection/cubit/gender_selection_cubit.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../widgets/gradient_button.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderSelectionCubit(GenderSelectionState.initial()),
      child: const GenderSelectionScreenConsumer(),
    );
  }
}

class GenderSelectionScreenConsumer extends StatelessWidget {
  const GenderSelectionScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenderSelectionCubit, GenderSelectionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 5.h),
              child: Column(
                children: [
                  // const Spacer(flex: 1,),
                  Text(
                    GenderSelectionScreenConstants.addGenderText,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24.sp,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                  SizedBox(
                      height: 1.h,
                    ),
                  Text(
                    GenderSelectionScreenConstants.addText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  // const Spacer(flex: 1,),
                  SizedBox(height: 5.h,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<GenderSelectionCubit>()
                              .onSexSelect(index);
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
                                Text(
                                  state.lsOFSex[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      
                                ),
                                index == state.selectedSex
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
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
                  const Spacer(),
                  GradientButton(
                      text: BasicProfileScreenConstants.continueText,
                      onTap: () {
                        context.read<GenderSelectionCubit>().onContinue();
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
