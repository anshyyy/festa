import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/event/event_repository.dart';
import '../../../domain/user/user_repository.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/i_event_repository.dart';
import '../../../infrastructure/user/i_user_repository.dart';

part 'event_options_state.dart';
part 'event_options_cubit.freezed.dart';

class EventOptionsCubit extends Cubit<EventOptionsState> {
  EventOptionsCubit(super.initialState);

  void init() async {
    fetchEventDetails(id: state.eventId);
  }

  void fetchEventDetails({required int id}) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    Either<dynamic, EventDto> res =
        await state.eventRepository.getEventDetails(eventId: id);

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

  void blockEvent() async {
    emit(state.copyWith(
      goToHome: true,
    ));
  
    await state.userRepository
        .block(id: state.eventId.toString(), type: 'event');
  }
}
