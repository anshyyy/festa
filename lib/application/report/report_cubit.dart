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

  void onReview()async {
    if (state.reportDescController.text.trim().isEmpty) {
      state.reportDescController.clear();
      return;
    }
    if (state.selectedTags.isEmpty) {
      return;
    }
    if (state.rating == 0) {
      return;
    }
    emit(state.copyWith(isLoading: true));

    await state.userRepository.review(
      type: state.type, 
      id: state.id,
      msg: state.reportDescController.text.trim(),
      tags: state.selectedTags,
      rating: state.rating,
    );
    emit(state.copyWith(isLoading: false,isSuccess: true));
  }

  void onRatingChanged(double rating) {
    emit(state.copyWith(rating: rating));
  }

  void onTagSelected(String tag) {
    if (state.selectedTags.contains(tag)) return;
    emit(state.copyWith(selectedTags: [...state.selectedTags, tag]));
  }

  void onTagUnSelect(String tag) {
    emit(state.copyWith(
        selectedTags: state.selectedTags.where((t) => t != tag).toList()));
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
