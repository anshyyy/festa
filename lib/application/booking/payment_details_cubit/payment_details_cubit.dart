import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../domain/core/services/analytics_service/analytics_service.dart';
import '../../../domain/event/event_repository.dart';
import '../../../infrastructure/auth/dtos/user_dto.dart';
import '../../../infrastructure/core/dtos/cover/cover_charge_details.dart';
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

  Future<void> getPalette() async {
    final palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(state.event?.coverImage ?? ''),
    );
    print(palette);
    emit(state.copyWith(
      palette: palette,
      isLoading: false,
    ));
  }

  void calculateTotalAmount() {
    double totalAmount = 0;
    for (var element in state.eventBookingDetails.eventTicketDetails) {
      totalAmount += (element.noOfTickets * element.price) +
          (element.coverCharge * element.noOfTickets);
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
            )), (r) async {
      emit(state.copyWith(
        isSuccess: true,
        isFailure: false,
        event: r,
      ));
      await getPalette();
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
      AnalyticsService().logEvent(eventName: 'payment_init', paras: {
        'order_id': state.eventBookingDetails.razorpayOrderId,
      });
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

  void handlePaymentSuccess(PaymentSuccessResponse? response) async {
    // final response = await state.eventRepository
    //     .fetchPaymentStatusById(bookingId: state.eventBookingDetails.bookingId);
    if (!true) {
      emit(state.copyWith(
        isPaymentSuccess: false,
        isPaymentFailure: false,
        isPaymentPending: true,
        isLoading: false,
      ));
    } else {
      if (state.eventBookingDetails.razorpayOrderId?.isNotEmpty ?? true) {
        AnalyticsService().logEvent(eventName: 'payment_success', paras: {
          'order_id': state.eventBookingDetails.razorpayOrderId,
        });
      } else {
        AnalyticsService().logEvent(eventName: 'free_ticket_success', paras: {
          'order': state.eventBookingDetails,
        });
      }
      emit(state.copyWith(
        isPaymentSuccess: true,
        isPaymentFailure: false,
        isPaymentPending: false,
        isLoading: false,
      ));
    }
  }

  void handlePaymentError(PaymentFailureResponse response) {
    AnalyticsService().logEvent(eventName: 'payment_failed', paras: {
      'order_id': state.eventBookingDetails.razorpayOrderId,
      'error': response.toString(),
    });
    emit(state.copyWith(
      isPaymentSuccess: false,
      isPaymentFailure: true,
      isLoading: false,
    ));
  }

  handleExternalWallet() {}
}
