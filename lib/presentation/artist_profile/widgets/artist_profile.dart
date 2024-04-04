import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/artist/artist_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/dynamic_link.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/enum/image_type.dart';
import '../../widgets/gradient_button.dart';
import 'mutual_followers.dart';
import 'social_reach.dart';
// import 'mutual_followers.dart';
// import 'social_reach.dart';

class ArtistProfile extends StatelessWidget {
  const ArtistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeData = Theme.of(context);
        final colorScheme = themeData.colorScheme;
        final textTheme = themeData.textTheme;

        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        width: .3,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          state.artistProfile?.fullName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                        Text('@${state.artistProfile?.tag?.tag ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall!),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          state.artistProfile?.description ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              state.artistProfile!.categories.map((current) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.w, vertical: 1.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: .1.w,
                                      color: colorScheme.background
                                          .withOpacity(.5)),
                                  borderRadius: BorderRadius.circular(50.w)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: colorScheme.background,
                                    radius: 1.5.w,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    current.name,
                                    style: textTheme.bodySmall!.copyWith(
                                        color: colorScheme.background,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        Divider(
                          thickness: .1.w,
                          // color: Colors.white,
                        ),
                        GestureDetector(
                           onTap: () {
                            navigator<NavigationService>().navigateTo(
                                UserRoutes.artistCommunityScreenRoute,
                                queryParams: {
                                  'artistId': state.artistId.toString(),
                                  'artistName': state.artistProfile!.fullName,
                                });
                          },
                          child: Column(
                            children: [
                              MutualFollowers(
                                artistCommunityDto:
                                    state.artistProfile!.extraDetailsDto!.followedBy,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SocialReach(
                                totalParties: state
                                    .artistProfile!.extraDetailsDto!.totalParties,
                                totalFollowers: state
                                    .artistProfile!.extraDetailsDto!.totalFollowers,
                                totalFriends: state
                                    .artistProfile!.extraDetailsDto!.totalFriends,
                                totalFootFall: state
                                    .artistProfile!.extraDetailsDto!.totalFootFall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -5.h,
                    child: Column(
                      children: [
                        Container(
                          height: 20.w,
                          width: 20.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.primaryContainer.withOpacity(1),
                              border: Border.all(width: 1, color: Colors.white),
                              image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(CustomImageProvider.getImageUrl(state.artistProfile!.profileImage, ImageType.profile))
                                  )),
                        ),
                      ],
                    ),
                  ),
                  state.isFollowing
                      ? Positioned(
                          top: 1.5.h,
                          right: 4.5.w,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<ArtistCubit>()
                                  .followUnfollowArtist();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.w),
                              decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer
                                      .withOpacity(.2),
                                  borderRadius: BorderRadius.circular(2.w)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Following',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  SvgPicture.asset(AssetConstants.arrowDown)
                                ],
                              ),
                            ),
                          ))
                      : Positioned(
                          top: 1.5.h,
                          right: 4.5.w,
                          child: GradientButton(
                            width: 23.w,
                            height: 4.h,
                            text: 'Follow',
                            onTap: () {
                              context
                                  .read<ArtistCubit>()
                                  .followUnfollowArtist();
                            },
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                  Positioned(
                    top: 1.h,
                    left: 2.w,
                    child: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: QrImageView(
                        data: DynamicLinkUtil.generateLink(
                            AppConstants.artist, state.artistId.toString()),
                        eyeStyle: QrEyeStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            eyeShape: QrEyeShape.square),
                        dataModuleStyle: QrDataModuleStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            dataModuleShape: QrDataModuleShape.square),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
