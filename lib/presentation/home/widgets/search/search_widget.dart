
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/home/cubit/home_cubit.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../domain/core/constants/string_constants.dart';
import '../../../widgets/custom_textfield.dart';

class HomeSearch extends StatelessWidget{
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<HomeCubit>().toggleSearch(flag: false);
          },
          child: Container(
            height: 100.h,
            color: state.isSearchChanged?Theme.of(context).colorScheme.onSurface: Colors.transparent.withOpacity(.5),
            child: Column(
              children: [
                CustomTextField(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 4.w),
                  prefixIcon: SvgPicture.asset(AssetConstants.searchIcon, height: 3.5.h,),
                  suffixIcon: SvgPicture.asset(AssetConstants.closeIcon),
                  hintText: HomeScreenConstants.searchEvent,
                  hintTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                      ),
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  isFill: true,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  onChanged:(p0) {
                    context.read<HomeCubit>().onSearchChange(query: p0);
                  },
                ),
                // ListView.builder(
                //   itemCount: 1,
                //   shrinkWrap: true,
                //   itemBuilder:(context, index) {
                //   return Row(
                //     children: [
                //       Container(
                //         color: Theme.of(context).colorScheme.surface,
                //         height: 3.5.h,
                //         width: 3.5.h,
                //       ),
                //       SizedBox(width: 2.w,),
                //       const Text('Banglore')
                //     ],
                //   );
                // },)
              ],
            ),
          ),
        );
      },
    );
  }
}
