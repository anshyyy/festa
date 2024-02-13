import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_state.dart';
part 'ticket_cubit.freezed.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketState.initial());

  void showTransactionDetails() {
    emit(state.copyWith(showTicketDetails: !state.showTicketDetails));
  }

  void showTicketHistory({required bool flag}){
    emit(state.copyWith(showTicketHistory: flag));
  }
}
