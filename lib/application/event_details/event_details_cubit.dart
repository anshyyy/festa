import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/i_event_repository.dart';
part 'event_details_state.dart';
part 'event_details_cubit.freezed.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(super.initialState);

  void fetchEventDetails({required int id}) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    Either<dynamic, EventDto> res =
        await state.eventRepository.getEventDetails(eventId:id);
    res.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
      )),
      (r) => emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        event: r,
      )),
    );
  }

  void toggleLsd() {
    emit(state.copyWith(lsdExpanded: !state.lsdExpanded));
  }

  void toggleAmb() {
    emit(state.copyWith(ambExpanded: !state.ambExpanded));
  }

  void toggleFnb() {
    emit(state.copyWith(fnbExpanded: !state.fnbExpanded));
  }

  void toggleFaq() {
    emit(state.copyWith(faqExpanded: !state.faqExpanded));
  }

  void onEventLikedUnliked({required int eventId}){
    state.eventRepository.likeUnlikeEvent(eventId: eventId, isLiked: state.isEventLiked);
    emit(state.copyWith(isEventLiked: !state.isEventLiked));
  }
}
