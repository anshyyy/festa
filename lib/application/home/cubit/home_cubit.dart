import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/constants/asset_constants.dart';
import '../../../domain/core/constants/string_constants.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  void init() {}

  void onCarouselChange({required int index}) {
    emit(state.copyWith(selectedImageIndex: index));
  }

  
}
