import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class UserSocialShimmer extends StatelessWidget {
  const UserSocialShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            height: 7.h,
            margin: EdgeInsets.only(bottom: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 13.w,
                  height: 13.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(1.w)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      width: 50.w,
                      height: 3.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(1.w)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
