import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/dtos/coupon/coupon_dto.dart';
import '../../infrastructure/event/dtos/cover_balance_history/cover_balance_history_dto.dart';
import '../../infrastructure/event/dtos/event/event_dto.dart';
import '../../infrastructure/event/dtos/event_booking_details/event_booking_details_dto.dart';
import '../../infrastructure/event/dtos/event_ticket/event_ticket.dart';
import '../../infrastructure/event/dtos/ticket/ticket_dto.dart';
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

  void changeTab(int index) {
    emit(state.copyWith(selectedTab: index));
  }

  void _showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      fontSize: 15.sp,
    );
  }

  void addTickets({required int id}) {
    double total = state.totalPrice;

    final updated = state.ticketLists[state.selectedTab].map((e) {
      final int remainingTickets = e.totalCapacity - e.bookedSeats;
      final int totalTicketsWithBooked = e.currentTicketsCount! + e.bookedByMe;

      if (e.id == id) {
        if (totalTicketsWithBooked >= e.maxTicketsToBook) {
          _showToast(
              'You have reached the maximum limit of ${e.maxTicketsToBook} tickets');
          return e;
        } else if (e.currentTicketsCount! >= remainingTickets) {
          _showToast('No more tickets available in this category');
          return e;
        } else {
          total += (e.price+e.coverCharge);
          return e.copyWith(currentTicketsCount: e.currentTicketsCount! + 1);
        }
      }
      return e;
    }).toList();
    print(total);

    var ticketLists = List<List<EventTicketDto>>.from(state.ticketLists);
    ticketLists[state.selectedTab] = updated;

    emit(
      state.copyWith(
        noUse: !state.noUse,
        ticketLists: ticketLists,
        // event: state.event!.copyWith(eventTicketCategories: updated),
        totalPrice: total,
      ),
    );

    final bool isBookingEnabled = ticketLists.any((ticketList) =>
        ticketList.any((ticket) => (ticket.currentTicketsCount ?? 0) > 0));
    emit(state.copyWith(isBookingEnabled: isBookingEnabled));
  }

  void removeTickets({required int id}) {
    double total = state.totalPrice;
    final updated = state.ticketLists[state.selectedTab].map((e) {
      if (e.id == id && e.currentTicketsCount! >= 0) {
        total -= (e.price+e.coverCharge);
        return e.copyWith(currentTicketsCount: e.currentTicketsCount! - 1);
      }
      return e;
    }).toList();

    var ticketLists = List<List<EventTicketDto>>.from(state.ticketLists);
    ticketLists[state.selectedTab] = updated;
    emit(
      state.copyWith(
        noUse: !state.noUse,
        ticketLists: ticketLists,
        totalPrice: total,
      ),
    );
    final bool isBookingEnabled = ticketLists.any((ticketList) =>
        ticketList.any((ticket) => (ticket.currentTicketsCount ?? 0) > 0));
    emit(state.copyWith(isBookingEnabled: isBookingEnabled));
  }

  void fetchEventTickets({required int id}) async {
    try {
      emit(state.copyWith(isLoading: true));
      var tickets = await state.eventRepository.getTickets(eventId: id);
      int tabs = 0;
      if (tickets.coverTickets.isNotEmpty &&
          tickets.entryCoverTickets.isNotEmpty &&
          tickets.entryTickets.isNotEmpty) {
        tabs = 3;
      } else if ((tickets.coverTickets.isNotEmpty &&
              tickets.entryCoverTickets.isNotEmpty) ||
          (tickets.coverTickets.isNotEmpty &&
              tickets.entryTickets.isNotEmpty) ||
          (tickets.entryCoverTickets.isNotEmpty &&
              tickets.entryTickets.isNotEmpty)) {
        tabs = 2;
      } else {
        tabs = 0;
      }

      List<List<EventTicketDto>> ticketLists = [
        tickets.entryTickets,
        tickets.coverTickets,
        tickets.entryCoverTickets,
      ];
      print(ticketLists.length);

      List<int> nonEmptyIndexes =
          List.generate(ticketLists.length, (index) => index)
              .where((index) => ticketLists[index].isNotEmpty)
              .toList();
      print(nonEmptyIndexes);
      emit(state.copyWith(
          ticketLists: ticketLists,
          nonEmptyIndexes: nonEmptyIndexes,
          tickets: tickets,
          isLoading: false,
          isSuccess: true,
          tabsTobeCreated: tabs));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
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
      fetchEventTickets(id: id);

      emit(state.copyWith(
        event: r,
      ));
    });
  }

  void createBooking() async {
    emit(state.copyWith(isLoading: true));
    final List<Map<String, dynamic>> tickets = state.ticketLists
        .expand(
            (tabTickets) => tabTickets) // Flatten all tabs into a single list
        .where((ticket) =>
            ticket.currentTicketsCount != 0) // Filter non-zero tickets
        .map((ticket) => {
              'id': ticket.id,
              'noOfTickets': ticket.currentTicketsCount,
            })
        .toList();

    final response = await state.eventRepository.createBooking(
        eventId: state.event!.id,
        tickets: tickets,
        coupon: state.coupon,
        couponCode: state.couponCode);

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
      if (state.totalPrice < response.value) {
        priceAfterCouponApplied = 0;
      } else {
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
