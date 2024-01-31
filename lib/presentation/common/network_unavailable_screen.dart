import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../domain/core/configs/app_config.dart';
import '../../../../domain/core/configs/injection.dart';
import '../../../../domain/core/services/navigation_services/navigation_service.dart';


class NetworkUnavailableScreen extends StatefulWidget {
  final String routeName;
  final Map<String, String> queryParams;
  final bool isClearStack;
  final bool isReplace;
  final dynamic arguments;
  final bool isStartRoute;
  const NetworkUnavailableScreen(
      {super.key,
      required this.routeName,
      required this.queryParams,
      this.isClearStack = false,
      this.isReplace = false,
      this.isStartRoute = false,
      this.arguments});

  @override
  State<NetworkUnavailableScreen> createState() =>
      _NetworkUnavailableScreenState();
}

class _NetworkUnavailableScreenState extends State<NetworkUnavailableScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud_off,
              color: Colors.grey,
              size: 10.w, // 10% of screen width
            ),
            SizedBox(height: 3.h), // 3% of screen height
            Text(
              'Network Unavailable',
              style: TextStyle(
                fontSize: 18.sp, // 2.5% of screen width for font size
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                'Please check your internet connection and try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp, // 2% of screen width for font size
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                ConnectivityResult connectivityResult =
                    await Connectivity().checkConnectivity();

                await Future.delayed(const Duration(milliseconds: 300));

                bool isNetworkAvailable =
                    connectivityResult != ConnectivityResult.none;

                if (isNetworkAvailable) {
                  if (widget.isStartRoute) {
                    AppConfig appConfig = AppConfig.of(context)!;
                    return;
                  }
                  setState(() {
                    isLoading = false;
                  });
                  navigator<NavigationService>().navigateTo(widget.routeName,
                      arguments: widget.arguments,
                      queryParams: widget.queryParams,
                      isClearStack: widget.isClearStack,
                      isReplace: widget.isReplace);
                } else {
                  setState(() {
                    isLoading = false;
                  });

                  Fluttertoast.showToast(
                      msg: 'No network available. Please try again later.');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
              ),
              child: isLoading
                  ? SizedBox(
                      height: 4.w,
                      width: 4.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : Text(
                      'RETRY',
                      style: TextStyle(fontSize: 14.sp),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
