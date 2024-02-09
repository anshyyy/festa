// ignore_for_file: unused_import

import '../../../domain/core/configs/injection.dart';

import '../../../domain/core/configs/app_config.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final String? text;
  final bool isLeading;

  final Widget? widget;
  const CustomAppBar({
    super.key,
    this.text,
    this.widget,
    this.isLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading
          ? InkWell(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Image.asset(AssetConstants.arrowDown),
            )
          : null,
      automaticallyImplyLeading: false,
      titleSpacing: isLeading ? 0 : 15,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      title: widget ??
          Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
    );
  }
}
