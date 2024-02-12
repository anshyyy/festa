// ignore_for_file: unused_import

import '../../../domain/core/configs/injection.dart';

import '../../../domain/core/configs/app_config.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(15);

  final String? text;
  final bool isLeading;
  final bool isTrailing;

  final Widget? widget;
  const CustomAppBar({
    Key? key,
    this.text,
    this.widget,
    this.isLeading = false,
    this.isTrailing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading
          ? InkWell(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: SvgPicture.asset(
                AssetConstants.backArrowIcon,
                height: 8,
                width: 13,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      titleSpacing: isLeading ? 0 : 15,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: widget ??
          Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
    );
  }
}
