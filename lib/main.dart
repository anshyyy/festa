
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
    appTitle: 'Festa',
    buildFlavor: 'PROD',
    serverUrl: 'https://appdev.festa.world',
    // Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080',
    // 'https://core-api.festa.world',
    googleMapsApiKey: '',
    razorPayApiKey: '',
    child: Container(),
  );
  appInitializer(appConfig);
}
