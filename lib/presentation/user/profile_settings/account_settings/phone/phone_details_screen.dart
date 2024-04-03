import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../application/user/phone/phone_details/phone_details_cubit.dart';
import '../../../../../domain/core/configs/injection.dart';
import '../../../../../domain/core/constants/asset_constants.dart';
import '../../../../../domain/core/constants/string_constants.dart';
import '../../../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/gradient_button.dart';

class PhoneDetailsScreen extends StatelessWidget {
  final String phoneNumber;
  const PhoneDetailsScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>PhoneDetailsCubit(
          PhoneDetailsState.initial(phoneNumber: phoneNumber)),
      child: const PhoneDetailsScreenConsumer(),
    );
  }
}

class PhoneDetailsScreenConsumer extends StatelessWidget {
  const PhoneDetailsScreenConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return BlocConsumer<PhoneDetailsCubit, PhoneDetailsState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: PhoneScreenConstants.title,
            leading: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Center(
                child: SvgPicture.asset(AssetConstants.arrowLeft),
              ),
            ),
            actions: const [],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  state.phoneNumber,
                  style: textTheme.bodyLarge!
                      .copyWith(color: colorScheme.background),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  PhoneScreenConstants.youHaveAddedThisNumber,
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.background.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.3.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  PhoneScreenConstants.whoCanSeeYourNumber,
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.scrim, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GradientButton(
                  text: PhoneScreenConstants.deleteNumber,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const DeleteEmailModalSheet();
                        });
                  },
                  height: 5.h,
                  textStyle: textTheme.bodySmall!.copyWith(
                    color: colorScheme.background,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class DeleteEmailModalSheet extends StatelessWidget {
  const DeleteEmailModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 12.w,
              height: .5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Center(
                  child: Text(
                    PhoneScreenConstants.deleteNumber,
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
                GestureDetector(
                    onTap: () {
                      navigator<NavigationService>().goBack();
                    },
                    child: SvgPicture.asset(AssetConstants.closeIcon))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              PhoneScreenConstants.deletePhoneDescription,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(
                fontSize: 15.5.sp,
                color: colorScheme.background.withOpacity(.7),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            GradientButton(
              text: PhoneScreenConstants.submit,
              onTap: () {
                navigator<NavigationService>().navigateTo(UserRoutes.accountSettingsRoute);

              },
              height: 5.h,
              textStyle: textTheme.bodySmall!.copyWith(
                color: colorScheme.background,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            MaterialButton(
              onPressed: () {
                navigator<NavigationService>().goBack();
              },
              child: Text(
                PhoneScreenConstants.cancel,
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
