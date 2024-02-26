import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_text.dart';
import 'widgets/not_notifications_screen.dart';
import 'widgets/notifications_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
          title: NotificationsScreenConstants.notifications,
          leading: GestureDetector(
            onTap: (){
              navigator<NavigationService>().goBack();
            },
            child: Center(child: SvgPicture.asset(AssetConstants.arrowLeft))),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: GradientText(
                text: NotificationsScreenConstants.notificationsFilter,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary
                ],
              ),
            )
          ]),
      body: const SafeArea(
        child: 2 == 2 ? NotificationsWidget() : NoNotificationsWidget(),
      ),
    );
  }
}
