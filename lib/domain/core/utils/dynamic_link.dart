import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

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
    }).onError((error) {
      print(error);
    });
    onInitialLinkHandler(isAuthorized: isAuthorized);
  }

  static void onInitialLinkHandler({required bool isAuthorized}) {
    try {
      dynamicLinks.getInitialLink().then((dynamicLinkData) {
        if (dynamicLinkData != null) return;
        handleDynamicLink(
            url: dynamicLinkData!.link, isAuthorized: isAuthorized);
      });
    } catch (e) {}
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
        dynamicNavigation(category, id);
      }
    }
  }

  static void dynamicNavigation(String category, String id) {
    switch (category) {
      case 'event':
        navigator<NavigationService>()
            .navigateTo(UserRoutes.eventDetailsRoute, queryParams: {
          'id': id,
        });
      case 'artist':
        navigator<NavigationService>()
            .navigateTo(UserRoutes.artistProfileScreenRoute, queryParams: {
          'artistId': id,
        });
      case 'pub':
        navigator<NavigationService>()
            .navigateTo(UserRoutes.clubProfileRoute, queryParams: {
          'clubId': id,
        });
      default:
        navigator<NavigationService>().navigateTo(
          UserRoutes.homeScreenRoute,
        );
    }
  }
}
