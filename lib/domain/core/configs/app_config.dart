import 'package:flutter/material.dart';

import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/dtos/location/location_dto.dart';
import '../../../infrastructure/core/enum/profile_state.enum.dart';
import '../services/storage_service/location_storage_service.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  bool isOffline;
  ProfileStateEnum? profileState;
  LocationDto? location;
  UserDto? user;
  bool goToTop;
  int? menuIndex;
  LocationStorageService _locationStorageService = LocationStorageService();

  AppStateNotifier({
    required this.isAuthorized,
    required this.isOffline,
    this.profileState,
    this.location,
    this.user,
    this.goToTop = false,
    this.menuIndex,
  });

  void onMenuChange({
    required int index,
    bool goToTop = false,
  }) async {
    menuIndex = index;
    this.goToTop = goToTop;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    this.goToTop = false;
  }

  Future<void> updateAfterAuthChange({
    required bool isAuthorized,
    UserDto? user,
  }) async {
    this.isAuthorized = isAuthorized;
    this.user = user;
    if (user != null) {
      profileState = user.fullName.isNotEmpty &&
              user.dob.isNotEmpty
          ? ProfileStateEnum.completed
          : user.fullName.isNotEmpty && user.dob.isNotEmpty
              ? ProfileStateEnum.birthday
              : user.fullName.isNotEmpty
                  ? ProfileStateEnum.basic
                  : ProfileStateEnum.started;
    }
    if (!isAuthorized) {
      menuIndex = 1;
    }
    notifyListeners();
  }

  void updateUser({
    UserDto? user,
  }) {
    this.user = user;
    notifyListeners();
  }

  Future<void> updateAfterNetworkChange({required bool isOffline}) async {
    this.isOffline = isOffline;
    notifyListeners();
  }

  Future<void>updateLocation({required LocationDto location}) async{
    this.location = location;
    await _locationStorageService.saveLocation(location);
    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String serverUrl;
  final String googleMapsApiKey;
  final String razorPayApiKey;
  @override
  // ignore: overridden_fields
  final Widget child;

  const AppConfig(
      {super.key,
      required this.appTitle,
      required this.buildFlavor,
      required this.child,
      required this.serverUrl,
      required this.googleMapsApiKey,
      required this.razorPayApiKey})
      : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
