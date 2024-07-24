import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../widgets/gradient_button.dart';
import 'upcoming_tickets/qr_viewer.dart';
import 'widgets/info.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 4.h,
            width: 25.66.w,
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
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 10, // Number of cards to swipe through
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
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
                          border: Border.all(
                              color: const Color(0xFFff1759), width: 1.4)),
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
                                      image: const DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              'https://s3-alpha-sig.figma.com/img/d9bc/4dab/83f5c5e865e5f8f2be542d6bb434a5a9?Expires=1722816000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Hc12G4qqMf3zMIpaKZ3w0oD~9eGABCDFhlvDRWApj5Og0yUw~Dik8RK~DqbE~Y0bWT--thd9I0P0lSXTz0UTMDdu-D9H24qlJJBHhEvYWcxqycYRrT322ILmoyxbNPkwT3fgvAjiWbb9tI~IYpQSzLQFOfQqlNt1VXtpTw-eybtXrr6j925BWjYBpETcjTdRozx9X2cXe6Cd4LtbN8u7XSGIl--EUr20e7EWqLad8R~uAJqNk1Libj4~16cUTlLKA5j-W1Gz2Wq9qrdKr1kRgKHGBvJmsQ~YEDTPF2wAgcuXZUGvmbembJ9gXqXqZjivA4JesOC1SfvWs0oqTiwpIQ__'),
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
                                          'Reputation Stadium Tour - Tylor Swift Live',
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
                                          'House of commons, Indira Nagar, Bangalore.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.px,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                        width: 50.66.w,
                                        child: Text(
                                          'Wednesday, 20 Nov 2023',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.px,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                        width: 50.66.w,
                                        child: Text(
                                          '08:00PM - 10:30PM',
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
                          Center(
                            child: CustomPaint(
                              size: Size(500,
                                  12), // Specify the size of the custom paint area
                              painter: ZigzagPainter(),
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
                              labelStyle: TextStyle(
                                  fontSize: 15.px, fontWeight: FontWeight.w600),
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 15.px, fontWeight: FontWeight.w600),
                              tabs: const [
                                Tab(text: 'Info'),
                                Tab(text: 'Qr Code')
                              ]),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                InfoWidget(),
                                QrViewer(bookingReferenceId: '121'),
                              ],
                            ),
                          ),
                          Divider(
                            indent: 2.h,
                            endIndent: 2.h,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.h, right: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 44.66.w),
                                  child: Text(
                                    '⚡️ Cover Balance Left: ',
                                    style: TextStyle(fontSize: 14.px),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '250',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 28.px,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    GradientButton(
                                        textStyle: TextStyle(
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                        height: 4.h,
                                        width: 34.85.w,
                                        text: 'Add Cover',
                                        onTap: () {})
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Center(
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
                                             SizedBox(width: 1.w,),
                                            SvgPicture.asset(
                                              AssetConstants.tradingIcon,
                                              width: 5.w,
                                            ),
                                            SizedBox(width: 1.w,),
                                            Text(
                                              'Cover Charge History',
                                              style: TextStyle(
                                                color: Colors.white,
                                                  fontSize: 14.px,
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
                      bottom: 380,
                      left: -3,
                      child: Container(
                        height: 5.125.h,
                        width: 5.125.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color(0xFFff1759), width: 1.4)),
                      ),
                    ),
                    Positioned(
                        bottom: 380,
                        left: -7,
                        child: Container(
                          height: 50,
                          width: 20,
                          color: Colors.black,
                        )),
                    Positioned(
                      bottom: 380,
                      right: -3,
                      child: Container(
                        height: 5.125.h,
                        width: 5.125.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color(0xFFff1759), width: 1.4)),
                      ),
                    ),
                    Positioned(
                        bottom: 380,
                        right: -7,
                        child: Container(
                          height: 50,
                          width: 20,
                          color: Colors.black,
                        )),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: _pageController, // PageController
              count: 10, // Number of cards
              effect: const WormEffect(
                dotHeight: 6.0,
                dotWidth: 6.0,
                radius: 8,
                spacing: 5.0,
                dotColor: const Color.fromARGB(255, 111, 108, 108),
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
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
