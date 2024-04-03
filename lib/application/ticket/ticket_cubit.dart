import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user/user_repository.dart';
import '../../infrastructure/user/dtos/user_tickets/user_tickets_dto.dart';
import '../../infrastructure/user/i_user_repository.dart';

part 'ticket_cubit.freezed.dart';
part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit(super.initialState);

  void showTransactionDetails({required int id}) {
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
}
