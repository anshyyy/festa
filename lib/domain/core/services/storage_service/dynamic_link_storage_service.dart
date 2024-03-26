import 'package:hive/hive.dart';

import 'storage_service.dart';

class DynamicLinkStorageService {
  static const String _initLinkPathSegments = 'initLinkPathSegments';
  static const String _category = 'category';
  static const String _id = 'id';

  static void storeDynamicAppLink(
      {required String category, required String id}) async {
    final coreBox = await Hive.openBox(StorageService.coreBox);
    coreBox.put(_initLinkPathSegments, {
      _category: category,
      _id: id,
    });
  }

  static Future getStoredDynamicLink() async {
    final coreBox = await Hive.openBox(StorageService.coreBox);
    return coreBox.get(_initLinkPathSegments);
  }

  static void clearStoredDynamicLink() async {
    final coreBox = await Hive.openBox(StorageService.coreBox);
    await coreBox.delete(_initLinkPathSegments);
  }
}
