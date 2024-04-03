import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';

class DeleteAccountModal extends StatelessWidget {
  const DeleteAccountModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProfileAndSettingsScreenConstants.deleteAccount,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  ProfileAndSettingsScreenConstants.deleteACWarning,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigator<NavigationService>()
                            .goBack(responseObject: true);
                      },
                      child: Text(
                        ProfileAndSettingsScreenConstants.yes,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigator<NavigationService>()
                            .goBack(responseObject: false);
                      },
                      child: Text(
                        ProfileAndSettingsScreenConstants.no,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
