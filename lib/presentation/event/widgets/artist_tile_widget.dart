import 'package:app/presentation/core/agree_to_unfollow_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/event_details/artist_profile/artist_profile_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/services/analytics_service/analytics_service.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
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
            AnalyticsService().logEvent(eventName: 'view_artist', paras: {
              'artist_id': artist.id.toString(),
            });
            //navigator<NavigationService>().goBack();
            // navigator<NavigationService>().navigateTo(
            //     UserRoutes.artistProfileScreenRoute,
            //     queryParams: {'id': artist.id.toString()}).then((value) {
            //   context
            //       .read<ArtistProfileCubit>()
            //       .emitFromAnywhere(state: state.copyWith());
            // });
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
              !artist.isFollowing
                  ? GestureDetector(
                      onTap: () {
                        context.read<ArtistProfileCubit>().followUnfollowArtist(
                            artistId: artist.id, isFollowing: false);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 1.h),
                        height: 4.5.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Follow',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        )),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        // AnalyticsService()
                        //     .logEvent(eventName: 'view_artist', paras: {
                        //   'artist_id': artist.id.toString(),
                        // });
                        // navigator<NavigationService>().goBack();
                        // navigator<NavigationService>().navigateTo(
                        //     UserRoutes.artistProfileScreenRoute,
                        //     queryParams: {
                        //       'id': artist.id.toString()
                        //     }).then((value) {
                        //   context
                        //       .read<ArtistProfileCubit>()
                        //       .emitFromAnywhere(state: state.copyWith());
                        // });

                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AgreeToUnfollowModalSheet(name: artist.fullName);
                            }).then((value) {

                          if (value != null) {
                            context
                                .read<ArtistProfileCubit>()
                                .followUnfollowArtist(
                                    artistId: artist.id, isFollowing: true);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        height: 4.5.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            // border: Border.all(
                            //     width: .2.w,
                            //     color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Following',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
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
