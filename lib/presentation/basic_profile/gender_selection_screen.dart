import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/basic_profile/gender_selection/cubit/gender_selection_cubit.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../core/primary_button.dart';

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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 5.h),
            child: Column(
              children: [
                Text(
                  GenderSelectionScreenConstants.addGenderText,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),
                Text(
                  GenderSelectionScreenConstants.addText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                ),
                Expanded(
                  child: ListView.builder(
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
                            color: Theme.of(context).colorScheme.onPrimary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSecondary,
                              width: 1,
                            ),
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
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                ),
                                SizedBox(
                                  width: 25.h,
                                ),
                                index == state.selectedSex
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.lsOFSex.length,
                  ),
                ),
                const Spacer(),
                PrimaryButton(
                    text: BasicProfileScreenConstants.continueText,
                    function: () {
                      context.read<GenderSelectionCubit>().onContinue();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
