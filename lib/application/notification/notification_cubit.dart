import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/notification/notification_repository.dart';
import '../../infrastructure/notification/dtos/notification/notification_dto.dart';
import '../../infrastructure/notification/i_notification_repository.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(super.initialState);

  void init() async {
    emit(state.copyWith(isLoading: true));
    final response = await state.notificationRepository.getNotification();

    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailed: true,
        isSuccessful: false,
        responseMsg: l,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isFailed: false,
        isSuccessful: true,
        lsOfNotification: r,
      ));
    });
  }

  void emitFromAnywhere({required NotificationState state}) async {
    emit(state);
  }
}
