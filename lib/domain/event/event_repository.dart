import 'package:dartz/dartz.dart';

import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/dtos/filter/filter_dto.dart';

abstract class EventRepository {
  Future<List<FilterDto>> getFilter();
  Future<List<EventDto>> getEvents(
      {required int page,
      required int limit,
      required double lat,
      required double long,
      int? range,
      String? sort,
      String? otherFilters});

  Future<Either<dynamic, EventDto>> getEventDetails({required int eventId});
  void likeUnlikeEvent({required int eventId, required bool isLiked});
}
