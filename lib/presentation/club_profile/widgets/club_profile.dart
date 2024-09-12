import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/club_profile/club_profile_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../../domain/core/utils/dynamic_link.dart';
import '../../../domain/core/utils/image_provider.dart';
import '../../../infrastructure/core/dtos/menu/menu_dto.dart';
import '../../../infrastructure/core/enum/image_type.enum.dart';
import '../../../infrastructure/pub/dtos/pub_opening_hours/pub_opening_hours_dto.dart';
import '../../widgets/gradient_button.dart';
import 'social_reach.dart';

class ClubProfile extends StatelessWidget {
  ClubProfile({super.key});
  String today = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return BlocConsumer<ClubProfileCubit, ClubProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(.85),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.5.h,
                      ),
                      SizedBox(
                        width: 65.w,
                        child: Text(
                          state.pub?.fullName??"",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                      ),
                      Text('@${state.pub!.tag!.tag}',
                          style: Theme.of(context).textTheme.bodySmall!),
                      SizedBox(
                        height: 1.h,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.locationIcon,
                              height: 2.h,
                            ),
                            // SizedBox(
                            //   width: 1.w,
                            // ),
                            Flexible(
                              //width: 40.w,
                              child: Text(state.pub?.location?.vicinity ?? '',
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontSize: 15.sp,
                                      )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        state.pub?.description??"",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                builder: (context) {
                                  return SizedBox(
                                    width: 100.w,
                                    height: 100.w,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10, top: 8),
                                      child: Stack(
                                        children: [
                                          SingleChildScrollView(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 12.w,
                                                  height: .5.h,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondaryContainer,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                SizedBox(height: 2.h),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Business Hours',
                                                    style: TextStyle(
                                                      fontSize: 18.px,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                SizedBox(
                                                  height: 60.h,
                                                  child: ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: state
                                                        .pub!
                                                        .openingHours!
                                                        .weekdayText
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var timing = state
                                                          .pub!
                                                          .openingHours!
                                                          .weekdayText[index];
                                                      (
                                                          '$timing   ${timing.split("y:")}');

                                                      return ListTile(
                                                        minTileHeight: 20,
                                                        title: Text(
                                                          '${timing.split("y:")[0]}y',
                                                          style: TextStyle(
                                                            fontSize: 16.px,
                                                            color:
                                                                '${timing.split("y:")[0]}y' ==
                                                                        today
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        trailing: Text(
                                                          '${timing.split("y:")[1]}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.px,
                                                            color:
                                                                '${timing.split("y:")[0]}y' ==
                                                                        today
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .white,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                              child: SvgPicture.asset(
                                                  AssetConstants.closeIcon),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(AssetConstants.durationIcon,
                                    colorFilter: ColorFilter.mode(
                                        colorScheme.inversePrimary,
                                        BlendMode.srcIn)),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  (state.pub!.openingHours!.openNow ?? false)
                                      ? 'Open'
                                      : 'Closed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                ),
                                SvgPicture.asset(
                                  AssetConstants.arrowDown,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AssetConstants.startIcon,
                                  colorFilter: ColorFilter.mode(
                                      colorScheme.surfaceTint,
                                      BlendMode.srcIn)),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                '${state.pub!.averageRating}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        thickness: .05.w,
                        // color: Colors.white,
                      ),
                      // state.pub!.extraDetailsDto!.followedBy.isNotEmpty
                      //     ? MutualFollowers()
                      //     : const SizedBox(),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigator<NavigationService>().navigateTo(
                              UserRoutes.clubCommunityScreenRoute,
                              queryParams: {
                                'clubId': state.clubId.toString(),
                                'clubName': state.pub!.fullName,
                              });
                        },
                        child: SocialReach(
                          totalFollowers:
                              state.pub!.extraDetailsDto!.totalFollowers,
                          totalFriends:
                              state.pub!.extraDetailsDto!.totalFriends,
                          totalParties:
                              state.pub!.extraDetailsDto!.totalParties,
                        ),
                      )
                    ],
                  ),
                ),
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
                        border: Border.all(width: 1, color: Colors.white),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                CustomImageProvider.getImageUrl(
                                    state.pub?.logo ?? '',
                                    ImageType.profile)))),
                  ),
                ],
              ),
            ),
            !state.isFollowing
                ? Positioned(
                    top: 1.5.h,
                    right: 4.5.w,
                    child: GradientButton(
                      width: 23.w,
                      height: 4.h,
                      text: ClubProfileScreenConstants.follow,
                      onTap: () {
                        context
                            .read<ClubProfileCubit>()
                            .followUnfollowPub(pubId: state.pub!.id.toString());
                      },
                      textStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  )
                : Positioned(
                    top: 1.5.h,
                    right: 4.5.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        decoration: BoxDecoration(
                            color:
                                colorScheme.secondaryContainer.withOpacity(.2),
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
                            // SizedBox(
                            //   width: 1.w,
                            // ),
                            // SvgPicture.asset(AssetConstants.arrowDown)
                          ],
                        ),
                      ),
                    )),
            Positioned(
              top: 1.5.h,
              left: 2.5.w,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
            maxHeight: 90.h, // Set your max height here
          ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    context: context,
                    builder: (context) {
                      (state.pub!.happyHours?.isEmpty);
                      return DraggableScrollableSheet(
                        expand: false,
                        builder: (context, scrollController) {
                          return DefaultTabController(
                            length: 7, // Number of tabs (days of the week)
                            child: SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 8),
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      controller: scrollController,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 12.w,
                                            height: .5.h,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Offers And Discounts',
                                              style: TextStyle(
                                                fontSize: 18.px,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          TabBar(
                                            dividerColor: Colors.transparent,
                                            isScrollable: false,
                                            labelPadding:
                                                const EdgeInsets.all(2),
                                            labelColor: Colors.white,
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.px),
                                            indicator: BoxDecoration(
                                              border: Border.all(
                                                color: Colors
                                                    .grey, // Customize border color
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BoxShape.rectangle,
                                            ),
                                            tabs: [
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Mon"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Tue"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Wed"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Thu"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Fri"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Sat"),
                                              ),
                                              Container(
                                                width: 48.px,
                                                height: 28.px,
                                                alignment: Alignment.center,
                                                child: Tab(text: "Sun"),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height:
                                                100.h, // Adjust height as needed
                                            child: TabBarView(
                                              children: [
                                                MondayTab(
                                                  happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                 MondayTab(
                                                  happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                  MondayTab(
                                                  happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                 MondayTab(
                                                   happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                 MondayTab(
                                                   happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                  MondayTab(
                                                   happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                                MondayTab(
                                                   happyhours:

                                                  state.pub!.happyHours!.isNotEmpty?
                                                      state.pub!.happyHours ?? []:
                                                          [MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/image_152_faskzh.png"),MenuDto(id: 1, url: "https://res.cloudinary.com/dltfyyjib/image/upload/v1723719528/Frame_1171275935_l3ukn4.png")],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: SvgPicture.asset(
                                            AssetConstants.closeIcon),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );

                      // return SizedBox(
                      //   width: 100.w,
                      //   height: 100.h,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           width: 12.w,
                      //           height: .5.h,
                      //           decoration: BoxDecoration(
                      //             color: Theme.of(context)
                      //                 .colorScheme
                      //                 .secondaryContainer,
                      //             borderRadius: BorderRadius.circular(50),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 1.h,
                      //         ),
                      //         Text('Scan the QR code',
                      //             style: textTheme.bodyLarge!
                      //                 .copyWith(color: colorScheme.background)),
                      //         SizedBox(
                      //           height: 1.h,
                      //         ),

                      //         SizedBox(
                      //           width: 50.w,
                      //           height: 50.w,
                      //           child: QrImageView(
                      //             data: DynamicLinkUtil.generateLink(
                      //                 AppConstants.pub,
                      //                 state.clubId.toString()),
                      //             eyeStyle: QrEyeStyle(
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .secondaryContainer,
                      //                 eyeShape: QrEyeShape.square),
                      //             dataModuleStyle: QrDataModuleStyle(
                      //               color: Theme.of(context)
                      //                   .colorScheme
                      //                   .secondaryContainer,
                      //               dataModuleShape: QrDataModuleShape.square,
                      //             ),
                      //           ),
                      //         ),

                      //         // Container(
                      //         //   decoration: BoxDecoration(
                      //         //     border: Border.all(color: colorScheme.background, width: .1.w),
                      //         //     borderRadius: BorderRadius.circular(10.w)
                      //         //   ),
                      //         //   child: Row(),
                      //         // )
                      //         SizedBox(
                      //           height: 2.h,
                      //         ),
                      //         Container(
                      //           width: 60.w,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(
                      //                   color: colorScheme.background,
                      //                   width: .1.w),
                      //               borderRadius: BorderRadius.circular(10)),
                      //           padding: EdgeInsets.symmetric(
                      //               vertical: 1.h, horizontal: 3.w),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               CircleAvatar(
                      //                 radius: 5.5.w,
                      //                 backgroundImage:
                      //                     CachedNetworkImageProvider(
                      //                         CustomImageProvider.getImageUrl(
                      //                             state.pub?.logo,
                      //                             ImageType.profile)),
                      //               ),
                      //               SizedBox(
                      //                 width: 2.w,
                      //               ),
                      //               Expanded(
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       state.pub?.fullName ?? '',
                      //                       maxLines: 1,
                      //                       overflow: TextOverflow.ellipsis,
                      //                       style: themeData
                      //                           .textTheme.bodyMedium!
                      //                           .copyWith(
                      //                         color: colorScheme.background,
                      //                         fontSize: 16.5.sp,
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       height: .5.h,
                      //                     ),
                      //                     Text(
                      //                       state.pub?.tag != null
                      //                           ? '@${state.pub?.tag?.tag}'
                      //                           : '',
                      //                       style: themeData
                      //                           .textTheme.bodySmall!
                      //                           .copyWith(
                      //                               color: colorScheme
                      //                                   .background
                      //                                   .withOpacity(.7),
                      //                               fontWeight:
                      //                                   FontWeight.w600),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 3.h,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
                child: Container(
                  height: 6.h,
                  width: 6.h,
                  child: Center(
                      child: SvgPicture.asset(
                    AssetConstants.happyhours,
                    fit: BoxFit.cover,
                  )),
                ),
                // child: SizedBox(
                //   height: 15.h,
                //   width: 15.w,
                //   child: QrImageView(
                //     data: DynamicLinkUtil.generateLink(
                //         AppConstants.pub, state.clubId.toString()),
                //     eyeStyle: QrEyeStyle(
                //         color: Theme.of(context).colorScheme.secondaryContainer,
                //         eyeShape: QrEyeShape.square),
                //     dataModuleStyle: QrDataModuleStyle(
                //       color: Theme.of(context).colorScheme.secondaryContainer,
                //       dataModuleShape: QrDataModuleShape.square,
                //     ),
                //   ),
                // ),
              ),
            )
          ],
        );
      },
    );
  }
}

class MondayTab extends StatelessWidget {
  final List<MenuDto> happyhours;
  const MondayTab({super.key, required this.happyhours});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
            width: 42.75.h,
            height: 42.75.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(happyhours[0].url),
                    fit: BoxFit.cover)),
          ),
        ),
        Text(
          "Amazing!",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.px,
              color: Colors.white),
        ),
        Text(
          "It's a nice place to hang out with friends. We enjoyed our time here! The ambiance was looking good.",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.px,
              color: Colors.white),
        ),
        SizedBox(height: 1.h),
         Center(
          child: Container(
            margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
            width: 42.75.h,
            height: 20.75.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(happyhours[1].url),
                    fit: BoxFit.cover)),
          ),
        ),
       
      ],
    );
  }
}
