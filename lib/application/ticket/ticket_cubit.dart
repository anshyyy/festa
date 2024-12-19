import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../domain/core/services/analytics_service/analytics_service.dart';
import '../../domain/event/event_repository.dart';
import '../../domain/user/user_repository.dart';
import '../../infrastructure/core/dtos/cover/cover_charge_details.dart';
import '../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
import '../../infrastructure/event/dtos/cover_balance_history/cover_balance_history_dto.dart';
import '../../infrastructure/event/i_event_repository.dart';
import '../../infrastructure/user/dtos/user_tickets/user_tickets_dto.dart';
import '../../infrastructure/user/i_user_repository.dart';

part 'ticket_cubit.freezed.dart';
part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit(super.initialState);

  void showTransactionDetails({required int id, bool isHistory = false}) {
    if (isHistory) {
      final updated = state.userTickets!.bookedTicketsHistory.map((e) {
        if (e.id == id) {
          return e.copyWith(showTicketDetails: !e.showTicketDetails);
        }
        return e;
      }).toList();
      emit(state.copyWith(
          userTickets: UserTicketsDto(
              bookedTicketsHistory: updated,
              upcomingTickets: state.userTickets!.upcomingTickets)));
    } else {
      final updated = state.userTickets!.upcomingTickets.map((e) {
        if (e.id == id) {
          return e.copyWith(showTicketDetails: !e.showTicketDetails);
        }
        return e;
      }).toList();
      emit(state.copyWith(
          userTickets: UserTicketsDto(
              bookedTicketsHistory: state.userTickets!.bookedTicketsHistory,
              upcomingTickets: updated)));
    }
  }

  Future<void> fetchCoverBalance({required int bookingId}) async {
    try {
      emit(state.copyWith(isCoverLoading: true));
      double remainingAmount =
          await state.eventRepository.fetchCoverBalance(bookingId: bookingId);
      //print("remaining amoutn $remainingAmount");
      int indexToUpdate = state.userTickets!.upcomingTickets
          .indexWhere((b) => b.id == bookingId);

     // print(state.userTickets!.upcomingTickets);
      if (indexToUpdate != -1) {
        BookedTicketDetailsDto updatedTicket = state
            .userTickets!.upcomingTickets[indexToUpdate]
            .copyWith(remainingAmount: remainingAmount);

        // Create a copy of the ticket list with the updated ticket
        List<BookedTicketDetailsDto> updatedTickets =
            List.from(state.userTickets!.upcomingTickets);
        updatedTickets[indexToUpdate] = updatedTicket;
      //  print("updated tickets : $updatedTickets");

        // Emit the new state with the updated ticket list
        emit(state.copyWith(
            userTickets:
                state.userTickets!.copyWith(upcomingTickets: updatedTickets),
            isCoverLoading: false));
      }
    } catch (e) {
  //    print(e);
      emit(state.copyWith(isFailure: true, isCoverLoading: false));
    }
  }

  void fetchCoverBalanceHistory({required int bookingId}) async {
    emit(state.copyWith(isLoading: true));
    Either<dynamic, List<CoverBalanceHistoryDto>> res = await state
        .eventRepository
        .getCoverBalanceHistory(bookingId: bookingId);
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
        coverHistory: r,
      ));
    });
  }

  void shareTicket() async {
    emit(state.copyWith(isShareEnabled: false));
    await Future.delayed(const Duration(milliseconds: 10));
    final image = await state.widgetsToImageController.capture();
    if (image != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/widget_image.png';
      await File(imagePath).writeAsBytes(image);

      await Share.shareXFiles([XFile(imagePath)]);
    }
    emit(state.copyWith(isShareEnabled: true));
  }

  void showTicketHistory({required bool flag}) {
    emit(state.copyWith(showTicketHistory: flag));
  }

  void init({int? bookingId}) async{
   await fetchAllUserTickets();
   if(bookingId != null){    
   await fetchCoverBalance(bookingId:bookingId);
   }
   
    state.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    state.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    final response = await state.eventRepository.fetchPaymentStatusByIdForCover(
        bookingId: int.parse(state.coverChargeDetails!.bookingId),
        coverId: int.parse(state.coverChargeDetails!.id.toString()));

    if (!response.isDone) {
      emit(state.copyWith(
        isPaymentSuccess: false,
        isPaymentFailure: false,
        isPaymentPending: true,
        isAddCoverLoading: false,
      ));
    } else {
      AnalyticsService().logEvent(eventName: 'payment_success', paras: {
        'order_id': state.coverChargeDetails?.razorpayId,
      });
      emit(state.copyWith(
        isPaymentSuccess: true,
        isPaymentFailure: false,
        isPaymentPending: false,
        isAddCoverLoading: false,
      ));
    }
  }

  void handlePaymentError(PaymentFailureResponse response) {
    AnalyticsService().logEvent(eventName: 'payment_failed', paras: {
      'order_id': state.coverChargeDetails?.razorpayId,
      'error': response.toString(),
    });
    emit(state.copyWith(
      isPaymentSuccess: false,
      isPaymentFailure: true,
      isLoading: false,
    ));
  }

  void addCoverBalance({
    required String message,
    required int bookingId,
    required int coverAmount,
    required String userPhoneNumber,
  }) async {
    try {
      emit(state.copyWith(isAddCoverLoading: true));
  
      CoverChargeDetails response = await state.eventRepository.addCoverBalance(
          note: message, coverAmount: coverAmount, bookingId: bookingId);
//      print(response);

      emit(state.copyWith(coverChargeDetails: response));

      String razorpayKey = state.razorPayApiKey;
      var options = {
        'key': razorpayKey,
        'name': 'Festa',
        'order_id': response.razorpayId,
        'prefill': {'contact': userPhoneNumber},
      };
      AnalyticsService().logEvent(eventName: 'payment_init', paras: {
        'order_id': response.razorpayId,
      });
      try {
        state.razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
    //  print(e);
      emit(state.copyWith(
        isPaymentSuccess: false,
        isPaymentFailure: true,
        isAddCoverLoading: false,
      ));
    }
  }

  Future<void> fetchAllUserTickets() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.userRepository.fetchAllUserTickets();

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        userTickets: r,
      ));
      for (var booking in r.upcomingTickets) {
        if (booking.eventDetails.coverChargeEnabled) {
          fetchCoverBalance(bookingId: booking.id);
        }
      }
    });
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void showHistoryTicket({required BookedTicketDetailsDto ticket}) {
    emit(state.copyWith(shoHistoryTicketDetails: true, historyTicket: ticket));
  }

  void hideHistoryTicket() {
    emit(state.copyWith(shoHistoryTicketDetails: false, historyTicket: null));
  }
}
