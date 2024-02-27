import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import 'artist_tile_widget.dart';

class FollowArtistsModalSheet extends StatelessWidget {
  const FollowArtistsModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: 12.w,
            height: .5.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                EventDetailsScreenConstants.followArtists,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.background),
              ),
              GestureDetector(
                onTap: (){
                  navigator<NavigationService>().goBack();
                },
                child: SvgPicture.asset(AssetConstants.closeIcon))
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: const ArtistTile(artistName: 'Mike Shinoda', username: 'mikeshinoda',),
            ),
          )
        ]),
      ),
    );
  }
}
