import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_card_state.dart';
part 'event_card_cubit.freezed.dart';

class EventCardCubit extends Cubit<EventCardState> {
  EventCardCubit() : super(const EventCardState.initial());
}
