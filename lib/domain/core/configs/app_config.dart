import 'package:flutter/material.dart';

import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/core/enum/profile_state.enum.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  bool isOffline;
  ProfileStateEnum? profileState;
  LocationDto? location;
  UserDto? user;

  AppStateNotifier({
    required this.isAuthorized,
    required this.isOffline,
    this.profileState,
    this.location,
    this.user,
  });

  Future<void> updateAfterAuthChange({
    required bool isAuthorized,
    UserDto? user,
  }) async {
    this.isAuthorized = isAuthorized;
    this.user = user;
    if (user != null) {
      profileState = user.fullName.isNotEmpty &&
              user.dob.isNotEmpty &&
              user.gender.isNotEmpty
          ? ProfileStateEnum.completed
          : user.fullName.isNotEmpty && user.dob.isNotEmpty
              ? ProfileStateEnum.birthday
              : user.fullName.isNotEmpty
                  ? ProfileStateEnum.basic
                  : ProfileStateEnum.started;
    }
    notifyListeners();
  }

  Future<void> updateAfterNetworkChange({required bool isOffline}) async {
    this.isOffline = isOffline;
    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String serverUrl;
  final String googleMapsApiKey;
  @override
  // ignore: overridden_fields
  final Widget child;

  const AppConfig({
    super.key,
    required this.appTitle,
    required this.buildFlavor,
    required this.child,
    required this.serverUrl,
    required this.googleMapsApiKey,
  }) : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
