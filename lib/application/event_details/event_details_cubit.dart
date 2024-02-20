import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/event/event_repository.dart';
import '../../infrastructure/event/i_event_repository.dart';

part 'event_details_state.dart';
part 'event_details_cubit.freezed.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(super.initialState);

  void init({required int id}) async {
    
  }
}
