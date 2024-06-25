import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user/user_repository.dart';
import '../../infrastructure/user/i_user_repository.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(super.initialState);

  void init() async {
    emit(state.copyWith(type: state.type));
  }

  void onSubmit() async {
    if (state.reportDescController.text.trim().isEmpty) {
      state.reportDescController.clear();
      return;
    }

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500));

    final res = await state.userRepository.report(
      type: state.type,
      id: state.id,
      msg: state.reportDescController.text.trim(),
    );

    if (res) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isFailure: true,
      ));
    }
  }

  void emitFromAnywhere({required ReportState state}) {
    emit(state);
  }
}
