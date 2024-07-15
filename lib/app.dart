import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/auth/auth_repository.dart';
import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/core/constants/string_constants.dart';
import 'domain/core/services/analytics_service/analytics_service.dart';
import 'domain/core/services/app_update_service/app_update_service.dart';
import 'domain/core/services/navigation_services/navigation_service.dart';
import 'domain/core/services/navigation_services/routers/route_name.dart';
import 'domain/core/services/navigation_services/routers/routing_config.dart';
import 'domain/core/themes/app_theme.dart';
import 'domain/core/utils/dynamic_link.dart';
import 'infrastructure/auth/i_auth_repository.dart';
import 'infrastructure/core/dtos/location/location_dto.dart';
import 'infrastructure/core/enum/profile_state.enum.dart';
import 'presentation/common/app_update.dart';

class MainApp extends StatelessWidget with WidgetsBindingObserver {
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     initClearNotificationsState(
  //         navigationKey: navigator<NavigationService>().navigatorKey);
  //   }
  // }

  MainApp({super.key}) {
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.Default],
      builder: (context, child) {
        return Column(
          children: [
            Expanded(child: Scaffold(body: child!)),
            if (Provider.of<AppStateNotifier>(context).isOffline)
              Material(
                color: Theme.of(context).colorScheme.error,
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  bottom: Platform.isIOS ? true : false,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 3.h,
                    child: Text(
                      'No Connection',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              )
          ],
        );
      },
      navigatorKey: navigator<NavigationService>().navigatorKey,
      onGenerateRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? authorizedNavigation
          : commonNavigation,
      initialRoute: Provider.of<AppStateNotifier>(context).isOffline
          ? GeneralRoutes.noNetworkAtStart
          : Provider.of<AppStateNotifier>(context).isAuthorized
              ? Provider.of<AppStateNotifier>(context).profileState ==
                      ProfileStateEnum.completed
                  ? UserRoutes.mainNavRoute
                  : Provider.of<AppStateNotifier>(context).profileState ==
                          ProfileStateEnum.gender
                      ? AuthRoutes.usernameRoute
                      : Provider.of<AppStateNotifier>(context).profileState ==
                              ProfileStateEnum.birthday
                          ? AuthRoutes.genderRoute
                          : Provider.of<AppStateNotifier>(context)
                                      .profileState ==
                                  ProfileStateEnum.basic
                              ? AuthRoutes.birthdayRoute
                              : AuthRoutes.basicInfoRoute
              : AuthRoutes.startRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  // Future.delayed(const Duration(seconds: 5)).then((value) => monitorNetwork());

  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  AuthRepository authRepository =
      IAuthRepository(serverUrl: appConfig.serverUrl);
  final user = await authRepository.authentication();

  bool isAuthorized = user != null;

  bool isOffline = false;

  ProfileStateEnum? profileState;

  if (isAuthorized && !isOffline) {
    profileState = user.fullName.isNotEmpty &&
            user.dob.isNotEmpty &&
            user.gender.isNotEmpty &&
            user.tag != null
        ? ProfileStateEnum.completed
        : user.fullName.isNotEmpty &&
                user.dob.isNotEmpty &&
                user.gender.isNotEmpty
            ? ProfileStateEnum.gender
            : user.fullName.isNotEmpty && user.dob.isNotEmpty
                ? ProfileStateEnum.birthday
                : user.fullName.isNotEmpty
                    ? ProfileStateEnum.basic
                    : ProfileStateEnum.started;
  }
  final permission = await Geolocator.checkPermission();
  if (permission != LocationPermission.always &&
      permission != LocationPermission.whileInUse) {
  } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LocationDto(
        latitude: position.latitude,
        longitude: position.longitude,
        area: 'Bengaluru',
        city: 'Bengaluru',
        state: 'Karnataka',
        country: 'India',
        icon: '');
  }

  if (user != null) {
    AnalyticsService().setUserId(user.id.toString());
    AnalyticsService()
        .setUserProperties(name: 'user_id', val: user.id.toString());
    AnalyticsService()
        .setUserProperties(name: 'phone_no', val: user.phoneNumber.toString());
  }

  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: isAuthorized,
    isOffline: isOffline,
    profileState: profileState,
    user: user,
    menuIndex: 0,
  );

  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    buildFlavor: appConfig.buildFlavor,
    serverUrl: appConfig.serverUrl,
    serverUrl2: appConfig.serverUrl2,
    googleMapsApiKey: appConfig.googleMapsApiKey,
    razorPayApiKey: appConfig.razorPayApiKey,
    child: ChangeNotifierProvider<AppStateNotifier>(
      create: (context) {
        return appStateNotifier;
      },
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return MainApp();
        },
      ),
    ),
  );

  checkForAppUpdate(navKey);

  setupLocator(navKey, appStateNotifier);

  initMessagingService(navigationKey: navKey);

  Future.delayed(const Duration(seconds: 2)).then((value) {
    DynamicLinkUtil.initDynamicLinks(isAuthorized: isAuthorized);
  });
  return runApp(configuredApp);
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future initMessagingService({
  required GlobalKey<NavigatorState> navigationKey,
}) async {
  bool isPermissionGranted = true;
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  await fcm.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => {print(message)},
      );
    }
  });

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  if (isPermissionGranted) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (Platform.isAndroid) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: DateTime.now().microsecond,
            channelKey: AppConstants.channelKey,
            title: message.notification?.title,
            body: message.notification?.body,
            actionType: ActionType.Default,
            payload: message.data
                .map((key, value) => MapEntry(key, value.toString())),
          ),
        );
      }

      if (message.data.isEmpty) {
        return;
      }

      if (message.data['is_fcm'] == null) {
        return;
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message);
      //
    });
  }
  if (Platform.isAndroid) {
    await AwesomeNotifications().initialize(
      'resource://drawable/notification_icon',
      [
        NotificationChannel(
            channelGroupKey: AppConstants.channelGroupKey,
            channelKey: AppConstants.channelKey,
            channelName: AppConstants.channelName,
            channelDescription: AppConstants.channelDescription,
            defaultColor: const Color(0xff232E78),
            ledColor: Colors.white)
      ],
    );
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {},
    );
  }
}

