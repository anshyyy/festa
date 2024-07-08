import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../domain/core/utils/image_provider.dart';
import '../../../../../infrastructure/core/enum/image_type.enum.dart';

class ClubCard extends StatelessWidget {
  const ClubCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 51.px,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child:  Container(
            height: 51.px,
            width: 51.px,
           // margin: EdgeInsets.only(right: 3.w),
            decoration: BoxDecoration(
               // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        CustomImageProvider.getImageUrl(
                            'https://plus.unsplash.com/premium_photo-1682265676364-5838a427dee2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ImageType.other)))),
          ),
            )
            ,
            SizedBox(width: 12.px,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("House of Commons",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
               
                , 
                 Text("@mikeshinoda",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey[400]),
               
                )
              ],
            )
          ],
        ),
    );
  }
}