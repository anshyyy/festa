import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/community/community_dto.dart';
import '../../../infrastructure/core/enum/image_type.dart';

class MutualFollowers extends StatelessWidget {
  const MutualFollowers({super.key, required this.artistCommunityDto});
  final CommunityDto artistCommunityDto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
                artistCommunityDto.users.length,
                (index) => Align(
                      widthFactor: .4,
                      child: CircleAvatar(
                        radius: 3.7.w,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 3.5.w,
                            backgroundImage: CachedNetworkImageProvider(
                                CustomImageProvider.getImageUrl(artistCommunityDto.users[index].profileImage, ImageType.profile))),
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
                      artistCommunityDto.users.length,
                      (index) => TextSpan(
                          text:
                              '${artistCommunityDto.users[index].fullName}${index == artistCommunityDto.users.length - 1 ? ' ' : ', '}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background)),
                    )
                  ]),
                  TextSpan(
                      text:
                          artistCommunityDto.totalCount > 0 ?'& ${artistCommunityDto.totalCount - artistCommunityDto.users.length} Others':'')
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
