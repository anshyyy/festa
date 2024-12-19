import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../application/profile/gender_selection/cubit/gender_selection_cubit.dart';
import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/constants/asset_constants.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/gradient_button.dart';

class GenderSelectionBottomSheet extends StatefulWidget {
  final String userGender;
  const GenderSelectionBottomSheet({super.key, required this.userGender});
  @override
  _GenderSelectionBottomSheetState createState() =>
      _GenderSelectionBottomSheetState();
}

class _GenderSelectionBottomSheetState
    extends State<GenderSelectionBottomSheet> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;

    final appStateNotifier = Provider.of<AppStateNotifier>(context);
    final appConfig = AppConfig.of(context)!;
    return BlocProvider(
        create: (context) => GenderSelectionCubit(GenderSelectionState.initial(
              userGender: widget.userGender,
              appStateNotifier: appStateNotifier,
              serverUrl: appConfig.serverUrl,
            ))
              ..init(),
        child: BlocConsumer<GenderSelectionCubit, GenderSelectionState>(
          listener: (context, state) {
            if (state.genderUpdateSuccess) {
              Provider.of<AppStateNotifier>(context, listen: false)
                  .updateUser(user: state.user);
              Navigator.pop(context,{'user':state.user,'userGender':state.userGender});
            }
          },
          builder: (context, state) {
            //  print(widget.userGender);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height:
                  _isExpanded ? 85.h : 60.h, // Adjust these values as needed

              decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),

              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 0.5.h,
                      width: 12.w,
                      decoration: BoxDecoration(color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('Gender',
                            style: TextStyle(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp)),
                      ),
                      //  Spacer(),
                      //   InkWell(
                      //       onTap: () {
                      //
                      //       },
                      //       child: SvgPicture.asset(AssetConstants.closeIcon))
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'This is totally up to you and whether you’re comfortable.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400),
                  ),
                  SizedBox(height: 1.h),
                  InkWell(
                    onTap: () {
                      context
                          .read<GenderSelectionCubit>()
                          .onSelectGender('Woman');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                      height: 7.5.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Woman',
                              style: TextStyle(color: colorScheme.background),
                            ),
                            state.lsOFSex[state.selectedSex ?? -1] == 'Woman'
                                ? SvgPicture.asset(AssetConstants.selectedRadio)
                                : SvgPicture.asset(
                                    AssetConstants.unSelectedRadio)
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<GenderSelectionCubit>()
                          .onSelectGender('Man');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                      height: 7.5.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                      decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Man",
                              style: TextStyle(color: colorScheme.background),
                            ),
                            state.lsOFSex[state.selectedSex ?? -1] == 'Man'
                                ? SvgPicture.asset(AssetConstants.selectedRadio)
                                : SvgPicture.asset(
                                    AssetConstants.unSelectedRadio)
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                    height: _isExpanded ? 38.75.h : 13.25.h,
                    padding: EdgeInsets.only(
                        top: 2.h, bottom: 2.h, left: 1.h, right: 1.h),
                    decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<GenderSelectionCubit>()
                                .onSelectGender('Other');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Other",
                                style: TextStyle(color: colorScheme.background),
                              ),
                              state.lsOFSex[state.selectedSex ?? -1] == 'Other'
                                  ? SvgPicture.asset(
                                      AssetConstants.selectedRadio)
                                  : SvgPicture.asset(
                                      AssetConstants.unSelectedRadio)
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add more about your gender',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: _isExpanded
                                    ? Padding(
                                        padding: EdgeInsets.only(right: 0.5.h),
                                        child: SvgPicture.asset(
                                          AssetConstants.arrowUp,
                                          height: 13.sp,
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        AssetConstants.arrowDown,
                                        height: 23.sp,
                                      ))
                          ],
                        ),
                        if (_isExpanded) ...[
                          SizedBox(height: 2.h),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GenderSelectionCubit>()
                                  .onSelectGender('Intersex man');
                            },
                            child: Row(
                              children: [
                                state.lsOFSex[state.selectedSex ?? -1] ==
                                        'Intersex man'
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "Intersex man",
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GenderSelectionCubit>()
                                  .onSelectGender('Trans man');
                            },
                            child: Row(
                              children: [
                                state.lsOFSex[state.selectedSex ?? -1] ==
                                        'Trans man'
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "Trans man",
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GenderSelectionCubit>()
                                  .onSelectGender('Transmasculine');
                            },
                            child: Row(
                              children: [
                                state.lsOFSex[state.selectedSex ?? -1] ==
                                        'Transmasculine'
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "Transmasculine",
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GenderSelectionCubit>()
                                  .onSelectGender('Man and Non-Binary');
                            },
                            child: Row(
                              children: [
                                state.lsOFSex[state.selectedSex ?? -1] ==
                                        'Man and Non-Binary'
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  'Man and Non-Binary',
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GenderSelectionCubit>()
                                  .onSelectGender('Cis Man');
                            },
                            child: Row(
                              children: [
                                state.lsOFSex[state.selectedSex ?? -1] ==
                                        'Cis Man'
                                    ? SvgPicture.asset(
                                        AssetConstants.selectedRadio)
                                    : SvgPicture.asset(
                                        AssetConstants.unSelectedRadio),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  'Cis Man',
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 32.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 1.5.h),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 0, bottom: 5),
                                            height: 0.5.h,
                                            width: 15.w,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          Container(
                                            height: 15.125.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                            child: TextField(
                                              maxLines: null,
                                              expands: true,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14.px,
                                                color: Colors.white,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                hintText:
                                                    "What we are missing?",
                                                // helperStyle: helperTextStyle,
                                                helperMaxLines: 1,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                counter: const Offstage(),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1.8.h,
                                                        horizontal: 4.w),
                                                hintStyle: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color:
                                                      const Color(0xFFABB3BB),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.px,
                                                ),
                                                errorStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Colors.red,
                                                      fontSize: 10.sp,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          GradientButton(
                                              text: 'Submit',
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tell us if we’re missing something',
                                  style: TextStyle(
                                      color: colorScheme.background,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                    child: SvgPicture.asset(
                                  AssetConstants.arrowRight,
                                  height: 23.sp,
                                ))
                              ],
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                  // SizedBox(height: 1.h),
                  // Row(
                  //   children: [
                  //     CupertinoSwitch(
                  //       value: true,
                  //       onChanged: (bool value) {},
                  //     ),
                  //     SizedBox(
                  //       width: 4.w,
                  //     ),
                  //     Text(
                  //       "Shown on your Profile?",
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w600,
                  //           color: colorScheme.background),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 1.h),
                  Text(
                    'You are free to change the personalisation anytime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  SizedBox(height: 1.h),
                  GradientButton(
                      isWidget: context
                          .watch<GenderSelectionCubit>()
                          .state
                          .isLoading, // Add a condition to check loading state
                      child:  CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.background,
                      ),
                      text: 'Save',
                      onTap: () {
                        context.read<GenderSelectionCubit>().onContinue();
                      })
                ],
              ),
            );
          },
        ));
  }
}
