import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/notification/notification_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_text.dart';
import '../widgets/snackbar_alert.dart';
import 'widgets/not_notifications_screen.dart';
import 'widgets/notifications_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => NotificationCubit(
          NotificationState.initial(apiBaseUrl: appConfig.serverUrl))
        ..init(),
      child: const NotificationScreenConsumer(),
    );
  }
}

class NotificationScreenConsumer extends StatelessWidget {
  const NotificationScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state.isFailed && state.responseMsg.isNotEmpty) {
          CustomScaffoldMessenger.clearSnackBars(context);
          CustomScaffoldMessenger.showSnackBar(
            context,
            message: state.responseMsg,
          );
          context.read<NotificationCubit>().emitFromAnywhere(
                state: state.copyWith(isFailed: false, responseMsg: ''),
              );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: CustomAppBar(
              title: NotificationsScreenConstants.notifications,
              leading: GestureDetector(
                  onTap: () {
                    navigator<NavigationService>().goBack();
                  },
                  child: Center(
                      child: SvgPicture.asset(AssetConstants.arrowLeft))),
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
          body: SafeArea(
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.lsOfNotification.isNotEmpty
                    ? NotificationsWidget(
                        lsOfNotification: state.lsOfNotification,
                      )
                    : const NoNotificationsWidget(),
          ),
        );
      },
    );
  }
}
