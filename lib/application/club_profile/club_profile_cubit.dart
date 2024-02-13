import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_profile_state.dart';
part 'club_profile_cubit.freezed.dart';

class ClubProfileCubit extends Cubit<ClubProfileState> {
  ClubProfileCubit() : super(ClubProfileState.initial()){
    state.parentController.addListener(() { 
      print(state.parentController.position.extentAfter);
    });

    state.scrollController.addListener(() { 
      emit(state.copyWith(isAtTop: state.scrollController.offset<1));
    });
  }

  void calculateHeight(){
    double imageHeight = state.key.currentContext!.size!.height;
    // double imageWidth = state.key.currentContext!.size!.height;

    emit(state.copyWith(
      viewPortHeight: imageHeight
    ));
  }

  void onCarouselChange({required int index}){
    emit(state.copyWith(currentImageIndex: index));
  }

  void onControllerChange(ScrollController controller){
    emit(state.copyWith(parentController: controller));
  }

}
