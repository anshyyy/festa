import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/event/event_repository.dart';
import '../../../infrastructure/event/dtos/event/event_dto.dart';
import '../../../infrastructure/event/i_event_repository.dart';

part 'payment_status_state.dart';
part 'payment_status_cubit.freezed.dart';

class PaymentStatusCubit extends Cubit<PaymentStatusState> {
  PaymentStatusCubit(super.initialState);

  void init() {
    fetchEventDetails();
  }
  void fetchEventDetails() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 300));
    Either<dynamic, EventDto> res =
        await state.eventRepository.getEventDetails(eventId: state.eventId);
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
}
