import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/gradient_button.dart';

class ReportModalSheet extends StatelessWidget {
  const ReportModalSheet({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.themeData,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 5.w,
          right: 5.w),
      // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
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
            height: 3.5.h,
          ),
          Text(
            'Report something that doesn’t look right',
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.background,
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            isFill: true,
            maxLines: 3,
            fillColor: colorScheme.onSecondaryContainer,
            hintText: DeleteAccountScreenConstants.typeHere,
            hintTextStyle: textTheme.bodySmall!.copyWith(
              fontSize: 16.sp,
              color: colorScheme.background.withOpacity(.6),
            ),
            textStyle: textTheme.bodyMedium!.copyWith(
              color: colorScheme.background,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetConstants.incogIcon,
                width: 4.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'We don’t let Bob’s Bar know who reported them.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          GradientButton(
            text: 'Submit',
            onTap: () {},
            // isEnabled: state.deleteEnabled && !state.isLoading,
            textStyle: textTheme.bodySmall!.copyWith(
              fontSize: 15.5.sp,
              color: 1 == 0
                  //  !state.deleteEnabled && !state.isLoading
                  ? colorScheme.secondaryContainer
                  : colorScheme.background,
              fontWeight: FontWeight.w600,
            ),
            height: 5.5.h,
          ),
          SizedBox(
            height: .5.h,
          ),
          MaterialButton(
            minWidth: 100.w,
            onPressed: () {
              navigator<NavigationService>().goBack();
            },
            child: Text(
              AccountPrivacyScreenConstants.cancel,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: themeData.colorScheme.background,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
