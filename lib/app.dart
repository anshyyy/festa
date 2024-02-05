import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/core/services/app_update_service/app_update_service.dart';
import 'domain/core/services/navigation_services/navigation_service.dart';
import 'domain/core/services/navigation_services/routers/route_name.dart';
import 'domain/core/services/navigation_services/routers/routing_config.dart';
import 'domain/core/themes/app_theme.dart';
import 'presentation/common/app_update.dart';

class MainApp extends StatelessWidget with WidgetsBindingObserver {
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     initClearNotificationsState(
  //         navigationKey: navigator<NavigationService>().navigatorKey);
  //   }
  // }

  MainApp({Key? key}) : super(key: key) {
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'NotoSans',
          primaryColor: const Color(0xFFFFFFFF),
          scaffoldBackgroundColor: const Color(0xFF0D0D0D),
          colorScheme: ThemeData().colorScheme.copyWith(
                tertiaryContainer: const Color(0xFF000000),
                primary: const Color(0xffff1795),
                primaryContainer: const Color(0xffF2F4F7),
                onPrimary: const Color(0xff333333),
                background: const Color(0xffF2F4F7),
                onBackground: const Color(0xffDDE0E6),
                secondary: const Color(0xff7C7C7C),
                secondaryContainer: const Color(0xff242424),
                onSecondary: const Color(0xff888888),
                tertiary: const Color(0xff64C2F5),
                error: const Color(0xffE65A5A),
                onSurface: const Color(0xff3C64B4),
                onTertiaryContainer: const Color(0xff4F4F4F),
                onTertiary: const Color(0xffFFC821),
                inversePrimary: const Color(0xFFD0F9E5),
                surface: const Color(0xFFEB5757),
                outline: const Color(0xFF292D32),
                shadow: const Color(0xFFFFFFFF),
                onInverseSurface: const Color(0xFFDDE0E6),
                surfaceTint: const Color(0xFF828282),
                inverseSurface: const Color(0xFF7279A9),
              ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'NotoSans',
            ),
            bodyMedium: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'NotoSans',
            ),
            bodySmall: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'NotoSans',
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      builder: (context, child) {
        return Column(
          children: [
            Expanded(child: child!),
            if (Provider.of<AppStateNotifier>(context).isOffline)
              Material(
                color: Theme.of(context).errorColor,
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
              ? UserRoutes.mainNavRoute
              : AuthRoutes.startRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  // Future.delayed(const Duration(seconds: 5)).then((value) => monitorNetwork());

  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  bool isAuthorized = 1 != 1;
  bool isOffline = false;

  if (isAuthorized && !isOffline) {}

  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: isAuthorized,
    isOffline: isOffline,
  );

  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    buildFlavor: appConfig.buildFlavor,
    serverUrl: appConfig.serverUrl,
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
  return runApp(configuredApp);
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
            return WillPopScope(
              onWillPop: () async => false,
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
