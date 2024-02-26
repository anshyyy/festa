import 'package:flutter/material.dart';

import 'grouped_notification.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          GroupedNotifications(
            header: 'Today',
            itemsCount: 1,
          ),
          GroupedNotifications(
            header: 'Yesterday',
            itemsCount: 3,
          ),
          GroupedNotifications(
            header: '7 days ago',
            itemsCount: 4,
          ),
          GroupedNotifications(
            header: '2 week ago',
            itemsCount: 5,
          ),
        ],
      ),
    );
  }
}
