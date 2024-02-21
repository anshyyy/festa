import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';

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
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          margin: EdgeInsets.only(right: 2.w),
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
                label ?? '',
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.background,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              icon != null
                  ? SvgPicture.asset(
                      icon!,
                      height: 1.5.h,
                    )
                  : Container()
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
