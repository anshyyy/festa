import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/pub/pub_repository.dart';
import '../../../infrastructure/pub/dtos/pub_events_clubbed/pub_events_clubbed_dto.dart';
import '../../../infrastructure/pub/i_pub_repository.dart';

part 'events_calendar_state.dart';
part 'events_calendar_cubit.freezed.dart';

class EventsCalendarCubit extends Cubit<EventsCalendarState> {
  EventsCalendarCubit(super.initialState);

  void init() {
    emit(state.copyWith(isLoading: true));
      getEventsByPubId();
  }

  void getEventsByPubId() async {
    Either<dynamic, PubEventsClubbedDto> events =
        await state.pubRepository.getEventsByPubId(pubId: state.clubId);

    events.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isSuccessful: false,
              isFailed: true,
            )),
        (r) => emit(state.copyWith(
              isLoading: false,
              isSuccessful: true,
              isFailed: false,
              pubEventsClubbed: r,
            )));
  }

  String getEventImageByDate(DateTime date) {
    try {
      
      final event = state.pubEventsClubbed!.events
        .firstWhere((element) => element.startDate.day == date.day && element.startDate.month == date.month); 
        return event.coverImageUrl;
    } catch (e) {
      return '';
    }
  
  }
}
