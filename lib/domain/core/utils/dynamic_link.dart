import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../configs/injection.dart';
import '../constants/string_constants.dart';
import '../services/navigation_services/navigation_service.dart';
import '../services/navigation_services/routers/route_name.dart';
import '../services/storage_service/dynamic_link_storage_service.dart';

class DynamicLinkUtil {
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static String generateLink(String category, String id) {
    return AppConstants.dynamicUrl
        .replaceAll('<category>', category)
        .replaceAll('<id>', id);
  }

  static void initDynamicLinks({required bool isAuthorized}) {
    dynamicLinks.onLink.listen((event) {
      final url = event.link;
      handleDynamicLink(url: url, isAuthorized: isAuthorized);
    }).onError((error) {});
    onInitialLinkHandler(isAuthorized: isAuthorized);
  }

  static void onInitialLinkHandler({required bool isAuthorized}) {
    dynamicLinks.getInitialLink().then((dynamicLinkData) {
      if (dynamicLinkData == null) return;
      handleDynamicLink(url: dynamicLinkData.link, isAuthorized: isAuthorized);
    });
  }

  static void handleDynamicLink(
      {required Uri url, required bool isAuthorized}) {
    final pathSegments = url.pathSegments;
    if (pathSegments.isNotEmpty) {
      final category = pathSegments[0];
      final id = pathSegments[1];
      if (!isAuthorized) {
        DynamicLinkStorageService.storeDynamicAppLink(
            category: category, id: id);
      } else {
        // Fluttertoast.showToast(msg: 'Hello Dynamic Link $id',
        // gravity: ToastGravity.TOP,
        // textColor: Colors.black,
        // backgroundColor: Colors.green,
        // );
        String route = getDynamicRoute(category, id);
          navigator<NavigationService>().navigateTo(route, queryParams: {
            'id': id,
          });
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
      default:
        UserRoutes.mainNavRoute;
    }
    return UserRoutes.mainNavRoute;
  }
}
