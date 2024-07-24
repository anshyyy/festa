import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';
import '../../../domain/core/constants/asset_constants.dart';

class ExploreTile extends StatelessWidget {
  const ExploreTile({
    super.key,
    required this.isSelected,
    this.label,
    this.icon,
    this.onTap,
  });

  final String? label;
  final String? icon;
  final bool isSelected;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final child = BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          margin: EdgeInsets.only(right: 2.w,bottom: 1.w),
          width: label.toString().toLowerCase() == 'sort'
              ? state.sortDropdownOpen
                  ? 45.w
                  : null
              : null,
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(
                    width: .2.w,
                    color: Theme.of(context).colorScheme.background,
                  )
                : null,
            borderRadius: BorderRadius.circular(50.w),
            color: themeData.colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Text(
                label.toString().toLowerCase() == 'sort' ? state.sortDisplayName :label!,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.background,
                  fontSize: 14.5.sp,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
             icon != null
  ? (icon!.isNotEmpty ? SvgPicture.asset(icon!, height: 2.1.h) : SizedBox.shrink())
  : SvgPicture.asset(AssetConstants.closeIcon, height: 4.w)
            ],
          ),
        );
      },
    );
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
