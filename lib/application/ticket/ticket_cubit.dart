import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../domain/user/user_repository.dart';
import '../../infrastructure/event/dtos/booked_ticket_details/booked_ticket_details_dto.dart';
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

  void init() {
    fetchAllUserTickets();
  }

  void fetchAllUserTickets() async {
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
    });
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void showHistoryTicket({required BookedTicketDetailsDto ticket}) {
    emit(state.copyWith(shoHistoryTicketDetails: true, historyTicket: ticket));
  }

  void hideHistoryTicket(){
    emit(state.copyWith(shoHistoryTicketDetails: false, historyTicket: null));

  }
}
