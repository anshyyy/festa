import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../widgets/custom_textfield.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSearch;

  const SearchAppBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff141414),
      elevation: 0,
      title: SizedBox(
        height: 40,
        child: CustomTextField(
          isFill: true,
          // borderLess: true,
          borderRadius: 10,
          textStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.background,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AssetConstants.searchIcon,
              height: 20,
              width: 20,
            ),
          ),
          hintText: "Search",
          hintTextStyle: TextStyle(
            color: const Color(0xFFABB3BB),
            fontSize: 14.sp,
          ),
          fillColor: Colors.grey[900],
          onChanged: onSearch,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
