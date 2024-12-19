import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/report/report_cubit.dart';
import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/gradient_button.dart';
import 'widgets/rating.dart';

class ReviewScreen extends StatefulWidget {
  final String eventName;
  final String eventTime;
  final String eventId;

  const ReviewScreen({
    super.key,
    required this.eventName,
    required this.eventTime,
    required this.eventId,
  });

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Set<String> selectedTags = {};

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
        create: (context) => ReportCubit(ReportState.initial(
              serverUrl: appConfig.serverUrl,
              name: widget.eventName,
              id: widget.eventId,
              type: 'event',
            ))
              ..init(),
        child: BlocConsumer<ReportCubit, ReportState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (BuildContext context, ReportState state) {
            if (state.isSuccess) {
              navigator<NavigationService>().goBack();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.eventName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.px,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.eventTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.px,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                leading: GestureDetector(
                  onTap: () => navigator<NavigationService>().goBack(),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetConstants.closeIcon,
                      width: 7.w,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
                  child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    child: SingleChildScrollView(
                      
                      child: Column(
                        children: [
                          const Divider(
                            color: Color.fromARGB(255, 92, 90, 90),
                            height: 1,
                          ),
                          SizedBox(height: 2.h),
                          Center(
                            child: Text(
                              'How was your overall experience?',
                              style: TextStyle(
                                fontSize: 16.px,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          StarRating(
                            starCount: 5,
                            rating: 0,
                            onRatingChanged: (rating) {
                              // Handle the rating change
                              context
                                  .read<ReportCubit>()
                                  .onRatingChanged(rating);
                            },
                          ),
                          SizedBox(height: 2.h),
                          Center(
                            child: Text(
                              'What went Great?',
                              style: TextStyle(
                                fontSize: 16.px,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          SizedBox(
                            height: 22.33.h,
                            child: Wrap(
                              spacing: 8.0, // Space between tags horizontally
                              runSpacing: 8.0, // Space between rows vertically
                              children: state.tags.map((tag) {
                                final isSelected =
                                    state.selectedTags.contains(tag);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!isSelected) {
                                        context
                                            .read<ReportCubit>()
                                            .onTagSelected(tag);
                                      } else {
                                        context
                                            .read<ReportCubit>()
                                            .onTagUnSelect(tag);
                                      }
                                    });
                                  },
                                  child: IntrinsicWidth(
                                    child: Container(
                                      height: 3.58.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              10.0), // Adjust padding as needed
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        borderRadius: BorderRadius.circular(30),
                                        border: isSelected
                                            ? Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 1.5)
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 92, 90, 90),
                            height: 1,
                          ),
                          SizedBox(height: 1.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Write you experience',
                                style: TextStyle(
                                  fontSize: 16.px,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 15.125.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  controller: state.reportDescController,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.px,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    hintText: "Type Here",
                    
                                    // helperStyle: helperTextStyle,
                                    helperMaxLines: 1,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    counter: const Offstage(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1.8.h, horizontal: 4.w),
                                    hintStyle: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xFFABB3BB),
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
                            ],
                          ),
                          SizedBox(height: 3.h),
                          const Divider(
                            color: Color.fromARGB(255, 92, 90, 90),
                            height: 1,
                          ),
                          SizedBox(height: 3.h),
                          GradientButton(
                              text: 'Submit Your Feedback',
                              onTap: () {
                                context.read<ReportCubit>().onReview();
                              }),
                          //Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
