import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../widgets/gradient_button.dart';

class TicketCategory extends StatelessWidget {
  final String categoryName;
  final int categoryItems;
  final double price;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const TicketCategory(
      {super.key,
      required this.categoryName,
      required this.categoryItems,
      this.onAdd,
      this.onRemove,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: .5.h,
              ),
              Text(
                '₹$price',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
            ],
          ),
          categoryItems == 0
              ? GradientButton(
                  text: 'Add',
                  onTap: onAdd,
                  height: 4.5.h,
                  width: 25.w,
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w600,
                      ),
                )
              : Row(
                  children: [
                    GestureDetector(
                      onTap: onRemove,
                      child: SvgPicture.asset(
                        AssetConstants.removeTicketIcon,
                        height: 3.h,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                      child: Center(
                        child: Text(
                          categoryItems.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onAdd,
                      child: SvgPicture.asset(
                        AssetConstants.addTicketIcon,
                        height: 3.h,
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
