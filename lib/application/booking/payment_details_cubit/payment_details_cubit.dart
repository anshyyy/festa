import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../domain/event/event_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/dtos/event_booking_details/event_booking_details_dto.dart';
import '../../../infrastructure/event/i_event_repository.dart';

part 'payment_details_state.dart';
part 'payment_details_cubit.freezed.dart';

class PaymentDetailsCubit extends Cubit<PaymentDetailsState> {
  PaymentDetailsCubit(super.initialState);
  void init() {
    calculateTotalAmount();
    fetchEventDetails();

    state.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    state.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    state.razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void calculateTotalAmount() {
    double totalAmount = 0;
    for (var element in state.eventBookingDetails.eventTicketDetails) {
      totalAmount += element.noOfTickets * element.price;
    }
    emit(state.copyWith(totalAmount: totalAmount));
  }

  void fetchEventDetails() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    Either<dynamic, EventDto> res = await state.eventRepository
        .getEventDetails(eventId: state.eventBookingDetails.eventDetails.id);
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

  void onBookingPayment() {
    emit(state.copyWith(isLoading: true));
    if (state.eventBookingDetails.razorpayOrderId != null) {
      String razorpayKey = state.razorPayApiKey;
      var options = {
        'key': razorpayKey,
        'name': 'Festa',
        'order_id': state.eventBookingDetails.razorpayOrderId,
        'prefill': {'contact': state.user!.phoneNumber},
      };

      try {
        state.razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      emit(state.copyWith(
        isPaymentSuccess: true,
        isPaymentFailure: false,
        isLoading: false,
      ));
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    final response = await state.eventRepository
        .fetchPaymentStatusById(bookingId: state.eventBookingDetails.bookingId);
    if (!response.isDone) {
      emit(state.copyWith(
        isPaymentSuccess: true,
        isPaymentFailure: false,
        isPaymentPending: false,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        isPaymentSuccess: true,
        isPaymentFailure: false,
        isPaymentPending: true,
        isLoading: false,
      ));
    }
  }

  void handlePaymentError(PaymentFailureResponse response) {
    emit(state.copyWith(
      isPaymentSuccess: false,
      isPaymentFailure: true,
      isLoading: false,
    ));
  }

  handleExternalWallet() {}
}
