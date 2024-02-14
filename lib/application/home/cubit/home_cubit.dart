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

  void onChipChange({required String id}) {
    final selectedChip = state.exploreList.where((element) =>
        element['id'].toString().toLowerCase() == id.toString().toLowerCase());

    List<Map<String, dynamic>> temp = state.exploreList.map((e) {
      if (e['id'].toString().toLowerCase() == id.toString().toLowerCase()) {
        e['isSelected'] = true;
      } else {
        e['isSelected'] = false;
      }
      return e;
    }).toList();

    emit(state.copyWith(exploreList: temp, noUse: !state.noUse));
  }

  void toggleLocationDialog(){
    emit(state.copyWith(showLocationDialog: !state.showLocationDialog));
  }

  void updateLocation({required String city}){
    emit(state.copyWith(city: city));
  }
}
