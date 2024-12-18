import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/ticket/ticket_cubit.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';
import '../../../domain/core/services/navigation_services/navigation_service.dart';
import '../../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/gradient_button.dart';

class CoverScreen extends StatefulWidget {
  final int bookingId;
  final String transactionId;
  final int eventId;
  const CoverScreen(
      {super.key,
      required this.bookingId,
      required this.eventId,
      required this.transactionId});

  @override
  _CoverScreenState createState() => _CoverScreenState();
}

class _CoverScreenState extends State<CoverScreen> {
  TextEditingController coverChargeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final List<String> reccommendedCover = const [
    '500',
    '1000',
    '2000',
    '4000',
    '8000',
    '10000'
  ];

  int? selectedCoverIndex;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);
   
    return BlocProvider(
      create: (context) => TicketCubit(TicketState.initial(
        razorPayApiKey: appConfig.razorPayApiKey,
        serverUrl: appConfig.serverUrl,
      ))
        ..init(bookingId: widget.bookingId),
      // ..fetchCoverBalance(bookingId: widget.bookingId),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          if (state.isPaymentFailure ||
              state.isPaymentSuccess ||
              state.isPaymentPending) {
            navigator<NavigationService>().navigateTo(
              UserRoutes.paymentStatusScreenRoute,
              queryParams: {
                'eventId': widget.eventId.toString(),
                'bookingId': widget.bookingId.toString(),
                'transactionId': widget.transactionId.toString(),
                'isPaymentSuccess': state.isPaymentSuccess.toString(),
                'isPaymentPending': state.isPaymentPending.toString(),
                'totalAmount': 0.toString(),
                'numberOfTickets': 0.toString(),
                'coverAmount': coverChargeController.text.trim()
              },
              isClearStack: true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: SizedBox(
              height: 9.h,
              width: 100.w,
              //  padding: EdgeInsets.only(top: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding:  EdgeInsets.only(left: 2.h,right: 2.h,bottom: 2.h),
                  child:GradientButton(
                    text: 'Proceed to Top-Up',
                    isWidget: state.isAddCoverLoading,
                    child: state.isAddCoverLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : null,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with the logic
                        context.read<TicketCubit>().addCoverBalance(
                              userPhoneNumber: appStateNotifier.user!.phoneNumber,
                              message: noteController.text.trim(),
                              coverAmount:
                                  int.parse(coverChargeController.text.trim()),
                              bookingId: widget.bookingId,
                            );
                      } else {
                        // Form is invalid, show errors
                        // print('Form is invalid');
                      }
                    },
                  )),
                ],
              ),
            ),
            appBar: CustomAppBar(
              title: TicketScreenConstants.addCoverBalance,
              scaffoldBackgroundColor:
                  Theme.of(context).colorScheme.background.withOpacity(.02),
              leading: GestureDetector(
                onTap: () {
                  final NavigationService nav = navigator<NavigationService>();

                  //Check if we can pop the current route
                  if (nav.getNavKey.currentState!.canPop()) {
                    // If we can pop, go back
                    nav.goBack();
                  } else {
                    navigator<NavigationService>().navigateTo(
                      UserRoutes.mainNavRoute,
                      queryParams: {'routeIndex': '0'},
                      isClearStack: true,
                    );
                  }
                },
                child: Center(
                  child: SvgPicture.asset(
                    AssetConstants.arrowLeft,
                    width: 7.w,
                  ),
                ),
              ),
              actions: [],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 44.66.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetConstants.sparkIcon,
                              width: 3.w,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Cover Balance Left: ',
                              style: TextStyle(fontSize: 14.px),
                            ),
                          ],
                        ),
                      ),
                      state.isCoverLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!.withOpacity(0.5),
                              highlightColor:
                                  Colors.grey[400]!.withOpacity(0.5),
                              child: Container(
                                margin: EdgeInsets.all(1.h),
                                height: 4.h,
                                width: 33.w,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              '${state.userTickets?.upcomingTickets.firstWhere((t) => t.id == widget.bookingId).remainingAmount}',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 28.px,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      SizedBox(height: 1.h),
                      Text(
                        'Top Up Cover Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      CustomTextField(
                        controller: coverChargeController,
                        errorStyle: TextStyle(fontSize: 14.sp),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 1.h,
                          horizontal: 4.w,
                        ),
                        keyboardType: TextInputType.number,
                        isImp: true,
                        fillColor: Colors.black,
                        borderColor: Colors.grey,
                        borderRadius: 0,
                        hintText: TicketScreenConstants.addCoverBalanceHint,
                        hintTextStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                        isFill: true,
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: .5.h),
                      SizedBox(
                        height: 4.5.h,
                        child: CustomTextField(
                          controller: noteController,
                          expands: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 4.w,
                          ),
                          
                          fillColor: Colors.black,
                          borderColor: Colors.grey,
                          borderRadius: 0,
                          hintText: TicketScreenConstants.addCoverNotes,
                          hintTextStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.px,
                                  ),
                          isFill: true,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                          onChanged: (p0) {},
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: reccommendedCover.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCoverIndex = index;
                                  coverChargeController.text =
                                      reccommendedCover[index];
                                });
                              },
                              child: Container(
                                height: 6.75.h,
                                width: 31.14.w,
                                margin: EdgeInsets.all(0.5.h),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: selectedCoverIndex == index
                                        ? Colors.green
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${reccommendedCover[index]} cover',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 20.5.h,
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.h, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'What is Cover Balance?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SvgPicture.asset(
                                  AssetConstants.sparkIcon,
                                  width: 3.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              '1. Can be used for food & beverages',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '2. Cannot redeem or transfer',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '3. Cannot be used for another day or event.',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              '4. 1 cover = 1 INR',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SvgPicture.asset(AssetConstants.leaveIcon),
                          SizedBox(width: 2.w),
                          Text(
                            'Reduces paper waste by 40 tons annually!',
                            style: TextStyle(
                              fontSize: 12.px,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
