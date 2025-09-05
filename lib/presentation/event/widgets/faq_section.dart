import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/core/constants/asset_constants.dart';

class FAQSection extends StatelessWidget {
  final List<dynamic> faqs;

  const FAQSection({
    super.key,
    required this.faqs,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQs',
          style: TextStyle(
            color: colorScheme.background,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 1.h),
        if (faqs.length <= 2)
          ...faqs.map((e) => FAQtile(question: e.question, answer: e.answer))
        else ...[
          ...faqs
              .take(2)
              .map((e) => FAQtile(question: e.question, answer: e.answer)),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.black.withOpacity(0.2),
                isScrollControlled: true,
                builder: (context) => FAQsBottomSheet(faqs: faqs),
              );
            },
            child: Row(
              children: [
                Text(
                  'Show More',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.onPrimary,
                      color: colorScheme.onPrimary,
                      fontSize: 15.sp),
                ),
                SvgPicture.asset(AssetConstants.arrowRight,
                    colorFilter: ColorFilter.mode(
                        colorScheme.onPrimary, BlendMode.srcIn))
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class FAQtile extends StatelessWidget {
  final String question;
  final String answer;
  const FAQtile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
                color: colorScheme.background,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 0.4.h,
          ),
          Text(
            answer,
            style: TextStyle(
                color: colorScheme.background.withOpacity(0.8),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class FAQsBottomSheet extends StatelessWidget {
  final List<dynamic> faqs;

  const FAQsBottomSheet({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface.withOpacity(0.99),
            colorScheme.surface.withOpacity(1),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 0.6.h,
              width: 15.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ]),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) => FAQtile(
                question: faqs[index].question,
                answer: faqs[index].answer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ... existing FAQtile and FAQsBottomSheet classes ...