import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/dtos/event_booking_details/event_booking_details_dto.dart';
import '../../infrastructure/event/i_event_repository.dart';

part 'booking_cubit.freezed.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(super.initialState);


  void emitFromAnywhere({
    required BookingState state,
  }) {
    emit(state);
  }

  void addTickets({required int id}) {
    double total = state.totalPrice;
    final updated = state.event!.eventTicketCategories.map((e) {
      final int remainingTickets = e.totalCapacity - e.bookedSeats;

      if (e.id == id &&
          e.currentTicketsCount < remainingTickets &&
          e.currentTicketsCount < e.maxTicketsToBook) {
        total += e.price;
        return e.copyWith(currentTicketsCount: e.currentTicketsCount + 1);
      }
      return e;
    }).toList();

    emit(
      state.copyWith(
        noUse: !state.noUse,
        event: state.event!.copyWith(eventTicketCategories: updated),
        totalPrice: total,
      ),
    );
    final bool isBookingEnabled = state.event!.eventTicketCategories.any((element) => element.currentTicketsCount>0);
    emit(state.copyWith(isBookingEnabled: isBookingEnabled));

  }

  void removeTickets({required int id}) {
    double total = state.totalPrice;
    final updated = state.event!.eventTicketCategories.map((e) {
      if (e.id == id && e.currentTicketsCount >= 0) {
        total -= e.price;
        return e.copyWith(currentTicketsCount: e.currentTicketsCount - 1);
      }
      return e;
    }).toList();
    emit(
      state.copyWith(
        noUse: !state.noUse,
        event: state.event!.copyWith(
          eventTicketCategories: updated,
        ),
        totalPrice: total,
      ),
    );
    final bool isBookingEnabled = state.event!.eventTicketCategories.any((element) => element.currentTicketsCount>0);
    emit(state.copyWith(isBookingEnabled: isBookingEnabled));
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
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        event: r,
      ));
    });
  }

  void createBooking() async {
    
      emit(state.copyWith(isLoading: true));
    final List<Map<String, dynamic>> tickets =
        state.event!.eventTicketCategories.map((e) {
      return {
        'id': e.id,
        'noOfTickets': e.currentTicketsCount,
      };
    }).toList();

    final response = await state.eventRepository
        .createBooking(eventId: state.event!.id, tickets: tickets);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isBookingFailure: true,
        isBookingSuccess: false,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isBookingFailure: false,
        isBookingSuccess: true,
        bookingDetails: r,
      ));
    });
    
  }
}
