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
      create: (context) => FilterCubit(FilterState.initial(filters: filters))
        ..onFilterChanged(filterValue: 'sort'),
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 2.h,
                        ),
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
                                navigator<NavigationService>().goBack();
                              },
                              child: SvgPicture.asset(
                                AssetConstants.closeIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .05.w,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 0.w, top: 1.2.h, right: 0.w),
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
                                              padding:
                                                  EdgeInsets.only(bottom: 2.h),
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<FilterCubit>()
                                                      .onFilterChanged(
                                                          filterValue: e.name);
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 1.5.w,
                                                      width: 1.5.w,
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
                                                              text:
                                                                  e.displayName,
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
                                                                              .w600,
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
                                                                          15.sp),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 3.h),
                              child: Column(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: .05.w,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FILTER BY',
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
                                        fontSize: 15.sp,
                                        color: themeData.colorScheme.background,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...state.filterValues.map((e) {
                                              return GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<FilterCubit>()
                                                      .onOptionChange(
                                                          optionId:
                                                              e.displayName);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                      horizontal: 0.w),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(e
                                                              .isApplied
                                                          ? AssetConstants
                                                              .selectedRadio
                                                          : AssetConstants
                                                              .unSelectedRadio),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                        e.displayName,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: themeData
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                          fontSize: 15.sp,
                                                          color: themeData
                                                              .colorScheme
                                                              .background,
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Expanded(
                                    //   child: Container(
                                    //     child: ListView.builder(
                                    //       shrinkWrap: true,
                                    //       itemCount: state.filterOptions.length,
                                    //       itemBuilder: (context, index) {
                                    //         return Text(state.filterOptions[index]['displayName']);
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .05.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: MaterialButton(
                            onPressed: () {
                              navigator<NavigationService>().goBack(
                                responseObject: List.from(state.filters.map(
                                    (e) => e.copyWith(
                                        isApplied: false,
                                        values: e.values
                                            .map((e) =>
                                                e.copyWith(isApplied: false))
                                            .toList()))).map((e) => e as FilterDto).toList(),
                              );
                            },
                            child: Text(
                              'Clear All',
                              style: themeData.textTheme.bodySmall!.copyWith(
                                color: themeData.colorScheme.background,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                          Expanded(
                            child: GradientButton(
                                textStyle:
                                    themeData.textTheme.bodySmall!.copyWith(
                                  color: themeData.colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                                width: 100.w,
                                height: 6.h,
                                text: 'Apply filters',
                                onTap: () {
                                  navigator<NavigationService>().goBack(
                                    responseObject: state.filters,
                                  );
                                }),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
