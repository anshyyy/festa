import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../infrastructure/notification/dtos/notification/notification_dto.dart';

class NotificationsWidget extends StatelessWidget {
  final List<NotificationDto> lsOfNotification;
  const NotificationsWidget({
    super.key,
    required this.lsOfNotification,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 3.5.w,
            foregroundImage: const NetworkImage(
                'https://plus.unsplash.com/premium_photo-1681398821763-f95bd74a96da?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          title: Text(
            lsOfNotification[index].content.title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  // fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
          subtitle: Text(
            lsOfNotification[index].content.body,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  // fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
        );
      },
      itemCount: lsOfNotification.length,
    );
  }
}
