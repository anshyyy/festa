import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/ticket/ticket_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/extensions/string_extension.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../../domain/core/utils/animated_flip_counter.dart';
import '../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import '../widgets/gradient_button.dart';
import 'upcoming_tickets/qr_viewer.dart';
import 'widgets/info.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    return BlocProvider(
      create: (context) => TicketCubit(TicketState.initial(
        razorPayApiKey: appConfig.razorPayApiKey,
        serverUrl: appConfig.serverUrl,
      ))
        ..init(),
      child: const TicketsScreen1(),
    );
  }
}

class TicketsScreen1 extends StatefulWidget {
  const TicketsScreen1({super.key});

  @override
  _TicketsScreen1State createState() => _TicketsScreen1State();
}

class _TicketsScreen1State extends State<TicketsScreen1>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late TabController _tabController;

  Future<void> _setMaxBrightness() async {
    try {
      await ScreenBrightness().setScreenBrightness(1.0);
    } catch (e) {
      ('Failed to set brightness: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _setMaxBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              TicketScreenConstants.myTickets,
              style: TextStyle(
                fontSize: 28.px,
                fontWeight: FontWeight.w600,
              ),
            ),
            leadingWidth: 0,
            centerTitle: false,
            actions: [
              InkWell(
                onTap: () {
                  navigator<NavigationService>()
                      .navigateTo(UserRoutes.pastTickets);
                },
                child: Container(
                  height: 4.h,
                  width: 25.66.w,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: Text(
                      TicketScreenConstants.pastTickets,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.px,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  var contact = '+919686649241';
                  var androidUrl =
                      "whatsapp://send?phone=$contact&text=Hi, I need some help";
                  var iosUrl =
                      "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

                  try {
                    if (Platform.isIOS) {
                      await launchUrl(Uri.parse(iosUrl));
                    } else {
                      await launchUrl(Uri.parse(androidUrl));
                    }
                  } on Exception {
                  print('WhatsApp is not installed.');
                  }
                },
                child: Container(
                  height: 4.h,
                  width: 10.66.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetConstants.whatsappsupportIcon,
                      width: 5.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2.5.w,
              )
            ],
          ),
          body: state.isLoading
              ? UpcomingTicketShimmer()
              : state.userTickets!.upcomingTickets.isEmpty
                  ? Container(
                      height: 65.h,
                      width: 100.w,
                      color:
                          Theme.of(context).colorScheme.surface.withOpacity(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetConstants.ticketIcon,
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'No Tickets',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount:
                                state.userTickets!.upcomingTickets.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              var ticket =
                                  state.userTickets!.upcomingTickets[index];

                              return TicketUI(ticket,
                                  state.userTickets!.upcomingTickets[index].id);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmoothPageIndicator(
                            controller: _pageController, // PageController
                            count: state.userTickets!.upcomingTickets
                                .length, // Number of cards
                            effect: const WormEffect(
                              dotHeight: 6.0,
                              dotWidth: 6.0,
                              radius: 8,
                              spacing: 5.0,
                              dotColor:
                                  const Color.fromARGB(255, 111, 108, 108),
                              activeDotColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }

  LayoutBuilder TicketUI(BookedTicketDetailsDto ticket, int bookingId) {
    // context.read<TicketCubit>().fetchCoverBalance(
    //     bookingId: bookingId);
    return LayoutBuilder(builder: (context, constraint) {
      return Stack(
        children: [
          Container(
            height: 72.625.h,
            width: 100.w,
            margin: EdgeInsets.only(
                top: 1.h, bottom: 1.h, left: 1.5.h, right: 1.5.h),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      Color(0xff202020),
                      Color(0xff000000),
                    ]),
                borderRadius: BorderRadius.circular(2.5.h),
                border: Border.all(color: const Color(0xFFff1759), width: 1.4)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
                  height: 18.h,
                  width: 82.75.w,
                  child: Row(
                    children: [
                      Container(
                        height: 18.h,
                        width: 28.42.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    ticket.eventDetails.coverImage),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.grey.withOpacity(0.3),
                            )),
                      ),
                      SizedBox(width: 3.w),
                      Column(
                        children: [
                          SizedBox(
                              width: 50.66.w,
                              child: Text(
                                ticket.eventDetails.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.px,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                              width: 50.66.w,
                              child: Text(
                                ticket.eventDetails.address?.vicinity ??
                                    "Bangalore",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                              width: 50.66.w,
                              child: Text(
                                StringExtension.formatDateString(
                                    ticket.eventDetails.startDate),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                              width: 50.66.w,
                              child: Text(
                                StringExtension.formatTimeRange(
                                    ticket.eventDetails.startDate,
                                    ticket.eventDetails.endDate ?? ""),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: Platform.isAndroid
                      ? EdgeInsets.only(top: 2.h)
                      : EdgeInsets.zero,
                  child: Center(
                    child: CustomPaint(
                      size: Size(62.5.h,
                          1.6.h), // Specify the size of the custom paint area
                      painter: ZigzagPainter(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                //tab bar here
                TabBar(
                    indicatorColor: Colors.white,
                    tabAlignment: TabAlignment.center,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.only(left: 2.h),
                    padding: const EdgeInsets.all(0),
                    controller: _tabController,
                    labelStyle:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    tabs: const [Tab(text: 'Info'), Tab(text: 'Qr Code')]),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      InfoWidget(
                        ticket: ticket,
                      ),
                      QrViewer(bookingReferenceId: ticket.id.toString()),
                    ],
                  ),
                ),

                Divider(
                  indent: 2.h,
                  endIndent: 2.h,
                  color: Colors.grey,
                ),

                if (!ticket.eventDetails.coverChargeEnabled) ...[
                  SizedBox(
                      width: 70.w,
                      child: Center(
                          child: Text(
                        'This venue has not partnered to digitize the cover charge.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ))),
                  SizedBox(height: 1.h),
                  GradientButton(
                      width: 157,
                      height: 4.25.h,
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w700,
                      ),
                      text: 'Request Partnership',
                      onTap: () {}),
                  SizedBox(height: 2.h),
                ],

                if (ticket.eventDetails.coverChargeEnabled)
                  Padding(
                    padding: EdgeInsets.only(left: 2.h, right: 2.h),
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
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedFlipCounter(
                                wholeDigits: 7,
                                duration: const Duration(milliseconds: 2000),
                                hideLeadingZeroes: true,
                                curve: Curves.easeInBack,
                                textStyle: TextStyle(
                                    color: Colors.green,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600),
                                value: ticket.remainingAmount),

                            // Text(
                            //   ticket.remainingAmount.toString(),
                            //   style: TextStyle(
                            //       color: Colors.green,
                            //       fontSize: 22.sp,
                            //       fontWeight: FontWeight.w600),
                            // ),
                            GradientButton(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                height: 4.h,
                                width: 34.85.w,
                                text: 'Add Cover',
                                onTap: () {
                                  navigator<NavigationService>().navigateTo(
                                      UserRoutes.addCoverRoute,
                                      queryParams: {
                                        'eventId':
                                            ticket.eventDetails.id.toString(),
                                        'bookingId': ticket.id.toString(),
                                        'transactionId': ticket.transactionId
                                      });
                                })
                          ],
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<TicketCubit>()
                                  .fetchCoverBalanceHistory(
                                      bookingId: ticket.id);
                              navigator<NavigationService>().navigateTo(
                                  UserRoutes.coverTransactionHistory,
                                  queryParams: {
                                    'bookingId': ticket.id.toString()
                                  });
                            },
                            child: Container(
                              width: 86.75.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 1.h,
                                      ),
                                      SvgPicture.asset(
                                        AssetConstants.tradingIcon,
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        'Cover Charge History',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    AssetConstants.arrowRight,
                                    width: 7.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
          Positioned(
            bottom: constraint.maxHeight * 0.63,
            left: -3,
            child: Container(
              height: 5.125.h,
              width: 5.125.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  border:
                      Border.all(color: const Color(0xFFff1759), width: 1.4)),
            ),
          ),
          Positioned(
              bottom: constraint.maxHeight * 0.63,
              left: (constraint.maxHeight * 0.000001),
              child: Container(
                height: 12.5.h,
                width: 1.525.h,
                color: Colors.black,
              )),
          Positioned(
            bottom: constraint.maxHeight * 0.63, //47.5.h - 380
            right: -3,
            child: Container(
              height: 5.125.h,
              width: 5.125.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  border:
                      Border.all(color: const Color(0xFFff1759), width: 1.4)),
            ),
          ),
          Positioned(
              bottom: constraint.maxHeight * 0.63,
              right: (constraint.maxHeight * 0.000001),
              child: Container(
                height: 12.5.h,
                width: 1.525.h,
                color: Colors.black,
              )),
        ],
      );
    });
  }
}

class ZigzagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFFff1759)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double x = 0;
    double y = size.height / 2;
    bool goingDown = true;
    double amplitude = size.height / 2; // Height of the zigzag

    // Create the zigzag path
    while (x < size.width) {
      path.lineTo(x, y);
      if (goingDown) {
        y += amplitude;
      } else {
        y -= amplitude;
      }
      goingDown = !goingDown;
      x += amplitude; // Adjust this to change the frequency of the zigzag
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TicketTabBar extends StatefulWidget {
  const TicketTabBar({Key? key}) : super(key: key);

  @override
  _TicketTabBarState createState() => _TicketTabBarState();
}

class _TicketTabBarState extends State<TicketTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          _buildTab(0, 'QR Code'),
          _buildTab(1, 'Info'),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFff1759) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 16.px,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingTicketShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[400]!.withOpacity(0.5),
      child: Container(
        margin: EdgeInsets.all(3.h),
        height: 72.625.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
