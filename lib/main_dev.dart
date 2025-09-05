import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'domain/core/configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  final appConfig = AppConfig(
    appTitle: 'Festa dev',
    buildFlavor: 'DEV',
    serverUrl: 'https://appdev.festa.world',
    googleMapsApiKey: 'AIzaSyCjOWuul-db69IzI90Wk2VH1t0z1FeFI0s',
    razorPayApiKey: 'rzp_test_7KL1wmpcZzFclD',
    child: Container(),
  );
  appInitializer(appConfig);
}
