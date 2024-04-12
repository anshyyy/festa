import '../../../infrastructure/event/dtos/filter/filter_dto.dart';

class CacheStorageHome {
  static FilterDto? homeCategoryFilter;

static  void updateHomeCategoryFilter({ FilterDto? filterDto}) {
    homeCategoryFilter = filterDto;
  }
}
