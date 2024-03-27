import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/i_event_repository.dart';

part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(super.initialState);

  void addTickets({required int id, required int maxTickets}) {
    switch (id) {
      case 1:
        if (maxTickets > state.earlyBirdTicketCount) {
          addEarlyBirdTicket();
        }
        break;
      case 2:
        if (maxTickets > state.standardTicketCount) {
          addStandardTicket();
        }
        break;
      default:
    }
  }

  void addStandardTicket() {
    emit(state.copyWith(standardTicketCount: state.standardTicketCount + 1));
  }

  void removeStandardTicket() {
    emit(state.copyWith(standardTicketCount: state.standardTicketCount - 1));
  }

  void addEarlyBirdTicket() {
    emit(state.copyWith(earlyBirdTicketCount: state.earlyBirdTicketCount + 1));
  }

  void removeEarlyBirdTicket() {
    emit(state.copyWith(earlyBirdTicketCount: state.earlyBirdTicketCount - 1));
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
}
