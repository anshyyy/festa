import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MutualFollowers extends StatelessWidget {
  MutualFollowers({super.key});
  final List<String> mutualFriends = [
    'Prathamesh Dongrikar',
    'Shubham Raut',
    'Sahil Jadhav'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:2.w),
      child: SizedBox(
        height: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
                3,
                (index) => Align(
                      widthFactor: .4,
                      child: CircleAvatar(
                        radius: 3.7.w,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 3.5.w,
                            backgroundImage: const NetworkImage(
                                'https://i.pinimg.com/736x/0c/c2/74/0cc2740f7cc70dd14f2dbf80076d26df.jpg')),
                      ),
                    )),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(children: [
                  const TextSpan(text: 'Followed By '),
                  TextSpan(children: [
                    ...List.generate(
                      3,
                      (index) => TextSpan(
                          text:
                              '${mutualFriends[index]}${index == mutualFriends.length - 1 ? ' ' : ', '}',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background)),
                    )
                  ]),
                  const TextSpan(text: '& '),
                  const TextSpan(text: '10 Others')
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
