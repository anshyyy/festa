import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  bool isOffline;

  AppStateNotifier({
    required this.isAuthorized,
    required this.isOffline,
  });

  Future<void> updateAfterAuthChange({
    required bool isAuthorized,
  }) async {
    this.isAuthorized = isAuthorized;

    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String appUrl;
  final String serverUrl;

  @override
  // ignore: overridden_fields
  final Widget child;

  const AppConfig({
    super.key,
    required this.appTitle,
    required this.buildFlavor,
    required this.child,
    required this.appUrl,
    required this.serverUrl,
  }) : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
