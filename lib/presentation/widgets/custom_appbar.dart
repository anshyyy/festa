import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  Color? scaffoldBackgroundColor;
  Color? surfaceTintColor;

  CustomAppBar({
    super.key,
    required this.title,
    required this.leading,
    required this.actions,
    this.scaffoldBackgroundColor,
    this.surfaceTintColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: scaffoldBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      leading: leading,
    surfaceTintColor: surfaceTintColor,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.background,
            ),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
