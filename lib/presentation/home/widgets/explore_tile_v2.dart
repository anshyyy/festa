import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/filter/filter_cubit.dart';

class ExploreTile extends StatelessWidget {
  const ExploreTile({
    super.key,
    required this.identifier,
    this.label,
    this.icon, this.onTap,
  });

  final String? label;
  final String? icon;
  final String identifier;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => FilterCubit()..onFilterChanged(filterValue: 'sort'),
      child: GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        margin: EdgeInsets.only(right: 2.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: .1.w,
            color: Theme.of(context).colorScheme.background,
          ),
          borderRadius: BorderRadius.circular(50.w),
          color: themeData.colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Text(
              label ?? '',
              style: themeData.textTheme.bodySmall!.copyWith(
                color: themeData.colorScheme.background,
                fontWeight: FontWeight.w600,
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
      ),
    ),
    );
  }
}



