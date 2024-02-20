import '../../infrastructure/event/dtos/filter/filter_dto.dart';

abstract class EventRepository {
  Future<List<FilterDto>> getFilter();
}