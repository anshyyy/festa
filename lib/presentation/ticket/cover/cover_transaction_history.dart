import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/extensions/string_extension.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../widgets/custom_appbar.dart';
import '../tickets_screen1.dart';

class CoverTransactionHistory extends StatelessWidget {
  final int bookingId;
  const CoverTransactionHistory({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => TicketCubit(TicketState.initial(
         razorPayApiKey: appConfig.razorPayApiKey,
        serverUrl: appConfig.serverUrl,
      ))
        ..fetchCoverBalanceHistory(bookingId: bookingId),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: TicketScreenConstants.coverTransactionHistory,
              scaffoldBackgroundColor:
                  Theme.of(context).colorScheme.background.withOpacity(.02),
              leading: GestureDetector(
                onTap: () => navigator<NavigationService>().goBack(),
                child: Center(
                  child: SvgPicture.asset(
                    AssetConstants.closeIcon,
                    width: 7.w,
                  ),
                ),
              ),
              actions: [],
            ),
            body: state.isLoading
                ? ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CoverShimmer(),
                      );
                    })
                : state.coverHistory.isEmpty?
                  const Center(
                    child:  Text('No Cover Charge History!!!'),
                  )
                :
                 Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.coverHistory.length,
                          itemBuilder: (context, index) {
                            var cover = state.coverHistory[index];
                            var sign = cover.transactionDirection == 'credit'
                                ? '+'
                                : '-';

                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringExtension.formatTime(
                                            cover.createdAt),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.px,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        cover.notes ?? "",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "$sign${cover.amount}",
                                    style: TextStyle(
                                        color: cover.transactionDirection ==
                                                'credit'
                                            ? Colors.green
                                            : Colors.white,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                          color: const Color.fromARGB(255, 68, 65, 65)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.px,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ ${state.coverHistory.fold(0.0, (sum, item) => sum + double.parse(item.amount)).toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.px,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class CoverShimmer extends StatefulWidget {
  const CoverShimmer({super.key});

  @override
  State<CoverShimmer> createState() => _CoverShimmerState();
}

class _CoverShimmerState extends State<CoverShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h, // You can adjust the height
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!.withOpacity(0.5),
                highlightColor: Colors.grey[400]!.withOpacity(0.5),
                child: Container(
                  width: 200, // Adjust the width
                  height: 20, // Adjust the height
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!.withOpacity(0.5),
                highlightColor: Colors.grey[400]!.withOpacity(0.5),
                child: Container(
                  width: 200, // Adjust the width
                  height: 20, // Adjust the height
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!.withOpacity(0.5),
            highlightColor: Colors.grey[400]!.withOpacity(0.5),
            child: Container(
              width: 100, // Adjust the width
              height: 20, // Adjust the height
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
