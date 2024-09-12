import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/dtos/coupon/coupon_dto.dart';
import '../../infrastructure/event/dtos/cover_balance_history/cover_balance_history_dto.dart';
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
    final bool isBookingEnabled = state.event!.eventTicketCategories
        .any((element) => element.currentTicketsCount > 0);
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
    final bool isBookingEnabled = state.event!.eventTicketCategories
        .any((element) => element.currentTicketsCount > 0);
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
        state.event!.eventTicketCategories
            .where((e) => e.currentTicketsCount != 0)
            .map((e) => {
                  'id': e.id,
                  'noOfTickets': e.currentTicketsCount,
                })
            .toList();

    final response = await state.eventRepository
        .createBooking(eventId: state.event!.id, tickets: tickets,coupon: state.coupon,couponCode: state.couponCode);

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isBookingFailure: true,
        isBookingSuccess: false,
      ));
    }, (r) {
     r = r.copyWith(coupon: state.coupon);
      emit(state.copyWith(
        isLoading: false,
        isBookingFailure: false,
        isBookingSuccess: true,
        bookingDetails: r,
      ));
    });
  }

  void validateCoupon() async {
    try {
      emit(state.copyWith(isCouponLoading: true));
      String couponCode = state.discountController.text.trim();
      final response = await state.eventRepository
          .validateCoupon(couponCode: couponCode, eventId: state.event!.id);
        
      double priceAfterCouponApplied = 0;
      if(state.totalPrice<response.value){
         priceAfterCouponApplied = 0;
      } else{
          priceAfterCouponApplied = state.totalPrice - response.value;
      }
      emit(state.copyWith(
          isCouponLoading: false,
          coupon: response,
          couponCode: couponCode,
          isCouponFailed: false,
          isCouponSuccess: true,
          priceAfterCouponApplied: priceAfterCouponApplied));
    } catch (e) {
      emit(state.copyWith(
          isCouponFailed: true,
          isCouponLoading: false,
          isCouponSuccess: false));
    }
  }
}
