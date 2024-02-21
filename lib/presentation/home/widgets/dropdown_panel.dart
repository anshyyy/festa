import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../infrastructure/event/dtos/filter_value/filter_value_dto.dart';

class DropView extends StatelessWidget {
  final List<FilterValueDto> filters;
  final void Function(String name,String? value)? onBack;
  const DropView({
    super.key,
    required this.filters,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort by',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15.sp,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: 1.h,
          ),
          ...filters.map((e) => Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: GestureDetector(
                  onTap: () {
                    if (onBack != null) onBack!(e.name, e.value);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: e.isApplied
                                ? FontWeight.w600
                                : FontWeight.normal),
                      ),
                      SvgPicture.asset(e.isApplied
                          ? AssetConstants.selectedRadio
                          : AssetConstants.unSelectedRadio)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
