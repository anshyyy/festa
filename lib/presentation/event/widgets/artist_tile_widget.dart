import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/event_details/artist_profile/artist_profile_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';

class ArtistTile extends StatelessWidget {
  final ArtistProfileDto artist;
  const ArtistTile({
    super.key,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistProfileCubit, ArtistProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            navigator<NavigationService>().navigateTo(
                UserRoutes.artistProfileScreenRoute,
                queryParams: {'id': artist.id.toString()});
          },
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5.w,
                      backgroundColor: Colors.white,
                      foregroundImage: CachedNetworkImageProvider(
                          CustomImageProvider.getImageUrl(
                              CustomImageProvider.getImageUrl(
                                  artist.profileImage, ImageType.profile),
                              ImageType.profile)),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artist.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        Text(
                          artist.tag != null ? '@${artist.tag!.tag}' : '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<ArtistProfileCubit>().followUnfollowArtist(
                      artistId: artist.id, isFollowing: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                  height: 4.5.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Follow',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.background,
                        ),
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
