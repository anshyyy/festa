import 'dart:developer';

import 'package:app_links/app_links.dart';

import '../configs/injection.dart';
import '../services/navigation_services/navigation_service.dart';
import '../services/navigation_services/routers/route_name.dart';
import '../services/storage_service/dynamic_link_storage_service.dart';

class AppLinkUtil {
 static final AppLinks _appLinks = AppLinks();
  static void initDeepLinks({required bool isAuthorized})async {

      _appLinks.uriLinkStream.listen((event) {
      
      print("deep link :${event.queryParameters}");
     }).onError((e) {
      log("deep link error $e");
    });
    _checkInitialLink(isAuthorized: isAuthorized);
  }
  static Future<void> _checkInitialLink({required bool isAuthorized}) async {
    final initialLink = await _appLinks.getInitialLink();
    print("deep $initialLink");
    if (initialLink != null) {
      _handleLinkData(url: initialLink,isAuthorized: isAuthorized);
    }
  }

    static void _handleLinkData(
      {required Uri url, required bool isAuthorized}) {
    final pathSegments = url.pathSegments;
    print(pathSegments);

    if (pathSegments.isNotEmpty) {
      final category = pathSegments[0];
      final id = pathSegments[1];
      if (!isAuthorized) {
        DynamicLinkStorageService.storeDynamicAppLink(
            category: category, id: id);
      } else {
        if (category == 'weekend') {
          navigator<NavigationService>().navigateTo(UserRoutes.mainNavRoute,
              queryParams: {'filter': 'weekend'});
        } else {
          navigator<NavigationService>().navigateTo(
              getDynamicRoute(category, id),
              queryParams: {'id': id});
        }
      }
    }
  }
  static String getDynamicRoute(String category, String id) {
    switch (category) {
      case 'event':
        return UserRoutes.eventDetailsRoute;
      case 'artist':
        return UserRoutes.artistProfileScreenRoute;
      case 'pub':
        return UserRoutes.clubProfileRoute;
      case 'weekend':
        return UserRoutes.mainNavRoute;
      default:
        UserRoutes.mainNavRoute;
    }
    return UserRoutes.mainNavRoute;
  }
  
}
