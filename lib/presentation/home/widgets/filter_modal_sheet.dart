import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/filter/filter_cubit.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../infrastructure/event/dtos/filter/filter_dto.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/gradient_text.dart';

class FilterModalSheet extends StatelessWidget {
  final List<FilterDto> filters;
  const FilterModalSheet({
    super.key,
    required this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(
        FilterState.initial(
          filters: filters,
        ),
      )..init(),
      child: const FilterModalSheetConsumer(),
    );
  }
}

class FilterModalSheetConsumer extends StatelessWidget {
  const FilterModalSheetConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 72.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(7.w),
            ),
          ),
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 2.h,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filter',
                              style: themeData.textTheme.bodyMedium!.copyWith(
                                color: themeData.colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigator<NavigationService>().goBack(responseObject: state.filters);
                              },
                              child: SvgPicture.asset(
                                AssetConstants.closeIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Divider(
                        thickness: .035.w,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...state.filters.map((e) => Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 2.7.h),
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<FilterCubit>()
                                                      .onFilterChanged(
                                                          filterValue:
                                                              e.name);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 1.3.w,
                                                      width: 1.3.w,
                                                      decoration: e.isApplied
                                                          ? BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  themeData
                                                                      .colorScheme
                                                                      .primary,
                                                                  themeData
                                                                      .colorScheme
                                                                      .secondary
                                                                ],
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                              ))
                                                          : null,
                                                    ),
                                                    SizedBox(
                                                      width: 1.5.w,
                                                    ),
                                                    Expanded(
                                                      child: e.name ==
                                                              state
                                                                  .currentActive
                                                          ? GradientText(
                                                              text: e
                                                                  .displayName,
                                                              colors: [
                                                                themeData
                                                                    .colorScheme
                                                                    .primary,
                                                                themeData
                                                                    .colorScheme
                                                                    .secondary
                                                              ],
                                                              textStyle: themeData
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          16.5.sp))
                                                          : Text(
                                                              e.displayName,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: themeData
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      color: themeData
                                                                          .colorScheme
                                                                          .background,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16.5.sp),
                                                            ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 3.h, right: 2.w, left: 2.w),
                              child: Container(
                                height: 100.h,
                                width: .03.w,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 3.w,
                                  top: 1.w,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FILTER BY',
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
                                              fontSize: 14.5.sp,
                                              color: themeData
                                                  .colorScheme.onTertiary
                                                  .withOpacity(.7),
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    // SingleChildScrollView(
                                    //   scrollDirection: Axis.vertical,
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       ...state.filterValues.map((e) {
                                    //         return GestureDetector(
                                    //           onTap: () {
                                    //             context
                                    //                 .read<FilterCubit>()
                                    //                 .onOptionChange(
                                    //                     optionId:
                                    //                         e.displayName);
                                    //           },
                                    //           child: Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 vertical: 1.h,
                                    //                 horizontal: 0.w),
                                    //             child: Row(
                                    //               children: [
                                    //                 SvgPicture.asset(e
                                    //                         .isApplied
                                    //                     ? AssetConstants
                                    //                         .selectedRadio
                                    //                     : AssetConstants
                                    //                         .unSelectedRadio,
                                    //                         height: 6.5.w,
                                    //                         ),
                                    //                 SizedBox(
                                    //                   width: 2.5.w,
                                    //                 ),
                                    //                 Expanded(
                                    //                     child: Text(
                                    //                   e.displayName,
                                    //                   maxLines: 1,
                                    //                   overflow: TextOverflow
                                    //                       .ellipsis,
                                    //                   style: themeData
                                    //                       .textTheme
                                    //                       .bodyMedium!
                                    //                       .copyWith(
                                    //                     fontWeight: e
                                    //                             .isApplied
                                    //                         ? FontWeight.w700
                                    //                         : FontWeight.w400,
                                    //                     fontSize: 16.5.sp,
                                    //                     color: themeData
                                    //                         .colorScheme
                                    //                         .background,
                                    //                   ),
                                    //                 ))
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         );
                                    //       })
                                    //     ],
                                    //   ),
                                    // ),
        
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.filterValues.length,
                                      itemBuilder: (context, index) {
                                        final e = state.filterValues[index];
                                        return GestureDetector(
                                          onTap: () {
                                            context
                                                .read<FilterCubit>()
                                                .onOptionChange(
                                                    optionId: e.displayName);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h,
                                                horizontal: 0.w),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  e.isApplied
                                                      ? AssetConstants
                                                          .selectedRadio
                                                      : AssetConstants
                                                          .unSelectedRadio,
                                                  height: 6.5.w,
                                                ),
                                                SizedBox(
                                                  width: 2.5.w,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  e.displayName,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: themeData
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                    fontWeight: e.isApplied
                                                        ? FontWeight.w700
                                                        : FontWeight.w400,
                                                    fontSize: 16.5.sp,
                                                    color: themeData
                                                        .colorScheme
                                                        .background,
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Spacer(),
                    Container(
                      height: .005.h,
                      width: 100.w,
                      color: Theme.of(context).colorScheme.background,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    state.isFilterSelected || state.isFilterOptionSelected
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              children: [
                                Expanded(
                                    child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<FilterCubit>()
                                        .clearFilters();
        
                                    CustomToast.show(context,
                                        'All the filters are cleared');
                                  },
                                  child: Text(
                                    'Clear All',
                                    style: themeData.textTheme.bodySmall!
                                        .copyWith(
                                      color: themeData.colorScheme.background,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                                  Expanded(
                                    child: GradientButton(
                                        textStyle: themeData
                                            .textTheme.bodySmall!
                                            .copyWith(
                                                color:
                                                    state.isFilterOptionSelected
                                                        ? themeData
                                                            .colorScheme
                                                            .background
                                                        : themeData
                                                            .colorScheme
                                                            .background
                                                            .withOpacity(.5),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 3.5.w),
                                        isEnabled:
                                            state.isFilterOptionSelected,
                                        width: 100.w,
                                        height: 5.5.h,
                                        text: 'Apply filters',
                                        onTap: () {
                                          navigator<NavigationService>()
                                              .goBack(
                                            responseObject: state.filters,
                                          );
                                        }),
                                  )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 3.h,
                    )
                  ],
                ),
        );
      },
    );
  }
}

class CustomToast {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 12.h,
        left: MediaQuery.of(context).size.width * 0.25,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);

    // Remove the toast after a delay
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
