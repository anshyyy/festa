import 'package:app/presentation/user/profile_settings/widgets/edit_profile_tab1.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/auth/edit_profile/edit_profile_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../../infrastructure/core/dtos/highlight/highlight_dto.dart';
import '../../../widgets/gradient_button.dart';

class HighlightsTab extends StatefulWidget {
  const HighlightsTab({Key? key}) : super(key: key);

  @override
  _HighlightsTabState createState() => _HighlightsTabState();
}

class _HighlightsTabState extends State<HighlightsTab> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeData = Theme.of(context);
        final colorScheme = themeData.colorScheme;
       // print(state.highlightWidgets.length);
        return SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              if (state.highlightWidgets.isEmpty) ...[
                // Display the container to pick an image if there are no images
                const KImagePicker(),
              ] else ...[
                // Carousel slider with images
                CarouselSlider(
                  controller: state.carouselController,
                  options: CarouselOptions(
                    height: 59.125.h,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: state.highlightWidgets.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return item;
                      },
                    );
                  }).toList(),
                ),

                // Dot indicators based on number of images

                if (state.highlightWidgets.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.user!.highlight!.map((item) {
                  
                      // Find the index of the current item in the highlight list
                      int index = state.user?.highlight?.indexWhere(
                              (highlight) => highlight.id == item.id) ??


                          0;

                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? colorScheme.background
                              : colorScheme.background.withOpacity(0.4),
                        ),
                      );
                    }).toList(),
                  ),
              ],
              SizedBox(height: 1.3.h),
              Padding(
                padding: EdgeInsets.only(left:1.5.h,right: 1.5.h),
                child: InkWell(
                  onTap: () {
                    context.read<EditProfileCubit>().addOneMoreHighlight();
                  },
                  child: Container(
                    width: 100.w,
                    height: 5.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: colorScheme.surfaceContainer)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: colorScheme.background,
                          ),
                          Text(
                            'Add one more highlight',
                            style: TextStyle(color: colorScheme.background),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.only(left:1.7.h,right: 1.7.h),
                child: Text(
                  'Upload up to 7 images or videos, each with a resolution of 1920x1080 pixels.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // Function to build image picker container
}

class ImageHighlight extends StatelessWidget {
  const ImageHighlight({
    super.key,
    required this.item,
    required this.userId,
  });

  final HighlightDto item;
  final int userId;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return Stack(
      children: [
        Container(
          width: 72.w,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(item.url))),
        ),
        Positioned(
            bottom: 10,
            right: 30,
            child: SideTile(
                isOnCaraousel: true,
                colorScheme: colorScheme,
                asset: AssetConstants.editIcon,
                onTap: () async {
                  var option = await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 22.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 12.w,
                                  height: .5.h,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context, 'delete');
                                  },
                                  child: Text(
                                    "Delete Highlight",
                                    style: TextStyle(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp),
                                  )),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context, 'replace');
                                },
                                child: Text('Replace/Change Highlight',
                                    style: TextStyle(
                                        color: colorScheme.background,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp)),
                              ),
                            ],
                          ),
                        );
                      });

                  if (option == 'delete') {
                    var deleteOption = await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 33.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 2.h),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    width: 12.w,
                                    height: .5.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text('Delete Selected Highlight?',
                                        style: TextStyle(
                                            color: colorScheme.background,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.sp)),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            AssetConstants.closeIcon))
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                Text(
                                  'Are you sure you want to delete the selected highlight?',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 1.5.h),
                                SizedBox(height: 6.h),
                                GradientButton(
                                    text: 'Delete',
                                    height: 6.h,
                                    onTap: () {
                                      Navigator.pop(context, 'delete');
                                    }),
                                SizedBox(height: 1.h),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No, Keep it',
                                        style: TextStyle(
                                            color: colorScheme.background,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)))
                              ],
                            ),
                          );
                        });
                 
                    if (deleteOption == 'delete') {
                      context.read<EditProfileCubit>().deleteHighLight(item);
                    }
                  }
                  if (option == 'replace') {
                    context.read<EditProfileCubit>().updatedHighlight(item);
                  }
                }))
      ],
    );
  }
}

class KImagePicker extends StatelessWidget {
  const KImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return Container(
      width: 72.w,
      height: 59.125.h,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SideTile(
              onTap: () {
                context.read<EditProfileCubit>().onSelectHighLightCameraImage();
              },
              colorScheme: colorScheme,
              asset: AssetConstants.cameraIcon,
            ),
            SizedBox(width: 3.w),
            SideTile(
              onTap: () {
                // Implement gallery image change action
                context.read<EditProfileCubit>().onSelectHighLightImage();
              },
              colorScheme: colorScheme,
              asset: AssetConstants.galleryIcon,
            ),
          ],
        ),
      ),
    );
  }
}
