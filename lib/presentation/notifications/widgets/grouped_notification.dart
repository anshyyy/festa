import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/custom_outlined_button.dart';
import '../../widgets/gradient_button.dart';
import 'poster_preview.dart';

class GroupedNotifications extends StatelessWidget {
  final String header;
  final int itemsCount;
  const GroupedNotifications({
    super.key,
    required this.header,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, top: 4.w),
          child: Text(
            header,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17.sp,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemsCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 3.5.w,
                    foregroundImage: const NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1681398821763-f95bd74a96da?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    flex: 2,
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Did you know? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  // fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          TextSpan(
                            text: 'you can now follow people on Festa.',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  // fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  index % 2 == 0
                      ? Expanded(
                          child: index % 3 == 0
                              ? GradientButton(
                                  height: 4.5.h,
                                  text: 'Follow',
                                  onTap: () {},
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                )
                              : const CustomOutlinedButton(text: 'Check now'))
                      : const PosterPreview(),
                ],
              ),
            );
          },
        ),
        Divider(
          thickness: .05.w,
        )
      ],
    );
  }
}