Future<Map<String, dynamic>> getRemoteConfigs() async {
  Map<String, dynamic> configs = {};

  String hash = '';
  String appLink = '';
  int minVersion = 0;
  int latestVersion = 0;

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(minutes: 2),
  ));
  await remoteConfig.fetchAndActivate().then((value) {
    hash = remoteConfig.getString('hash');
    appLink = remoteConfig.getString('app_link');
    minVersion = remoteConfig.getInt('min_version');
    latestVersion = remoteConfig.getInt('latest_version');
    AppConstants.underReview = remoteConfig.getBool('under_review');

    configs = {
      'app_link': appLink,
      'hash': hash,
      'min_version': minVersion,
      'latest_version': latestVersion,
    };
  });

  return configs;
}

// check for app update
Future checkForAppUpdate(GlobalKey<NavigatorState> navKey) async {
  await Future.delayed(
    const Duration(milliseconds: 100),
  );

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  int buildNumber = int.parse(packageInfo.buildNumber);
  int minVersion = 0;
  int latestVersion = 0;
  bool isForceUpdate = false;
  bool isNewReleaseAvailable = false;
  String currentAppHash = await AppUpdateService.getAppHashValue();
  String newAppHash = '';
  String appLink = '';

  try {
    Map<String, dynamic> appUpdateData = await getRemoteConfigs();

    newAppHash = appUpdateData['hash'];
    appLink = appUpdateData['app_link'];
    latestVersion = appUpdateData['latest_version'];
    minVersion = appUpdateData['min_version'];
    isForceUpdate = buildNumber < minVersion;
    isNewReleaseAvailable = buildNumber < latestVersion;

    if (isForceUpdate) {
      showDialog(
          context: navKey.currentContext!,
          builder: (BuildContext ctx) {
            return PopScope(
              onPopInvoked: (didPop) async => false,
              child: ForceUpdateWidget(
                downloadLink: appLink,
              ),
            );
          });
    } else if (isNewReleaseAvailable) {
      if (currentAppHash != newAppHash) {
        return showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: navKey.currentContext!,
            builder: (context) {
              return NewReleaseAvailable(
                hashValue: newAppHash,
                downloadLink: appLink,
              );
            });
      }
    }
  } catch (error) {
    debugPrint(error.toString());
  }
}
