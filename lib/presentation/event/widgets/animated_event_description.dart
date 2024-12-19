import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class AnimatedEventDescription extends StatefulWidget {
  final String description;

  const AnimatedEventDescription({Key? key, required this.description})
      : super(key: key);

  @override
  _AnimatedEventDescriptionState createState() =>
      _AnimatedEventDescriptionState();
}

class _AnimatedEventDescriptionState extends State<AnimatedEventDescription> {
  bool isExpanded = false;
  bool needsExpansion = false;

  @override
  void initState() {
    super.initState();
    needsExpansion = widget.description.length > 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          child: Text(
            widget.description,
            maxLines: needsExpansion ? (isExpanded ? null : 5) : null,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              fontSize: 16.sp,
            ),
          ),
        ),
        if (needsExpansion) ...[
          SizedBox(
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  isExpanded ? 'Show less' : 'Show more',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).colorScheme.onPrimary,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                SvgPicture.asset(
                  isExpanded ? AssetConstants.arrowLeft : AssetConstants.arrowRight,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
