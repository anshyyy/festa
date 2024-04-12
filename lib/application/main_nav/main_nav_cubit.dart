import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_nav_state.dart';
part 'main_nav_cubit.freezed.dart';

class MainNavCubit extends Cubit<MainNavState> {
  MainNavCubit(super.initialState);

  void onIndexChange({required int index}) async{
    emit(state.copyWith(currentIndex: index,));

    // emit(state.copyWith(currentIndex: index, isTabLoading: true));
    // await Future.delayed(const Duration(seconds: 2));
    // emit(state.copyWith(currentIndex: index, isTabLoading: false));
    
  }
}
