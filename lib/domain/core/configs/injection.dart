import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:injectable/injectable.dart';
import '../services/navigation_services/navigation_service.dart';
import 'app_config.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt);

GetIt navigator = GetIt.instance;

void setupLocator(
    GlobalKey<NavigatorState> navKey, AppStateNotifier appStateNotifier) {
  navigator.registerFactory(() => NavigationService(navKey, appStateNotifier));
}
