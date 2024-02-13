import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import 'widgets/price_unit_tile.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentDetailsConsumer();
  }
}

class PaymentDetailsConsumer extends StatelessWidget {
  const PaymentDetailsConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              EventDetails(),
              SizedBox(
                height: 1.h,
              ),
              PaymentDestributionDetails(),
               SizedBox(
                height: 1.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(PaymentScreenConstants.offersAndBenfit),
                  SizedBox(
                height: 1.h,
              ),
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AssetConstants.shareIcon),SizedBox(
                width:2.w,
              ),
Text(PaymentScreenConstants.applyCoupon),
                          ],
                        ),
                        SvgPicture.asset(AssetConstants.arrowRight)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: 30.w,
                  width: 25.w,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://images.unsplash.com/photo-1707303822352-2cb2faee9d0c?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))),
          const Column(
            children: [
              // Text()
            ],
          )
        ],
      ),
    );
  }
}

class PaymentDestributionDetails extends StatelessWidget {
  const PaymentDestributionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Column(
            children: [
              const PriceUnit(
                  title: 'Ticket Price', detail: '4999.00'),
              SizedBox(
                height: 2.h,
              ),
              const PriceUnit(title: 'Quantity', detail: '2'),
              SizedBox(
                height: 2.h,
              ),
              const PriceUnit(title: 'Title', detail: '11.00'),
              SizedBox(
                height: 2.h,
              ),
              const PriceUnit(title: 'GST', detail: '200.00'),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
          Divider(
            thickness: .1.w,
          ),
          const PriceUnit(title: 'GST', detail: '200.00'),
        ],
      ),
    );
  }
}
