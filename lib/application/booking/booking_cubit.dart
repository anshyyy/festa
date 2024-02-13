import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState.initial());
  
  void addStandardTicket(){
    emit(state.copyWith(standardTicketCount :state.standardTicketCount+1));
  }

  void removeStandardTicket(){
    emit(state.copyWith(standardTicketCount :state.standardTicketCount-1));
  }

  void addEarlyBirdTicket(){
    emit(state.copyWith(earlyBirdTicketCount :state.earlyBirdTicketCount+1));
  }

  void removeEarlyBirdTicket(){
    emit(state.copyWith(earlyBirdTicketCount :state.earlyBirdTicketCount-1));
  }
}
